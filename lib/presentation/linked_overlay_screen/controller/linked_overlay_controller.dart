import '../../../core/app_export.dart';
import '../models/linked_overlay_model.dart';

/// A controller class for the LinkedOverlayScreen.
///
/// This class manages the state of the LinkedOverlayScreen, including the
/// current linkedOverlayModelObj
class LinkedOverlayController extends GetxController {
  Rx<LinkedOverlayModel> linkedOverlayModelObj = LinkedOverlayModel().obs;
}
