import 'package:barber_time/app/core/route_path.dart';
import 'package:barber_time/app/core/routes.dart';
import 'package:barber_time/app/global/controller/auth_controller/auth_controller.dart';
import 'package:barber_time/app/utils/app_colors.dart';
import 'package:barber_time/app/utils/app_strings.dart';
import 'package:barber_time/app/utils/enums/user_role.dart';
import 'package:barber_time/app/view/common_widgets/curved_Banner_clipper/curved_banner_clipper.dart';
import 'package:barber_time/app/view/common_widgets/custom_button/custom_button.dart';
import 'package:barber_time/app/view/common_widgets/custom_from_card/custom_from_card.dart';
import 'package:barber_time/app/view/common_widgets/custom_rich_text/custom_rich_text.dart';
import 'package:barber_time/app/view/common_widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final userRole = GoRouterState.of(context).extra as UserRole?;
    debugPrint("Selected Role============================${userRole?.name}");
    return Scaffold(
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        const CustomText(
                          text: AppStrings.signUp,
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: AppColors.black,
                        ),

                        const CustomText(
                          text: AppStrings.helloLetsJoin,
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          color: AppColors.black,
                        ),

                        SizedBox(
                          height: 34.h,
                        ),
                        //ToDo ==========✅✅ fullName ✅✅==========
                        CustomFromCard(
                          hinText: AppStrings.enterYourName,
                            title: AppStrings.fullName,
                            controller: authController.fullNameController,
                            validator: (v) {
                              return null;
                            }),
                        //ToDo ==========✅✅ Email✅✅==========
                        CustomFromCard( hinText: AppStrings.enterYourEmail,
                            title: AppStrings.email,
                            controller: authController.emailController,
                            validator: (v) {
                              return null;
                            }),
                        //ToDo ==========✅✅ password ✅✅==========
                        CustomFromCard(
                            hinText: AppStrings.enterYourPassword,
                            title: AppStrings.password,
                            controller: authController.passwordController,
                            validator: (v) {
                              return null;
                            }),

                        //ToDo ==========✅✅ Confirm ✅✅==========
                        CustomFromCard(
                            hinText: AppStrings.confirmNewPassword,
                            title: AppStrings.confirmPassword,
                            controller: authController.confirmPasswordController,
                            validator: (v) {
                              return null;
                            }),
                      ],
                    ),
                  )),
            ),
            SingleChildScrollView(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      CustomButton(
                        onTap: () {
                          if (userRole == UserRole.user) {
                            AppRouter.route
                                .pushNamed(RoutePath.otpScreen,);
                          } else if (userRole == UserRole.barber) {
                            AppRouter.route
                                .pushNamed(RoutePath.subscriptionPlan, extra: userRole);
                          }else{
                            debugPrint("No Role Selectedl");
                          }

                        },
                        title: AppStrings.signUp,
                        fillColor: Colors.black,
                        textColor: Colors.white,
                      ),
                      SizedBox(
                        height: 50.h,
                      ),

                      //ToDo ==========✅✅ alreadyHaveAnAccount✅✅==========
                      CustomRichText(
                          firstText: AppStrings.alreadyHaveAnAccount,
                          secondText: AppStrings.signIn,
                          onTapAction: () {
                            context.pop();
                          })
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
