import 'package:link_flutter/utils/constant.dart';

List you = [
  {
    "imageUrl": profileUrl,
    "username": "You",
  },
];

List<Map<String, dynamic>> matchedUser = [];

// List<Map<String, dynamic>> activities = [
//   {
//     "imageUrl":
//         "https://images.unsplash.com/photo-1535704882196-765e5fc62a53?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJldXRpZnVsJTIwZ2lybHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     "username": "moonchild1",
//     "name": "Moonchild",
//     "message": [
//       {
//         "text": "Hi there! gosh your profile is so interesting!",
//         "isSender": false,
//         "dateTime": DateTime.now().subtract(Duration(days: 1)),
//       },
//       {
//         "text": "How are you?",
//         "isSender": true,
//         "dateTime": DateTime.now(),
//       },
//       {
//         "text": "Sticker 😍",
//         "isSender": true,
//         "dateTime": DateTime.now().subtract(Duration(minutes: 5)),
//       }
//     ],
//     "isUnread": false,
//     "unread": "0",
//   },
//   {
//     "imageUrl":
//         "https://images.unsplash.com/photo-1621784564114-6eea05b89863?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGJlYXV0aWZ1bCUyMGxhZHl8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     "username": "leilani1",
//     "name": "Leilani",
//     "message": [
//       {
//         "text": "Hi there! What are you doing tomorrow?",
//         "isSender": false,
//         "dateTime": DateTime.now().subtract(Duration(days: 1)),
//       }
//     ],
//     "isUnread": true,
//     "unread": "1",
//   },
//   {
//     "imageUrl":
//         "https://images.unsplash.com/photo-1576841944388-1d1b4b8494fc?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGJlYXV0aWZ1bCUyMGxhZHl8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     "username": "annabelle1",
//     "name": "Annabelle",
//     "message": [
//       {
//         "text": "I saw your profile and i kind of love your interests!",
//         "isSender": false,
//         "dateTime": DateTime.now().subtract(Duration(days: 2)),
//       }
//     ],
//     "isUnread": true,
//     "unread": "1",
//   },
//   {
//     "imageUrl":
//         "https://images.unsplash.com/photo-1621184455862-c163dfb30e0f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGJlYXV0aWZ1bCUyMGxhZHl8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     "username": "reagan1",
//     "name": "Reagan",
//     "message": [
//       {
//         "text": "Hey! What's up, long time no see?",
//         "isSender": false,
//         "dateTime": DateTime.now().subtract(Duration(days: 5)),
//       }
//     ],
//     "isUnread": true,
//     "unread": "1",
//   },
//   {
//     "imageUrl":
//         "https://images.unsplash.com/photo-1440589473619-3cde28941638?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YmVhdXRpZnVsJTIwbGFkeXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     "username": "roksolana1",
//     "name": "Roksolana",
//     "message": [
//       {
//         "text": "Are you the famous guy in Singapore?",
//         "isSender": false,
//         "dateTime": DateTime.now().subtract(Duration(days: 5)),
//       }
//     ],
//     "isUnread": true,
//     "unread": "1",
//   },
//   {
//     "imageUrl":
//         "https://images.unsplash.com/photo-1524502397800-2eeaad7c3fe5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8YmVhdXRpZnVsJTIwbGFkeXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     "username": "raamin1",
//     "name": "Raamin",
//     "message": [
//       {
//         "text": "You are such a cutie, what's your phone number?",
//         "isSender": false,
//         "dateTime": DateTime.now().subtract(Duration(days: 7)),
//       }
//     ],
//     "isUnread": true,
//     "unread": "1",
//   },
//   {
//     "imageUrl":
//         "https://images.unsplash.com/photo-1610879247468-ba0c12f0d709?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YmVhdXRpZnVsJTIwbGFkeXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     "username": "rafaella1",
//     "name": "Rafaella",
//     "message": [
//       {
//         "text": "you're so handsome!!!",
//         "isSender": false,
//         "dateTime": DateTime.now().subtract(Duration(days: 10)),
//       }
//     ],
//     "isUnread": true,
//     "unread": "1",
//   },
//   {
//     "imageUrl":
//         "https://images.unsplash.com/photo-1612874470096-d93a610de87b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YmVhdXRpZnVsJTIwbGFkeXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     "username": "diniz1",
//     "name": "Diniz",
//     "message": [
//       {
//         "text": "No...are you? God? cuz you're so heavenly!!!",
//         "isSender": false,
//         "dateTime": DateTime.now().subtract(Duration(days: 10)),
//       }
//     ],
//     "isUnread": true,
//     "unread": "1",
//   },
//   // {
//   //   "imageUrl":
//   //       "https://images.unsplash.com/photo-1519648023493-d82b5f8d7b8a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODd8fGJldXRpZnVsJTIwcHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//   //   "username": "anna1",
//   //   "name": "Anna",
//   //   "message": [],
//   //   "isUnread": true,
//   //   "unread": "1",
//   // },
// ];

List cleanList = ["hi", "hello", "bitch", "fuck", "stupid", "idiot", "dumb"];
