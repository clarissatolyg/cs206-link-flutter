import '../models/interestedusers_item_model.dart';
import '../controller/interested_users_controller.dart';
import 'package:flutter/material.dart';
import 'package:link/core/app_export.dart';

// ignore: must_be_immutable
class InterestedusersItemWidget extends StatelessWidget {
  InterestedusersItemWidget(
    this.interestedusersItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  InterestedusersItemModel interestedusersItemModelObj;

  var controller = Get.find<InterestedUsersController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: appTheme.whiteA700,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Container(
        height: 248.v,
        width: 187.h,
        decoration: AppDecoration.background.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Obx(
              () => CustomImageView(
                imagePath: interestedusersItemModelObj.mayTwentyFour!.value,
                height: 248.v,
                width: 187.h,
                radius: BorderRadius.circular(
                  10.h,
                ),
                alignment: Alignment.center,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(11.h),
                decoration: AppDecoration.gradientBlueGrayToGray.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderBL10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.v),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "lbl_may".tr,
                            style: CustomTextStyles
                                .titleMediumSourceSansProffffffffSemiBold,
                          ),
                          TextSpan(
                            text: " ",
                          ),
                          TextSpan(
                            text: "lbl_24".tr,
                            style: theme.textTheme.labelLarge,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
