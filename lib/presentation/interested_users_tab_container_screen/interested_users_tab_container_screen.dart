import 'package:link/presentation/interested_users_page/interested_users_page.dart';
import 'package:flutter/material.dart';
import 'package:link/core/app_export.dart';
import 'controller/interested_users_tab_container_controller.dart';

class InterestedUsersTabContainerScreen
    extends GetWidget<InterestedUsersTabContainerController> {
  InterestedUsersTabContainerScreen({Key? key}) : super(key: key);

  InterestedUsersTabContainerController controller =
      Get.put(InterestedUsersTabContainerController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                    child: SizedBox(
                        width: double.maxFinite,
                        child: Stack(alignment: Alignment.topCenter, children: [
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("lbl_heart_for_you".tr,
                                        style:
                                            CustomTextStyles.titleLargeGray900),
                                    SizedBox(height: 2.v),
                                    SizedBox(
                                        width: 174.h,
                                        child: Text("msg_check_out_your_top".tr,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: CustomTextStyles
                                                .bodySmallBlack900)),
                                    SizedBox(height: 3.v),
                                    _buildFiftyThree(),
                                    SizedBox(height: 1.v),
                                    SizedBox(
                                        height: 900.v,
                                        width: double.maxFinite,
                                        child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                      height: 900.v,
                                                      width: double.maxFinite,
                                                      decoration: BoxDecoration(
                                                          color: appTheme
                                                              .indigoA700,
                                                          borderRadius:
                                                              BorderRadius.vertical(
                                                                  top: Radius
                                                                      .circular(
                                                                          10.h))))),
                                              _buildTabview(),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      top: 35.v, bottom: 35.v),
                                                  height: 890.v,
                                                  child: TabBarView(
                                                      controller: controller
                                                          .tabviewController,
                                                      children: [
                                                        InterestedUsersPage(),
                                                        InterestedUsersPage(),
                                                        InterestedUsersPage()
                                                      ]))
                                            ]))
                                  ])),
                        ]))))));
  }

  /// Section Widget
  Widget _buildFiftyThree() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicWidth(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.symmetric(vertical: 27.v),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.roundedBorder8),
              child: Container(
                  height: 405.v,
                  width: 241.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusStyle.roundedBorder8),
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgRectangle120,
                        height: 405.v,
                        width: 241.h,
                        radius: BorderRadius.circular(8.h),
                        alignment: Alignment.center),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 11.h, vertical: 13.v),
                            decoration: AppDecoration.gradientBlueGrayToGray600
                                .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.customBorderBL10),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10.v),
                                  SizedBox(
                                      width: 103.h,
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "lbl_jisoo".tr,
                                                style: CustomTextStyles
                                                    .titleLarge22),
                                            TextSpan(
                                                text: "lbl_242".tr,
                                                style: CustomTextStyles
                                                    .titleMediumSourceSansProffffffff),
                                            TextSpan(
                                                text: "lbl_sim_business".tr,
                                                style:
                                                    theme.textTheme.labelLarge)
                                          ]),
                                          textAlign: TextAlign.left))
                                ])))
                  ]))),
          Spacer(flex: 50),
          Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.roundedBorder8),
              child: Container(
                  height: 459.v,
                  width: 273.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusStyle.roundedBorder8),
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgPic31,
                        height: 459.v,
                        width: 273.h,
                        radius: BorderRadius.circular(10.h),
                        alignment: Alignment.center),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            padding: EdgeInsets.all(13.h),
                            decoration: AppDecoration.gradientBlueGrayToGray
                                .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.customBorderBL10),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 14.v),
                                  SizedBox(
                                      width: 133.h,
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "lbl_jiayi".tr,
                                                style: CustomTextStyles
                                                    .headlineSmallffffffff),
                                            TextSpan(
                                                text: "lbl_27".tr,
                                                style:
                                                    theme.textTheme.titleLarge),
                                            TextSpan(
                                                text: "msg_data_scientist".tr,
                                                style:
                                                    theme.textTheme.titleSmall)
                                          ]),
                                          textAlign: TextAlign.left))
                                ])))
                  ]))),
          Spacer(flex: 50),
          Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.symmetric(vertical: 27.v),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.roundedBorder8),
              child: Container(
                  height: 405.v,
                  width: 241.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusStyle.roundedBorder8),
                  child: Stack(alignment: Alignment.bottomLeft, children: [
                    Align(
                        alignment: Alignment.center,
                        child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 0,
                            margin: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusStyle.roundedBorder8),
                            child: Container(
                                height: 405.v,
                                width: 241.h,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder8),
                                child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      CustomImageView(
                                          imagePath: ImageConstant.imgPic51,
                                          height: 405.v,
                                          width: 241.h,
                                          radius: BorderRadius.circular(10.h),
                                          alignment: Alignment.center),
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                              height: 82.v,
                                              width: 241.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          bottom:
                                                              Radius.circular(
                                                                  10.h)),
                                                  gradient: LinearGradient(
                                                      begin: Alignment(
                                                          0.54, -0.14),
                                                      end: Alignment(0.53, 1),
                                                      colors: [
                                                        appTheme.blueGray10000,
                                                        appTheme.gray600
                                                      ]))))
                                    ])))),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            width: 103.h,
                            margin: EdgeInsets.only(left: 11.h),
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "lbl_wang_mei_21".tr,
                                      style: theme.textTheme.titleLarge),
                                  TextSpan(
                                      text: "lbl_ntu_business".tr,
                                      style: theme.textTheme.titleSmall)
                                ]),
                                textAlign: TextAlign.left)))
                  ])))
        ])));
  }

  /// Section Widget
  Widget _buildTabview() {
    return Container(
        height: 40.v,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: appTheme.indigoA700,
            borderRadius: BorderRadius.circular(10.h)),
        child: TabBar(
            controller: controller.tabviewController,
            labelPadding: EdgeInsets.zero,
            labelColor: appTheme.black900,
            labelStyle: TextStyle(
                fontSize: 16.fSize,
                fontFamily: 'Source Sans Pro',
                fontWeight: FontWeight.w600),
            unselectedLabelColor: appTheme.whiteA700,
            unselectedLabelStyle: TextStyle(
                fontSize: 16.fSize,
                fontFamily: 'Source Sans Pro',
                fontWeight: FontWeight.w600),
            indicatorPadding: EdgeInsets.all(8.0.h),
            indicator: BoxDecoration(
                color: appTheme.whiteA700,
                borderRadius: BorderRadius.circular(12.h)),
            tabs: [
              Tab(child: Text("lbl_admirers_6".tr)),
              Tab(child: Text("lbl_linked_3".tr)),
              Tab(child: Text("lbl_likes_3".tr))
            ]));
  }

}
