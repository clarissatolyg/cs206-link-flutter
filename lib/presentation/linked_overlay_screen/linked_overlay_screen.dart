import 'package:flutter/material.dart';
import 'package:link/core/app_export.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'controller/linked_overlay_controller.dart';
import 'package:link/presentation/swipe_main_page/swipe_main_page.dart';

class LinkedOverlayScreen extends GetWidget<LinkedOverlayController> {
  const LinkedOverlayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 7.h, vertical: 27.v),
                    decoration: AppDecoration.outlineWhiteA.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder20),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgClose,
                          height: 15.adaptSize,
                          width: 15.adaptSize,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 22.h),
                          onTap: () {
                            onTapImgClose(context);
                          }),
                      // FloatingActionButton(
                      //   onPressed: onTapImgClose, // This assumes onTapImgClose is defined somewhere in your code.
                      //   child: SvgPicture.asset(
                      //     'assets/images/img_close.svg', // Replace with your actual SVG asset path
                      //     height: 24, // Adjust the size as needed
                      //     width: 24,
                      //   ),
                      //   backgroundColor: Colors.transparent, // No background color for a floating look
                      //   elevation: 0, // Removes shadow
                      // ),
                      SizedBox(height: 58.v),
                      _buildTwentySix(),
                      SizedBox(height: 38.v),
                      SizedBox(
                          width: 157.h,
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "lbl_it_s_a".tr,
                                    style:
                                        CustomTextStyles.headlineLargeff000000),
                                TextSpan(text: " "),
                                TextSpan(
                                    text: "lbl_l".tr,
                                    style: CustomTextStyles
                                        .displayMediumGreatVibes_1),
                                TextSpan(
                                    text: "lbl_ink".tr,
                                    style: CustomTextStyles
                                        .displayMediumGreatVibes),
                                TextSpan(
                                    text: "lbl".tr,
                                    style:
                                        CustomTextStyles.headlineLargeff000000)
                              ]),
                              textAlign: TextAlign.center)),
                      Spacer(),
                      _buildTextbox()
                    ])))));
  }

  /// Section Widget
  Widget _buildTwentySix() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 29.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgRectangle9,
                  height: 211.v,
                  width: 130.h,
                  radius: BorderRadius.circular(20.h),
                  margin: EdgeInsets.only(bottom: 120.v)),
              CustomImageView(
                  imagePath: ImageConstant.imgBrandLogo,
                  height: 80.v,
                  width: 75.h,
                  margin:
                      EdgeInsets.only(left: 2.h, top: 132.v, bottom: 119.v)),
              CustomImageView(
                  imagePath: ImageConstant.imgPic12,
                  height: 211.v,
                  width: 130.h,
                  radius: BorderRadius.circular(20.h),
                  margin: EdgeInsets.only(top: 120.v))
            ]));
  }

  /// Section Widget
  Widget _buildTextbox() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 27.h, vertical: 10.v),
        decoration: AppDecoration.outlineBlack
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 11.h, top: 3.v),
                  child: Text("msg_send_a_message".tr,
                      style: CustomTextStyles.titleSmallBlack900)),
              CustomImageView(
                  imagePath: ImageConstant.imgBiSend,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                  margin: EdgeInsets.only(top: 3.v))
            ]));
  }

  /// Navigates to the previous screen.
  onTapImgClose(BuildContext context) {// If you're using GetX for navigation
    // Get.back();
    // Navigate to LinkedOverlayScreen when the button is pressed
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SwipeMainPage(),
    ));
  }
}
