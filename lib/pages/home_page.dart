import 'package:flutter/material.dart';
import 'package:link_flutter/utils/constant.dart';
import 'package:link_flutter/theme/color.dart';
import 'package:link_flutter/components/circle_button.dart';
import 'package:link_flutter/components/box_svg_button.dart';
import 'package:link_flutter/dummy_data/home_page_json.dart';
import 'package:link_flutter/dummy_data/message_page_json.dart';

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
          Text(profile['quote'], style: TextStyle(fontSize: 14)),
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
          if (profile['likedYou'] == true)
            _buildCircleButton(
              "assets/images/like.svg",
              () => _showTopSnackBar(context, profile,
                  "It's a link!\nHooray! You have matched with ${profile['name']}!"),
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
        // Calculate extra padding, adjust this value as needed
        final double extraBottomPadding = 20.0;
        // Existing padding plus extra bottom padding
        final EdgeInsets effectivePadding = MediaQuery.of(context)
            .viewInsets
            .copyWith(
                bottom: MediaQuery.of(context).viewInsets.bottom +
                    extraBottomPadding);
        return Padding(
          padding:
              effectivePadding, // Adjusts for keyboard and adds extra space
          child: Container(
            padding: EdgeInsets.all(
                16.0),
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
                  profile["name"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                _messageInputOrBrowsingButton(profile),
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

    double topPadding =
        MediaQuery.of(context).padding.top; // Get height of dynamic island

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(0, 4))
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(children: [
                Container(
                    height: topPadding,
                    color: Colors
                        .transparent), // Transparent container to push the content to below the dynamic island
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(4),
                        height: 41,
                        width: 41,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(width: 2, color: Colors.white),
                            image: DecorationImage(
                                image: NetworkImage(profile['imageUrl']),
                                fit: BoxFit.cover))),
                    SizedBox(width: 16),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${messageParts[0]}\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              if (messageParts.length > 1)
                                TextSpan(
                                    text: messageParts.sublist(1).join('\n'),
                                    style: TextStyle(fontSize: 18))
                            ]),
                      ),
                    )
                  ],
                )
              ]))),
    );

    // Find the overlay and insert the created entry
    Overlay.of(context).insert(overlayEntry);

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

    discoverItems.insert(0, matchedUser[0]);

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

  Widget _messageInputOrBrowsingButton(Map<String, dynamic> profile) {
    if (messageSent) {
      // If the message has been sent, show the "Keep Browsing" button
      return Column(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width, height: 0),
          Text(messageSent ? "You said:" : "",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(messageSent ? messageController.text : ""),
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
      return Column(children: [
        Text(
          "Introduce yourself",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: defaultSmallPadding),
        TextField(
          controller: messageController,
          decoration: InputDecoration(
            hintText: 'Type a message...',
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              onPressed: () => _sendMessage(messageController.text, profile),
            ),
          ),
          onSubmitted: (text) => _sendMessage(text, profile),
        )
      ]);
    }
  }
}
