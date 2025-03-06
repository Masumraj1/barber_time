import 'package:barber_time/app/core/route_path.dart';
import 'package:barber_time/app/core/routes.dart';
import 'package:barber_time/app/global/controller/auth_controller/auth_controller.dart';
import 'package:barber_time/app/utils/app_colors.dart';
import 'package:barber_time/app/utils/app_strings.dart';
import 'package:barber_time/app/utils/enums/user_role.dart';
import 'package:barber_time/app/view/common_widgets/custom_appbar/custom_appbar.dart';
import 'package:barber_time/app/view/common_widgets/custom_button/custom_button.dart';
import 'package:barber_time/app/view/common_widgets/custom_from_card/custom_from_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final AuthController authController = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userRole = GoRouterState.of(context).extra as UserRole?;
    debugPrint("Selected Role============================${userRole?.name}");
    return Scaffold(
      backgroundColor: AppColors.normalHover,

      ///: <<<<<<======🗄️🗄️🗄️🗄️🗄️🗄️💡💡VerifyCode Appbar💡💡🗄️🗄️🗄️🗄️🗄️🗄️🗄️>>>>>>>>===========
      appBar: const CustomAppBar(
        appBarBgColor: AppColors.normalHover,
        appBarContent: AppStrings.resetPassword,
        iconData: Icons.arrow_back,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ///: <<<<<<======🗄️🗄️🗄️🗄️🗄️🗄️💡💡Header💡💡🗄️🗄️🗄️🗄️🗄️🗄️🗄️>>>>>>>>===========

                  SizedBox(
                    height: 80.h,
                  ),

                  ///: <<<<<<======🗄️🗄️🗄️🗄️🗄️🗄️💡💡emailField💡💡🗄️🗄️🗄️🗄️🗄️🗄️🗄️>>>>>>>>===========
                  CustomFromCard(
                      isPassword: true,
                      hinText: AppStrings.enterNewPassword,
                      title: AppStrings.enterYourNewPassword,
                      controller: TextEditingController(),
                      validator: (v) {}),

                  CustomFromCard(
                      isPassword: true,
                      hinText: AppStrings.confirmNewPassword,
                      title: AppStrings.confirmNewPassword,
                      controller: TextEditingController(),
                      validator: (v) {}),
                  SizedBox(
                    height: 100.h,
                  ),

                  ///: <<<<<<======🗄️🗄️🗄️🗄️🗄️🗄️💡💡sendCode Button💡💡🗄️🗄️🗄️🗄️🗄️🗄️🗄️>>>>>>>>===========

                  CustomButton(
                    isRadius: false,
                    width: MediaQuery.of(context).size.width,
                    onTap: () {
                      AppRouter.route.goNamed(RoutePath.signInScreen,
                          extra: userRole);
                    },
                    title: AppStrings.resetPassword,
                    fillColor: AppColors.white50,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
