import 'package:link_flutter/utils/constant.dart';

List you = [
  {
    "imageUrl": profileUrl,
    "username": "You",
  },
];

List matchedUser = [];

List activities = [
  {
    "imageUrl":
        "https://images.unsplash.com/photo-1535704882196-765e5fc62a53?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJldXRpZnVsJTIwZ2lybHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "username": "Moonchild",
    "message": [
      {
        "text": "Hi there!",
        "isSender": false,
        "dateTime": DateTime.now().subtract(Duration(days: 1)),
      },
      {
        "text": "How are you?",
        "isSender": true,
        "dateTime": DateTime.now(),
      },
      {
        "text": "Sticker 😍",
        "isSender": false,
        "dateTime": DateTime.now().subtract(Duration(minutes: 5)),
      }
    ],
    "dateTime": "1 min",
    "isUnread": false,
    "unread": "0",
  },
  {
    "imageUrl":
        "https://images.unsplash.com/photo-1502323777036-f29e3972d82f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGJldXRpZnVsJTIwcHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "username": "Elizabeth",
    "message": [{
        "text": "Hi there!",
        "isSender": false,
        "dateTime": DateTime.now().subtract(Duration(days: 1)),
      }],
    "dateTime": "19 min",
    "isUnread": true,
    "unread": "2",
  },
  {
    "imageUrl":
        "https://images.unsplash.com/photo-1604004555489-723a93d6ce74?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGJldXRpZnVsJTIwZ2lybHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "username": "Ava",
    "message": [{
        "text": "Ok, See you then.",
        "isSender": false,
        "dateTime": DateTime.now().subtract(Duration(days: 2)),
      }],
    "dateTime": "33 min",
    "isUnread": false,
    "unread": "",
  },
  {
    "imageUrl":
        "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YmV1dGlmdWwlMjBwcm9maWxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "username": "Parker",
    "message": [{
        "text": "Hey! What's up, long time no see?",
        "isSender": false,
        "dateTime": DateTime.now().subtract(Duration(days: 5)),
      }],
    "dateTime": "33 min",
    "isUnread": false,
    "unread": "",
  },
  {
    "imageUrl":
        "https://images.unsplash.com/photo-1536588086516-cf8b058a7aa0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fGJldXRpZnVsJTIwcHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "username": "Chloe",
    "message": [{
        "text": "Thanks",
        "isSender": false,
        "dateTime": DateTime.now().subtract(Duration(days: 5)),
      }],
    "dateTime": "55 min",
    "isUnread": false,
    "unread": "0",
  },
  {
    "imageUrl":
        "https://images.unsplash.com/photo-1541499768294-44cad3c95755?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDl8fGJldXRpZnVsJTIwcHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "username": "Grace",
    "message": [{
        "text": "Hello! How are you?",
        "isSender": false,
        "dateTime": DateTime.now().subtract(Duration(days: 7)),
      }],
    "dateTime": "1 hour",
    "isUnread": true,
    "unread": "1",
  },
  {
    "imageUrl":
        "https://images.unsplash.com/photo-1525873765963-8931ab571545?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fGJldXRpZnVsJTIwcHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "username": "Abigail",
    "message": [{
        "text": "No...are you?",
        "isSender": false,
        "dateTime": DateTime.now().subtract(Duration(days: 10)),
      }],
    "dateTime": "1 day",
    "isUnread": true,
    "unread": "1",
  },
  {
    "imageUrl":
        "https://images.unsplash.com/photo-1519648023493-d82b5f8d7b8a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODd8fGJldXRpZnVsJTIwcHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "username": "Anna",
    "message": [{
        "text": "Are you serious?",
        "isSender": false,
        "dateTime": DateTime.now().subtract(Duration(days: 15)),
      }],
    "dateTime": "2 day",
    "isUnread": true,
    "unread": "1",
  },
];
