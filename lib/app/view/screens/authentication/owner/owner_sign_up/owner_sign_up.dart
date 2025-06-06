import 'package:barber_time/app/core/route_path.dart';
import 'package:barber_time/app/global/controller/auth_controller/auth_controller.dart';
import 'package:barber_time/app/utils/app_colors.dart';
import 'package:barber_time/app/utils/app_strings.dart';
import 'package:barber_time/app/utils/enums/user_role.dart';
import 'package:barber_time/app/view/common_widgets/curved_Banner_clipper/curved_banner_clipper.dart';
import 'package:barber_time/app/view/common_widgets/custom_appbar/custom_appbar.dart';
import 'package:barber_time/app/view/common_widgets/custom_button/custom_button.dart';
import 'package:barber_time/app/view/common_widgets/custom_from_card/custom_from_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class OwnerSignUp extends StatelessWidget {
  OwnerSignUp({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final userRole = GoRouterState.of(context).extra as UserRole?;
    debugPrint("Selected Role============================${userRole?.name}");
    return Scaffold(
      appBar: const CustomAppBar(
        appBarContent:AppStrings.personalInformation,
        appBarBgColor: AppColors.linearFirst,
        iconData: Icons.arrow_back,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CurvedBannerClipper(),
              child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xCCEDC4AC), // First color (with opacity)
                        Color(0xFFE9864E),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),


                        //ToDo ==========✅✅ fullName ✅✅==========
                        CustomFromCard(
                            hinText: AppStrings.enterYourName,
                            title: AppStrings.name,
                            controller: authController.fullNameController,
                            validator: (v) {
                              return null;
                            }),                        //ToDo ==========✅✅ Email✅✅==========
                        CustomFromCard(
                            hinText: AppStrings.enterYourEmail,
                            title: AppStrings.email,
                            controller: authController.emailController,
                            validator: (v) {
                              return null;
                            }),                        //ToDo ==========✅✅ password ✅✅==========
                        CustomFromCard(
                            hinText: AppStrings.enterYourShopAddress,
                            title: AppStrings.address,
                            controller: authController.passwordController,
                            validator: (v) {
                              return null;
                            }),
                        //ToDo ==========✅✅ Confirm ✅✅==========
                        CustomFromCard(
                            hinText: AppStrings.enterYourPassword,
                            title: AppStrings.password,
                            controller:
                                authController.confirmPasswordController,
                            validator: (v) {
                              return null;
                            }),
                        //ToDo ==========✅✅ Confirm ✅✅==========
                        CustomFromCard(
                            hinText: AppStrings.confirmNewPassword,
                            title: AppStrings.confirmPassword,
                            controller:
                                authController.confirmPasswordController,
                            validator: (v) {
                              return null;
                            }),                      ],
                    ),
                  )),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    CustomButton(
                      onTap: () {

                        context.pushNamed(
                          RoutePath.ownerShopDetails,extra: userRole
                        );
                      },
                      title: "Next",
                      fillColor: Colors.black,
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),


                  ],
                )),
          ],
        ),
      ),
    );
  }
}
