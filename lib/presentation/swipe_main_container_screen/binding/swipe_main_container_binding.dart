import 'package:link/presentation/swipe_main_container_screen/controller/swipe_main_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SwipeMainContainerScreen.
///
/// This class ensures that the SwipeMainContainerController is created when the
/// SwipeMainContainerScreen is first loaded.
class SwipeMainContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SwipeMainContainerController());
  }
}
