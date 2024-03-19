import 'package:link/presentation/swipe_main_page/swipe_main_page.dart';
import 'package:link/presentation/interested_users_tab_container_screen/interested_users_tab_container_screen.dart';
import 'package:link/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:link/core/app_export.dart';
import 'controller/swipe_main_container_controller.dart';

class SwipeMainContainerScreen extends GetWidget<SwipeMainContainerController> {
  const SwipeMainContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0), // You can adjust the height as needed
          child: _buildTopBar(context), // This will create a top navigation bar
        ),
        body: Navigator(
          key: Get.nestedKey(1),
          initialRoute: AppRoutes.swipeMainPage,
          onGenerateRoute: (routeSetting) => GetPageRoute(
            page: () => getCurrentPage(routeSetting.name!),
            transition: Transition.noTransition,
          ),
        ),
        // Removed the bottomNavigationBar property because we're moving it to the top
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    // Wrap your existing bottom bar code inside an AppBar for it to be at the top
    return AppBar(
      title: _buildBottomBar(), // Your CustomBottomBar is now at the top as a title
      backgroundColor: Colors.transparent, // Set to transparent if you want the AppBar to blend with your page
      elevation: 0, // Removes shadow below the AppBar
      centerTitle: true, // If you want the title to be centered
    );
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), id: 1);
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Brandlogo:
        return AppRoutes.swipeMainPage;
      case BottomBarEnum.Favorite:
        return AppRoutes.interestedUsersTabContainerScreen;
      case BottomBarEnum.Usergray900:
        return "/";
      case BottomBarEnum.Lock:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.swipeMainPage:
        return SwipeMainPage();
      case AppRoutes.interestedUsersTabContainerScreen:
        return InterestedUsersTabContainerScreen();
      default:
        return DefaultWidget();
    }
  }
}
