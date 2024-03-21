import 'package:flutter/material.dart';
import 'package:link_flutter/utils/constant.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:link_flutter/components/box_svg_button.dart';
import 'package:link_flutter/components/message_title.dart';
import 'package:link_flutter/components/message_chat_activity_card.dart';
import 'package:link_flutter/pages/message_page.dart';
import 'package:link_flutter/dummy_data/message_page_json.dart';
import 'dart:developer';

class MessageChatPage extends StatefulWidget {
  const MessageChatPage({Key? key}) : super(key: key);

  @override
  State<MessageChatPage> createState() => _MessageChatPageState();
}

class _MessageChatPageState extends State<MessageChatPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final now = new DateTime.now();

    return Scaffold(
      appBar: getAppBar(),
      body: getBody(size, now),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(you.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? defaultPadding : defaultPadding,
                        right: index == (you.length - 1)
                            ? defaultPadding
                            : defaultPadding),
                    child: MessageChatActivityCard(
                      itemList: you[index],
                    ),
                  );
                }),
              ),
              Text(
                "Chat",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(matchedUser.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? defaultPadding : 0,
                        right: index == (matchedUser.length - 1)
                            ? defaultPadding
                            : 0),
                    child: MessageChatActivityCard(
                      itemList: matchedUser[index],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody(Size size, DateTime now) {
    List<Widget> chatWidgets = [];

    // Temporary variable to hold the date of the last message processed
    DateTime? lastDate;
    var existingProfile = activities.firstWhere(
      (activity) => activity["username"] == matchedUser[0]["username"]
    );

    for (var message in existingProfile['message']) {
      // Extract message details
      final text = message["text"];
      final isSender = message["isSender"];
      final dateTime = message["dateTime"];

      // Check if the date has changed since the last message
      if (lastDate == null || lastDate.day != dateTime.day) {
        chatWidgets.add(DateChip(date: dateTime)); // Add DateChip for new date
      }

      // Add BubbleNormal for the current message
      chatWidgets.add(BubbleNormal(
        text: text,
        isSender: isSender,
        color: isSender ? Color(0xFFE8E8EE) : Color(0xFF1B97F3),
        tail: true,
        textStyle: TextStyle(
          fontSize: 12,
          color: isSender ? Colors.black : Colors.white,
        ),
      ));

      lastDate = dateTime; // Update lastDate to the current message's date
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 15),
              ...chatWidgets, // Spread chatWidgets into the ListView
            ],
          ),
        ),
        // MessageBar widget here
        MessageBar(
          onSend: (_) => _sendMessage(_, existingProfile),
        )
      ],
    );
  }

  void _sendMessage(String text, Map<String, dynamic> existingProfile) async {
    existingProfile['message'].add({
      "text": text,
      "isSender": true,
      "dateTime": DateTime.now(),
    });
    var currentProfile = existingProfile;
    activities.remove(existingProfile);
    // log('Sending message: $text');
    activities.insert(0, currentProfile);
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
