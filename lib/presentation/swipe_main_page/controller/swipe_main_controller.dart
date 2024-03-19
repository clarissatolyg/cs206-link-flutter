import '../../../core/app_export.dart';
import '../models/swipe_main_model.dart';

/// A controller class for the SwipeMainPage.
///
/// This class manages the state of the SwipeMainPage, including the
/// current swipeMainModelObj
class SwipeMainController extends GetxController {
  SwipeMainController(this.swipeMainModelObj);

  Rx<SwipeMainModel> swipeMainModelObj;
}
