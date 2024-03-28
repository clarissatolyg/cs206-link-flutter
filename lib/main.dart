import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:link_flutter/components/notifications_controller.dart';
import 'package:link_flutter/pages/onboarding_page.dart';
import 'package:link_flutter/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


void main() async{
  await AwesomeNotifications().initialize('resource://drawable/logo',
  [NotificationChannel(
  channelGroupKey: "matchPopUp_grp", 
  channelKey: "match", 
  channelName: "matchPopUp",
  channelDescription: "PopUpMatch")],
  channelGroups: [
    NotificationChannelGroup(channelGroupKey: "matchPopUp_grp", channelGroupName: "MatchGroup")
  ]
  );
  bool isAllowedToSendNotif = await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotif){
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    AwesomeNotifications().setListeners(
    onActionReceivedMethod: NotificationController.onActionReceivedMethod,
    onDismissActionReceivedMethod: NotificationController.onDismissActionReceivedMethod,
    onNotificationCreatedMethod: NotificationController.onNotificationCreatedMethod,
    onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod);
    super.initState();
  }  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Montserrat',
          scaffoldBackgroundColor: white,
          appBarTheme: AppBarTheme(color: white, elevation: 0),
        ),
        home: AnimatedSplashScreen(
          duration: 3000,
          splash: 'assets/images/logo.png', 
          pageTransitionType: PageTransitionType.fade,
          nextScreen: OnBoardingPage(),));
  }
}
