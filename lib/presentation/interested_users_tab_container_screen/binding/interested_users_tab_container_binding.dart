import 'package:link/presentation/interested_users_tab_container_screen/controller/interested_users_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the InterestedUsersTabContainerScreen.
///
/// This class ensures that the InterestedUsersTabContainerController is created when the
/// InterestedUsersTabContainerScreen is first loaded.
class InterestedUsersTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InterestedUsersTabContainerController());
  }
}
