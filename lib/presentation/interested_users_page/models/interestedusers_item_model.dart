import '../../../core/app_export.dart';

/// This class is used in the [interestedusers_item_widget] screen.
class InterestedusersItemModel {
  InterestedusersItemModel({
    this.mayTwentyFour,
    this.id,
  }) {
    mayTwentyFour = mayTwentyFour ?? Rx(ImageConstant.imgPic82);
    id = id ?? Rx("");
  }

  Rx<String>? mayTwentyFour;

  Rx<String>? id;
}
