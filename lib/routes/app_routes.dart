import 'package:get/get.dart';
import '../presentation/linked_overlay_screen/linked_overlay_screen.dart';
import '../presentation/linked_overlay_screen/binding/linked_overlay_binding.dart';
import '../presentation/swipe_main_container_screen/swipe_main_container_screen.dart';
import '../presentation/swipe_main_container_screen/binding/swipe_main_container_binding.dart';
import '../presentation/interested_users_tab_container_screen/interested_users_tab_container_screen.dart';
import '../presentation/interested_users_tab_container_screen/binding/interested_users_tab_container_binding.dart';

class AppRoutes {
  static const String linkedOverlayScreen = '/linked_overlay_screen';

  static const String swipeMainContainerScreen = '/swipe_main_container_screen';

  static const String swipeMainPage = '/swipe_main_page';

  static const String interestedUsersPage = '/interested_users_page';

  static const String interestedUsersTabContainerScreen =
      '/interested_users_tab_container_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: linkedOverlayScreen,
      page: () => LinkedOverlayScreen(),
      bindings: [
        LinkedOverlayBinding(),
      ],
    ),
    GetPage(
      name: swipeMainContainerScreen,
      page: () => SwipeMainContainerScreen(),
      bindings: [
        SwipeMainContainerBinding(),
      ],
    ),
    GetPage(
      name: interestedUsersTabContainerScreen,
      page: () => InterestedUsersTabContainerScreen(),
      bindings: [
        InterestedUsersTabContainerBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      // page: () => LinkedOverlayScreen(),
      // bindings: [
      //   LinkedOverlayBinding(),
      // ],
      page: () => SwipeMainContainerScreen(),
      bindings: [
        SwipeMainContainerBinding(),
      ],
      // page: () => InterestedUsersTabContainerScreen(),
      // bindings: [
      //   InterestedUsersTabContainerBinding(),
      // ],
    )
  ];
}
