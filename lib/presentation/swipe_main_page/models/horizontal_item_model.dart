import '../../../core/app_export.dart';

/// This class is used in the [horizontal_item_widget] screen.
class HorizontalItemModel {
  HorizontalItemModel({
    this.books,
    this.books1,
    this.id,
  }) {
    books = books ?? Rx(ImageConstant.imgUser);
    books1 = books1 ?? Rx("Books");
    id = id ?? Rx("");
  }

  Rx<String>? books;

  Rx<String>? books1;

  Rx<String>? id;
}
