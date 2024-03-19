import '../../../core/app_export.dart';
import '../models/interested_users_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the InterestedUsersTabContainerScreen.
///
/// This class manages the state of the InterestedUsersTabContainerScreen, including the
/// current interestedUsersTabContainerModelObj
class InterestedUsersTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<InterestedUsersTabContainerModel> interestedUsersTabContainerModelObj =
      InterestedUsersTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 3));
}
