import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:link_flutter/utils/constant.dart';
import 'package:link_flutter/theme/color.dart';
import 'package:link_flutter/components/circle_button.dart';
import 'package:link_flutter/components/box_svg_button.dart';
import 'package:link_flutter/pages/message_chat_page.dart';
import 'package:link_flutter/dummy_data/home_page_json.dart';
import 'package:link_flutter/dummy_data/message_page_json.dart';
import 'dart:developer';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();
  bool messageSent = false;

  List items = [];

  @override
  void initState() {
    super.initState();
    items = discoverItems;
  }

  @override
  void dispose() {
    _scrollController
        .dispose(); // Clean up the controller when the widget is disposed.
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: PageView.builder(
        controller: _pageController,
        physics:
            NeverScrollableScrollPhysics(), // This line disables swipe gestures.
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildProfilePage(items[index]);
        },
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            children: [
              Spacer(),
              Expanded(
                // col: heading
                flex: 5,
                child: Column(
                  children: [
                    Text(
                      "Discover",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Singapore",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
              Expanded(
                  // col: filter
                  child: BoxSvgButton(
                onTap: () {},
                svgPicture: "assets/images/filter.svg",
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePage(Map<String, dynamic> profile) {
    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildProfileImage(profile['imageUrl']),
        _buildProfileInfo(profile),
        _buildActionButtons(profile),
      ],
    );
  }

  Widget _buildProfileImage(String imageUrl) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.6,
      // width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(), // Loading animation
          FadeInImage(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            placeholder: AssetImage(
                'assets/images/transparent.png'), // Transparent placeholder
            image: NetworkImage(imageUrl), // Actual image URL
            fit: BoxFit.cover,
            fadeInDuration: Duration(
                milliseconds: 200), // Duration of the fade-in animation
            fadeInCurve: Curves.easeIn, // Curve for the fade-in animation
            // You can adjust other properties of FadeInImage as needed
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo(Map<String, dynamic> profile) {
    List<String> instagramImages = profile['instagram'].toList();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "${profile['name']}, ${profile['age']} ",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              profile['likedYou'] == true
                  ? Text("liked you!",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: primary))
                  : Container()
            ],
          ),
          SizedBox(height: 8.0),
          Text("${profile['passion']}, ${profile['distance']}",
              style: TextStyle(fontSize: 16)),
          SizedBox(height: 4.0),
          Text("Bio",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(profile['quote'], style: TextStyle(fontSize: 12)),
          SizedBox(height: 4.0),
          SizedBox(height: 8.0),
          Text("Interests",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          _buildInterests(profile),
          SizedBox(height: 8.0),
          Text("Music Genre",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          _buildMusicGenre(profile),
          Text("Instagram",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          _buildInstagramImages(instagramImages),
        ],
      ),
    );
  }

  Widget _buildInterests(Map<String, dynamic> profile) {
    List<String> interests = profile['interests'].split(', ');

    return SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: interests.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Chip(
                label: Text(interests[index]),
                backgroundColor: Colors.white,
                elevation: 1.0,
                shadowColor: black,
                side: BorderSide.none,
              ),
            );
          },
        ));
  }

  Widget _buildMusicGenre(Map<String, dynamic> profile) {
    List<String> genres = profile['musicGenre'].split(', ');
    return SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Chip(
                    label: Text(genres[index]),
                    backgroundColor: Colors.white,
                    elevation: 1.0,
                    shadowColor: black,
                    side: BorderSide.none));
          },
        ));
  }

  Widget _buildInstagramImages(List<String> instagramImages) {
    return SizedBox(
      height: 100, // Fixed height for the horizontal list.
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: instagramImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(instagramImages[index], fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }

  Widget _buildActionButtons(Map<String, dynamic> profile) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCircleButton(
              "assets/images/cross.svg", () => _goToNextProfile()),
          // _buildCircleButton("assets/images/link.svg", () => _goToNextProfile(),
          //     isLarge: true),
          // _buildCircleButton("assets/images/like.svg",
          //     () => _openMessageChatModal(context, profile)),
          if (profile['likedYou'] == true)
            _buildCircleButton(
              "assets/images/like.svg",
              () => _showTopSnackBar(context, profile,
                  "Yes! It's a match!\n${profile['name']} has liked you!"),
            )
          else
            _buildCircleButton(
              "assets/images/like.svg",
              () => _openMessageChatModal(context, profile),
            ),
        ],
      ),
    );
  }

  Widget _buildCircleButton(String svgPath, VoidCallback onTap,
      {bool isLarge = false}) {
    return CircleButton(
      onTap: onTap,
      bgColor: Color(0xFFCB9CFC),
      shadowColor: black.withOpacity(0.2),
      svgPicture: svgPath,
      svgHeight: isLarge ? 60 : 24,
      svgWidth: isLarge ? 60 : 24,
      height: isLarge ? 99 : 60,
      width: isLarge ? 99 : 60,
    );
  }

  void _goToNextProfile() {
    if (_pageController.page != null &&
        _pageController.page! < items.length - 1) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    } else {
      _showNoMoreProfilesDialog();
    }
  }

  void _showNoMoreProfilesDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Oops..."),
          content: Text("Out of swipes! You've reached the end of the list."),
          actions: <Widget>[
            TextButton(
              child: Text("Return"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _openMessageChatModal(
      BuildContext context, Map<String, dynamic> profile) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // This allows the sheet to expand to full height
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets, // Adjusts for keyboard
          child: Container(
            padding: EdgeInsets.all(defaultPadding / 10),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // To make the bottom sheet fit its content
              children: <Widget>[
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white),
                    image: DecorationImage(
                      image: NetworkImage(profile["imageUrl"]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: defaultSmallPadding),
                Text(
                  profile["username"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: defaultSmallPadding),
                Text(
                  "Introduce yourself",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: defaultSmallPadding),
                // Your MessageBar widget here
                Column(
                  children: [
                    // Other widgets
                    _messageInputOrBrowsingButton(profile),
                    // TextField(
                    //   controller: messageController,
                    //   decoration: InputDecoration(
                    //     hintText: 'Type a message...',
                    //     suffixIcon: IconButton(
                    //       icon: Icon(Icons.send),
                    //       onPressed: () =>
                    //           _sendMessage(messageController.text, profile),
                    //     ),
                    //   ),
                    //   onSubmitted: (_) => _sendMessage(_,
                    //       profile), // Send message when user submits the text field
                    // ),
                  ],
                )
                // MessageBar(
                //   onSend: (_) => _sendMessage(_, profile),
                //   controller:
                //       messageController, // Assign your controller here
                //   // Additional actions can be added here
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showTopSnackBar(BuildContext context, Map<String, dynamic> profile,
      String message) async {
    List<String> messageParts = message.split('\n');

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 30,
        left: 15,
        right: 15,
        child: Material(
          color: Color(0xFFCB9CFC), // Material color
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Color(0xFFCB9CFC),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  spreadRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // To wrap the content in the column
              children: [
                Container(
                  padding: EdgeInsets.all(defaultPadding / 10),
                  height: 41,
                  width: 41,
                  decoration: BoxDecoration(
                    color: Colors.white, // Define the white color
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white),
                    image: DecorationImage(
                      image: NetworkImage(profile[
                          'imageUrl']), // Make sure `img` is a valid URL
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                    width:
                        16), // Give some horizontal space between the container and the text
                Expanded(
                  child: RichText(
                    // Use Expanded to take up the remaining space
                    text: TextSpan(
                      // Default text style applies to all child TextSpans if not overridden
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      children: <TextSpan>[
                        // First line (bold)
                        TextSpan(
                          text: messageParts[0] + '\n', // Add the newline back
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        // Remaining text
                        if (messageParts.length > 1)
                          TextSpan(
                            text: messageParts
                                .sublist(1)
                                .join('\n'), // Join back the remaining parts
                            // No need to specify a style here unless you want to change it from the default
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Find the overlay and insert the created entry
    Overlay.of(context)?.insert(overlayEntry);

    // Automatically remove the overlay after 3 seconds
    Future.delayed(Duration(seconds: 3)).then((_) {
      overlayEntry.remove();
    });

    profile['isMatched'] = true;

    _scrollToTop();
    _goToNextProfile();
    fetchActivities();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0, // Scroll to 0.0 offset (top)
      duration: Duration(milliseconds: 30), // Duration of the scroll
      curve: Curves.easeInOut, // Animation curve
    );
  }

// Usage:

  // void _openLikedYouModal(BuildContext context, Map<String, dynamic> profile) {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text(
  //         '${profile["name"]} has liked you, head over to message inbox to chat now!'),
  //     duration:
  //         Duration(seconds: 2), // The notification will last for a few seconds
  //     behavior: SnackBarBehavior
  //         .floating, // This makes it floating above the bottom of the screen
  //   )
  //       );
  // }

  // void _goToMessageChat(Map<String, dynamic> profile) {
  //   matchedUser = [];
  //   // log(profile["username"]);
  //   var existingProfile = discoverItems.firstWhere(
  //     (item) => item["username"] == profile["username"],
  //   );

  //   matchedUser.add(existingProfile);

  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (context) => MessageChatPage()),
  //   );
  // }

  void _sendMessage(String text, Map<String, dynamic> profile) {
    bool isTextClean = _checkMessageRequirements(text, profile);
    if (isTextClean == true) {
      _goToMessageChatPage(context, text, profile);
    } else {
      _showWarningDialog(context, text, profile);
    }
  }

  bool _checkMessageRequirements(String text, Map<String, dynamic> profile) {
    bool isTextClean = true;

    if (text.isEmpty) {
      isTextClean = false;
    }

    for (var word in cleanList) {
      if (text.contains(word)) {
        isTextClean = false;
      }
    }

    return isTextClean;
  }

  void _showWarningDialog(
      BuildContext context, String text, Map<String, dynamic> profile) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Uh-oh!'),
          content: Text(
              'Your message seems a bit... generic. Spice it up to catch their attention!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // This will close the dialog first.
                // Navigator.of(context) .pop(); // This will close the send chat first first.
                _goToMessageChatPage(context, text, profile);
              },
              child: Text('Send Anyway'),
            ),
          ],
        );
      },
    );
  }

  void _goToMessageChatPage(
      BuildContext context, String text, Map<String, dynamic> profile) async {
    Map<String, dynamic> chatProfile = {
      "imageUrl": profile["imageUrl"],
      "username": profile["username"],
      "name": profile["name"],
      "age": profile["age"],
      "passion": profile["passion"],
      "likedYou": false,
      "isMatched": false,
      "distance": profile["distance"],
      "quote": profile["quote"],
      "interests": profile["interests"],
      "musicGenre": profile["musicGenre"],
      "instagram": profile["instagram"],
      "isUnread": false,
      "unread": "0",
      "message": [],
    };
    if (matchedUser.isEmpty) {
      matchedUser.add(chatProfile);
    } else {
      matchedUser[0] = chatProfile;
    }
    matchedUser[0]['message'].add({
      "text": text,
      "isSender": true,
      "dateTime": DateTime.now(),
    });

    // log('Sending message: $text');
    discoverItems.insert(0, matchedUser[0]);
    // log(activities.toString());
    // log(matchedUser.toString());

    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (context) => MessageChatPage()),
    // );
    
    Navigator.of(context).pop();
    _openMessageChatModal(context, profile);
    fetchMessageController(text);
    fetchActivities();
    _goToNextProfile();
  }

  Future<void> fetchMessageController(String text) async {
    setState(() {
      // Add the message to the list and update the UI
      messageSent = true;
      messageController.text = text;
    });
  }

  Future<void> fetchActivities() async {
    List<Map<String, dynamic>> fetchedItems = discoverItems;
    // await Future.delayed(Duration(seconds: 1)); // simulate network delay with a Future.delayed

    // Update your activities list with the fetched data
    setState(() {
      discoverItems = fetchedItems;
    });
  }

  // Function to reset the message input and hide the browsing button
  void _resetMessageInput() {
    setState(() {
      messageSent = false;
      messageController.clear();
    });
  }

  // Replace your TextField with this method
  Widget _messageInputOrBrowsingButton(Map<String, dynamic> profile) {
    if (messageSent) {
      // If the message has been sent, show the "Keep Browsing" button
      return Column(
        children: [
          Text(messageSent ? "You said:\n" : "",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(messageSent ? "${messageController.text}" : ""),

          // Only show the "Keep Browsing" button if a message has been sent
          if (messageSent)
            ElevatedButton(
              onPressed: () {
                _resetMessageInput(); // Optional: Clear the message input
                Navigator.of(context).pop();
                _goToNextProfile(); // Navigate to the next profile
              },
              child: Text('Keep Browsing'),
            ),
        ],
      );
    } else {
      // If no message has been sent, show the TextField
      return TextField(
        controller: messageController,
        decoration: InputDecoration(
          hintText: 'Type a message...',
          suffixIcon: IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _sendMessage(messageController.text, profile),
          ),
        ),
        onSubmitted: (text) => _sendMessage(text, profile),
      );
    }
  }
}
