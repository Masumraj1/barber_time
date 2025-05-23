import 'package:barber_time/app/core/bottom_navbar.dart';
import 'package:barber_time/app/core/route_path.dart';
import 'package:barber_time/app/core/routes.dart';
import 'package:barber_time/app/utils/app_colors.dart';
import 'package:barber_time/app/utils/app_constants.dart';
import 'package:barber_time/app/utils/app_strings.dart';
import 'package:barber_time/app/utils/enums/user_role.dart';
import 'package:barber_time/app/view/common_widgets/curved_Banner_clipper/curved_banner_clipper.dart';
import 'package:barber_time/app/view/common_widgets/custom_messaging_card/custom_messaging_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userRole = GoRouter.of(context).state.extra as UserRole?;

    debugPrint("===================${userRole?.name}");
    if (userRole == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('No user role received')),
      );
    }
    return Scaffold(

      bottomNavigationBar: BottomNavbar(
        currentIndex: 1,
        role: userRole,
      ),
      appBar: AppBar(
        backgroundColor: AppColors.linearFirst,
        centerTitle: true,
        title: const Text(AppStrings.messaging),
      ),
      body: ClipPath(
        clipper: CurvedBannerClipper(),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xCCEDC4AC), // First color (with opacity)
                Color(0xFFE9874E),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return CustomMessageCard(
                      senderName: 'Italian Fashion Saloon',
                      message: 'Hey, Can I get a side cut for hair? And the price?And the price?',
                      imageUrl: AppConstants.demoImage,
                      onTap: (){
                        AppRouter.route.pushNamed(
                          RoutePath.chatScreen,
                        );
                      },
                    );
                  })),
        ),
      ),
    );
  }
}
