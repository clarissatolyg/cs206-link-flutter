import '../../../core/app_export.dart';
import '../models/interested_users_model.dart';

/// A controller class for the InterestedUsersPage.
///
/// This class manages the state of the InterestedUsersPage, including the
/// current interestedUsersModelObj
class InterestedUsersController extends GetxController {
  InterestedUsersController(this.interestedUsersModelObj);

  Rx<InterestedUsersModel> interestedUsersModelObj;
}
