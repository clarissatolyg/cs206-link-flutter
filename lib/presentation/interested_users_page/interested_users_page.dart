import 'widgets/interestedusers_item_widget.dart';
import 'models/interestedusers_item_model.dart';
import 'package:flutter/material.dart';
import 'package:link/core/app_export.dart';
import 'controller/interested_users_controller.dart';
import 'models/interested_users_model.dart';

class InterestedUsersPage extends StatelessWidget {
  InterestedUsersPage({Key? key})
      : super(
          key: key,
        );

  InterestedUsersController controller =
      Get.put(InterestedUsersController(InterestedUsersModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildScrollView(),
      ),
    );
  }

  /// Section Widget
  Widget _buildScrollView() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 40.v,
          bottom: 641.v,
        ),
        child: Column(
          children: [
            SizedBox(height: 9.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 9.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_liked_you".tr,
                          style: CustomTextStyles
                              .titleMediumSourceSansProWhiteA700Bold,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgIcons8Tune501,
                          height: 12.v,
                          width: 16.h,
                          margin: EdgeInsets.symmetric(vertical: 4.v),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 21.v),
                  Obx(
                    () => GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 249.v,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.h,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.interestedUsersModelObj.value
                          .interestedusersItemList.value.length,
                      itemBuilder: (context, index) {
                        InterestedusersItemModel model = controller
                            .interestedUsersModelObj
                            .value
                            .interestedusersItemList
                            .value[index];
                        return InterestedusersItemWidget(
                          model,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
