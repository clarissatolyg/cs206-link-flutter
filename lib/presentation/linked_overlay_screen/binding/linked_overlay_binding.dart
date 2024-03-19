import 'package:link/presentation/linked_overlay_screen/controller/linked_overlay_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LinkedOverlayScreen.
///
/// This class ensures that the LinkedOverlayController is created when the
/// LinkedOverlayScreen is first loaded.
class LinkedOverlayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LinkedOverlayController());
  }
}
