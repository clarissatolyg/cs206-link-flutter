import '../../../core/app_export.dart';
import 'interestedusers_item_model.dart';

/// This class defines the variables used in the [interested_users_page],
/// and is typically used to hold data that is passed between different parts of the application.
class InterestedUsersModel {
  Rx<List<InterestedusersItemModel>> interestedusersItemList = Rx([
    InterestedusersItemModel(mayTwentyFour: ImageConstant.imgPic82.obs),
    InterestedusersItemModel(mayTwentyFour: ImageConstant.imgPic71.obs),
    InterestedusersItemModel(mayTwentyFour: ImageConstant.imgPic102.obs),
    InterestedusersItemModel(mayTwentyFour: ImageConstant.imgPic132.obs),
    InterestedusersItemModel(mayTwentyFour: ImageConstant.imgPic162.obs),
    InterestedusersItemModel(mayTwentyFour: ImageConstant.imgPic151.obs)
  ]);
}
