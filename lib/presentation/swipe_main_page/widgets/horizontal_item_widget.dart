import '../models/horizontal_item_model.dart';
import '../controller/swipe_main_controller.dart';
import 'package:flutter/material.dart';
import 'package:link/core/app_export.dart';

// ignore: must_be_immutable
class HorizontalItemWidget extends StatelessWidget {
  HorizontalItemWidget(
    this.horizontalItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  HorizontalItemModel horizontalItemModelObj;

  var controller = Get.find<SwipeMainController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.v),
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 5.v,
      ),
      decoration: AppDecoration.background.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder16,
      ),
      width: 96.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => CustomImageView(
              imagePath: horizontalItemModelObj.books!.value,
              height: 16.v,
              width: 20.h,
              margin: EdgeInsets.symmetric(vertical: 2.v),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Obx(
              () => Text(
                horizontalItemModelObj.books1!.value,
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
