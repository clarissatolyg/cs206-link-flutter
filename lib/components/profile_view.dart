import 'package:flutter/material.dart';
import 'package:link_flutter/theme/color.dart';
import 'package:link_flutter/utils/constant.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:link_flutter/components/circle_button.dart';
import 'package:link_flutter/components/box_svg_button.dart';
import 'package:link_flutter/pages/message_chat_page.dart';
import 'package:link_flutter/dummy_data/match_page_json.dart';
import 'package:link_flutter/dummy_data/message_page_json.dart';
import 'package:link_flutter/dummy_data/home_page_json.dart';
import 'dart:developer';

class ProfileView extends StatefulWidget {
  final String userId;
  const ProfileView({Key? key, required this.userId}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late final PageController _pageController;

  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();

    items = todayMatchItems +
        yesterdayMatchItems; // Combine today's and yesterday's match items
    int initialPage = items.indexWhere((item) =>
        item['userId'] ==
        widget.userId); // Find the index of the profile with the current userId
    if (initialPage == -1) {
      initialPage =
          0; // Check if the user was found. If not, default to the first profile.
    }
    _pageController = PageController(
        initialPage:
            initialPage); // Initialize the PageController with the determined initialPage
  }

  @override
  void dispose() {
    // Dispose of the PageController when not needed
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // log(widget.userId);
    // Find the index of the profile with the current userId
    int initialPage =
        items.indexWhere((item) => item['userId'] == widget.userId);
    // Check if the user was found. If not, default to the first profile.
    if (initialPage == -1) initialPage = 0;

    final Map<String, dynamic> profile = items.firstWhere(
      (item) => item['userId'] == widget.userId,
      orElse: () => {},
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
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

  Widget _buildProfilePage(Map<String, dynamic> profile) {
    List<String> instagramImages = profile['instagram'].toList();
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildProfileImage(profile['imageUrl'], context),
        _buildProfileInfo(profile),
        Text("Instagram",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        _buildInstagramImages(instagramImages),
        _buildActionButtons(context, profile),
      ],
    );
  }

  Widget _buildProfileImage(String imageUrl, BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          0.6, // Adjust the height as necessary.
      width: double.infinity,
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }

  Widget _buildProfileInfo(Map<String, dynamic> profile) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${profile['name']}, ${profile['age']}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text("${profile['passion']}, ${profile['distance']}",
              style: TextStyle(fontSize: 16)),
          SizedBox(height: 8.0),
          Text("Interests",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          _buildInterests(profile),
          SizedBox(height: 8.0),
          Text("Music Genre",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          _buildMusicGenre(profile),
          SizedBox(height: 4.0),
          Text(profile['quote'], style: TextStyle(fontSize: 12)),
          SizedBox(height: 4.0),
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

  Widget _buildActionButtons(
      BuildContext context, Map<String, dynamic> profile) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCircleButton(
              "assets/images/cross.svg", () => _goToNextProfile(),
              isLarge: false),
          // _buildCircleButton("assets/images/link.svg", () => _goToNextProfile(),
          //     isLarge: true),
          _buildCircleButton("assets/images/like.svg",
              () => _openMessageChatModal(context, profile),
              isLarge: false),
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
                Navigator.of(context)
                    .pop(); // Return to "people who like you" page
              },
            ),
          ],
        );
      },
    );
  }

  void _openMessageChatModal(
      BuildContext context, Map<String, dynamic> profile) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // This allows the sheet to expand to full height
      builder: (context) {
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
                MessageBar(
                  onSend: (_) => _sendMessage(_, context, profile),
                  // Additional actions can be added here
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _goToMessageChat(BuildContext context, Map<String, dynamic> profile) {
    Map<String, dynamic> chatProfile = {
      "imageUrl": profile["imageUrl"],
      "username": profile["username"],
      "message": [
        {
          "text": "Send me a message!",
          "isSender": false,
          "dateTime": DateTime.now(),
        }
      ],
      "dateTime": "1 min",
      "isUnread": false,
      "unread": "0",
    };
    matchedUser = [];
    var existingProfile = discoverItems.firstWhere(
      (message) => message["username"] == chatProfile["username"],
    );
    log(existingProfile.toString());

    if (existingProfile != null) {
      // If found, add the existing profile to matchedUser
      matchedUser.add(existingProfile);
    } else {
      // If not found, check if it doesn't exist in 'activities' and then proceed
      if (!discoverItems
          .any((item) => item["username"] == chatProfile["username"])) {
        discoverItems.insert(0, chatProfile);
      }
      // Add the chatProfile to matchedUser
      matchedUser.add(chatProfile);
    }
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MessageChatPage()),
    );
  }

  void _sendMessage(
      String text, BuildContext context, Map<String, dynamic> profile) {
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
                Navigator.of(context).pop(); // Close the dialog
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
      "message": [
        {
          "text": "Send me a message!",
          "isSender": false,
          "dateTime": DateTime.now(),
        }
      ],
      "dateTime": "1 min",
      "isUnread": false,
      "unread": "0",
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
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MessageChatPage()),
    );
    fetchActivities();
  }

  Future<void> fetchActivities() async {
    List<Map<String, dynamic>> fetchedItems = discoverItems;
    // await Future.delayed(Duration(seconds: 1)); // simulate network delay with a Future.delayed

    // Update your activities list with the fetched data
    setState(() {
      discoverItems = fetchedItems;
    });
  }
}
