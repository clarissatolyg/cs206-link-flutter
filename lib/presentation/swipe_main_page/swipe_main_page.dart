import 'widgets/horizontal_item_widget.dart';
import 'models/horizontal_item_model.dart';
import 'package:link/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:link/core/app_export.dart';
import 'controller/swipe_main_controller.dart';
import 'models/swipe_main_model.dart';

class SwipeMainPage extends StatelessWidget {
  SwipeMainPage({Key? key})
      : super(
          key: key,
        );

  SwipeMainController controller =
      Get.put(SwipeMainController(SwipeMainModel().obs));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
          width: double.maxFinite,
          decoration: AppDecoration.background,
          child: _buildScrollView(),
          ),
      ),
    );
  }

  /// Section Widget
  Widget _buildScrollView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15.v),
          SizedBox(
            height: 517.v,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImg1,
                  height: 517.v,
                  width: 414.h,
                  radius: BorderRadius.vertical(
                    top: Radius.circular(20.h),
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 10.h),
                    child: IntrinsicWidth(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 454.v,
                              bottom: 12.v,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "msg_gabrielle_taveira2".tr,
                                        style: CustomTextStyles
                                            .headlineSmallffffffffSemiBold,
                                      ),
                                      TextSpan(
                                        text: "lbl_20".tr,
                                        style:
                                            CustomTextStyles.titleLargeRegular,
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(height: 0.3.v),
                                Text(
                                  "msg_university_of_ribeir_o".tr,
                                  style: CustomTextStyles.titleSmallWhiteA700,
                                ),
                              ],
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgImg2,
                            height: 517.v,
                            width: 414.h,
                            radius: BorderRadius.vertical(
                              top: Radius.circular(20.h),
                            ),
                            margin: EdgeInsets.only(left: 598.h),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.v),
          SizedBox(
            height: 34.v,
            child: Obx(
              () => ListView.separated(
                padding: EdgeInsets.only(left: 16.h),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (
                  context,
                  index,
                ) {
                  return SizedBox(
                    width: 10.h,
                  );
                },
                itemCount: controller
                    .swipeMainModelObj.value.horizontalItemList.value.length,
                itemBuilder: (context, index) {
                  HorizontalItemModel model = controller
                      .swipeMainModelObj.value.horizontalItemList.value[index];
                  return HorizontalItemWidget(
                    model,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Container(
            width: 390.h,
            margin: EdgeInsets.only(
              left: 16.h,
              right: 7.h,
            ),
            child: Text(
              "msg_the_urn_is_not_sorrow".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall,
            ),
          ),
          SizedBox(height: 17.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Text(
                "lbl_music_genre".tr,
                style: CustomTextStyles.titleMediumSourceSansPro,
              ),
            ),
          ),
          SizedBox(height: 9.v),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 11.h),
            child: IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150.adaptSize,
                    width: 150.adaptSize,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 56.h,
                              right: 56.h,
                              bottom: 8.v,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomIconButton(
                                  height: 36.adaptSize,
                                  width: 36.adaptSize,
                                  padding: EdgeInsets.all(10.h),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgOverflowMenu,
                                  ),
                                ),
                                SizedBox(height: 29.v),
                                Text(
                                  "lbl_punk".tr,
                                  style: CustomTextStyles.titleMediumWhiteA700,
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgImage,
                          height: 150.adaptSize,
                          width: 150.adaptSize,
                          radius: BorderRadius.circular(
                            8.h,
                          ),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 150.adaptSize,
                    width: 150.adaptSize,
                    margin: EdgeInsets.only(left: 15.h),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgImage150x150,
                          height: 150.adaptSize,
                          width: 150.adaptSize,
                          radius: BorderRadius.circular(
                            8.h,
                          ),
                          alignment: Alignment.center,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 85.v,
                            width: 77.h,
                            margin: EdgeInsets.only(bottom: 8.v),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "lbl_the_beatles".tr,
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.h),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomIconButton(
                                          height: 36.adaptSize,
                                          width: 36.adaptSize,
                                          padding: EdgeInsets.all(10.h),
                                          child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgOverflowMenu,
                                          ),
                                        ),
                                        SizedBox(height: 10.v),
                                        Text(
                                          "lbl_rock".tr,
                                          style: CustomTextStyles
                                              .titleMediumWhiteA700,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 150.adaptSize,
                    width: 150.adaptSize,
                    margin: EdgeInsets.only(left: 15.h),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgImage1,
                          height: 150.adaptSize,
                          width: 150.adaptSize,
                          radius: BorderRadius.circular(
                            8.h,
                          ),
                          alignment: Alignment.center,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 57.h,
                              right: 57.h,
                              bottom: 8.v,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomIconButton(
                                  height: 36.adaptSize,
                                  width: 36.adaptSize,
                                  padding: EdgeInsets.all(10.h),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgOverflowMenu,
                                  ),
                                ),
                                SizedBox(height: 29.v),
                                Text(
                                  "lbl_pop".tr,
                                  style: CustomTextStyles.titleMediumWhiteA700,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Text(
                "lbl_instagram".tr,
                style: CustomTextStyles.titleMediumSourceSansPro,
              ),
            ),
          ),
          SizedBox(height: 15.v),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 11.h),
            child: IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle19,
                    height: 222.v,
                    width: 151.h,
                    radius: BorderRadius.circular(
                      5.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: _buildFrameSixtySeven(
                      image: ImageConstant.imgRectangle20,
                      image1: ImageConstant.imgRectangle21,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: _buildFrameSixtySeven(
                      image: ImageConstant.imgRectangle23,
                      image1: ImageConstant.imgRectangle24,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: _buildFrameSixtySeven(
                      image: ImageConstant.imgRectangle2071x104,
                      image1: ImageConstant.imgRectangle21141x104,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFrameSixtySeven({
    required String image,
    required String image1,
  }) {
    return Column(
      children: [
        CustomImageView(
          imagePath: image,
          height: 141.v,
          width: 104.h,
          radius: BorderRadius.circular(
            5.h,
          ),
        ),
        SizedBox(height: 10.v),
        CustomImageView(
          imagePath: image1,
          height: 71.v,
          width: 104.h,
          radius: BorderRadius.circular(
            5.h,
          ),
        ),
      ],
    );
  }
}
