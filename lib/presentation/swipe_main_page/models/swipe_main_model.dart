import '../../../core/app_export.dart';
import 'horizontal_item_model.dart';

/// This class defines the variables used in the [swipe_main_page],
/// and is typically used to hold data that is passed between different parts of the application.
class SwipeMainModel {
  Rx<List<HorizontalItemModel>> horizontalItemList = Rx([
    HorizontalItemModel(books: ImageConstant.imgUser.obs, books1: "Books".obs),
    HorizontalItemModel(
        books: ImageConstant.imgLinkedin.obs, books1: "Art".obs),
    HorizontalItemModel(
        books: ImageConstant.imgMingcuteMusicFill.obs, books1: "Music".obs),
    HorizontalItemModel(
        books: ImageConstant.imgTelevision.obs, books1: "Movies".obs)
  ]);
}
