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

  List items = [];

  @override
  void initState() {
    super.initState();
    items = discoverItems;
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
                      "Phnom Penh",
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
      height: MediaQuery.of(context).size.height *
          0.6, // Adjust the height as necessary.
      width: double.infinity,
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }

  Widget _buildProfileInfo(Map<String, dynamic> profile) {
    List<String> instagramImages = profile['instagram'].toList();
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
          _buildCircleButton("assets/images/link.svg", () => _goToNextProfile(),
              isLarge: true),
          _buildCircleButton("assets/images/like.svg",
              () => _openMessageChatModal(context, profile)),
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
    } else {}
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
                  onSend: (_) => _sendMessage(_, profile),
                  // Additional actions can be added here
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _goToMessageChat(Map<String, dynamic> profile) {
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
    var existingProfile = activities.firstWhere(
      (message) => message["username"] == chatProfile["username"],
    );

    if (existingProfile != null) {
      // If found, add the existing profile to matchedUser
      matchedUser.add(existingProfile);
    } else {
      // If not found, check if it doesn't exist in 'activities' and then proceed
      if (!activities
          .any((activity) => activity["username"] == chatProfile["username"])) {
        activities.insert(0, chatProfile);
      }
      // Add the chatProfile to matchedUser
      matchedUser.add(chatProfile);
    }
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MessageChatPage()),
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
    activities.insert(0, matchedUser[0]);
    log(activities.toString());
    log(matchedUser.toString());
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MessageChatPage()),
    );
    _goToNextProfile();
    fetchActivities();
  }

  Future<void> fetchActivities() async {
    List<Map<String, dynamic>> fetchedActivities = activities;
    // await Future.delayed(Duration(seconds: 1)); // simulate network delay with a Future.delayed

    // Update your activities list with the fetched data
    setState(() {
      activities = fetchedActivities;
    });
  }
}
