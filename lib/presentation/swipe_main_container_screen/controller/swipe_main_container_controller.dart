import '../../../core/app_export.dart';
import '../models/swipe_main_container_model.dart';

/// A controller class for the SwipeMainContainerScreen.
///
/// This class manages the state of the SwipeMainContainerScreen, including the
/// current swipeMainContainerModelObj
class SwipeMainContainerController extends GetxController {
  Rx<SwipeMainContainerModel> swipeMainContainerModelObj =
      SwipeMainContainerModel().obs;
}
