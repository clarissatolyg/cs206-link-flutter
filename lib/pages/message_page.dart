import 'package:flutter/material.dart';
import 'package:link_flutter/utils/constant.dart';
import 'package:link_flutter/components/box_svg_button.dart';
import 'package:link_flutter/components/message_activity_card.dart';
import 'package:link_flutter/components/message_listtile.dart';
import 'package:link_flutter/components/message_title.dart';
import 'package:link_flutter/components/search_textfield.dart';
import 'package:link_flutter/pages/message_chat_page.dart';
import 'package:link_flutter/dummy_data/home_page_json.dart';
import 'package:link_flutter/dummy_data/message_page_json.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  void initState() {
    super.initState();
    fetchActivities(); // Initial fetch of activities
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: getAppBar(context),
      body: getBody(context, size),
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Messages",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              BoxSvgButton(
                onTap: () {},
                svgPicture: "assets/images/filter.svg",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody(BuildContext context, Size size) {
    // Sort activities based on isUnread status
    activities.sort((a, b) {
      if (a["isUnread"] && !b["isUnread"]) {
        return -1; // 'a' should come before 'b'
      } else if (!a["isUnread"] && b["isUnread"]) {
        return 1; // 'b' should come before 'a'
      } else {
        return 0; // 'a' and 'b' are equal
      }
    });
    return ListView(
      children: [
        MessageTitle(
          title: "Activities",
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(activities.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? defaultPadding : defaultPadding,
                    right:
                        index == (activities.length - 1) ? defaultPadding : 0),
                child: MessageActivityCard(
                  itemList: activities[index],
                  onPressed: () {
                    _goToMessageChatPage(context, index);
                  },
                ),
              );
            }),
          ),
        ),
        MessageTitle(
          title: "Messages",
        ),
        Column(
          children: List.generate(activities.length, (index) {
            return MessageListTitle(
              onPressed: () {
                _goToMessageChatPage(context, index);
              },
              itemList: activities[index],
            );
          }),
        ),
        SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }

  Future<void> _goToMessageChatPage(BuildContext context, int index) async {
    matchedUser = [];
    Map<String, dynamic> currentProfile = activities[index];
    Map<String, dynamic> chatProfile = {
      "imageUrl": currentProfile["imageUrl"],
      "username": currentProfile["username"],
      "message": ["Send a message!"],
      "dateTime": "1 min",
      "isUnread": true,
      "unread": "0",
    };
    var existingProfile = discoverItems.firstWhere(
    (activity) =>
        activity["username"] == chatProfile["username"] &&
        activity["likedYou"] == true,
    orElse: () => null, // Provide a default value or handler if no match is found
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

      // If found, add the existing profile to matchedUser
      currentProfile["isUnread"] = false;

    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              MessageChatPage(), // Replace NewPage with your target page
        ));
      fetchActivities(); // Assuming fetchActivities updates your state and UI
  }

  Future<void> fetchActivities() async {
    List<Map<String, dynamic>> fetchedActivities = activities;

    // Simulate fetching data from a network source with a Future.delayed
    // await Future.delayed(Duration(seconds: 1)); // Simulate network delay

    // Update your activities list with the fetched data
    setState(() {
      activities = fetchedActivities;
    });
  }
}
