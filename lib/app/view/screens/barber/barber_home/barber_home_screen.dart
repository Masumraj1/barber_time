import 'package:barber_time/app/core/bottom_navbar.dart';
import 'package:barber_time/app/core/custom_assets/assets.gen.dart';
import 'package:barber_time/app/core/route_path.dart';
import 'package:barber_time/app/core/routes.dart';
import 'package:barber_time/app/utils/app_colors.dart';
import 'package:barber_time/app/utils/app_constants.dart';
import 'package:barber_time/app/utils/app_strings.dart';
import 'package:barber_time/app/utils/enums/user_role.dart';
import 'package:barber_time/app/view/common_widgets/common_home_app_bar/common_home_app_bar.dart';
import 'package:barber_time/app/view/common_widgets/custom_feed_card/custom_feed_card.dart';
import 'package:barber_time/app/view/common_widgets/custom_border_card/custom_border_card.dart';
import 'package:barber_time/app/view/common_widgets/custom_title/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BarberHomeScreen extends StatelessWidget {
  BarberHomeScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        currentIndex: 0,
        role: userRole,
      ),
      body: Column(
        children: [
          ///: <<<<<<======🗄️🗄️🗄️🗄️🗄️🗄️💡💡 Appbar💡💡🗄️🗄️🗄️🗄️🗄️🗄️🗄️>>>>>>>>===========
          CommonHomeAppBar(
            onCalender: (){
              AppRouter.route
                  .pushNamed(RoutePath.scheduleScreen, extra: userRole);
            },
            isCalender: true,
            scaffoldKey: scaffoldKey,
            name: "Masum",
            image: AppConstants.demoImage,
            onTap: () {
              AppRouter.route
                  .pushNamed(RoutePath.notificationScreen, extra: userRole);
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              // Wrap everything in a SingleChildScrollView
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    ///: <<<<<<======✅✅ job post✅✅>>>>>>>>===========
                    CustomTitle(
                      title: AppStrings.jobPost,
                      actionText: AppStrings.seeAll,
                      onActionTap: () {
                        AppRouter.route
                            .pushNamed(RoutePath.jobPostAll, extra: userRole);
                      },
                      actionColor: AppColors.secondary,
                    ),SizedBox(
                      height: 12.h,
                    ),
                    // Barber shop cards
                    Column(
                      children: List.generate(2, (index) {
                        return CustomBorderCard(
                          title: 'Barber Shop',
                          time: '10:00am-10:00pm',
                          price: '£20.00/Per hr',
                          date: '02/10/23',
                          buttonText: 'Apply',
                          isButton: true,
                          isSeeDescription: true,
                          onButtonTap: () {
                            // Handle button tap logic
                          },
                          logoImage: Assets.images.logo.image(height: 50),
                          seeDescriptionTap: () {},
                        );
                      }),
                    ),

                    ///: <<<<<<======✅✅ Feed✅✅>>>>>>>>===========

                    CustomTitle(
                      title: "Feed",
                      actionText: AppStrings.seeAll,
                      onActionTap: () {
                        AppRouter.route
                            .pushNamed(RoutePath.feedAll, extra: userRole);
                      },
                      actionColor: AppColors.secondary,
                    ),


                    SizedBox(
                      height: 12.h,
                    ),

                    // Feed Cards Section
                    Column(
                      children: List.generate(4, (index) {
                        return CustomFeedCard(
                          userImageUrl: AppConstants.demoImage,
                          userName: "Roger Hunt",
                          userAddress:
                              "2972 Westheimer Rd. Santa Ana, Illinois 85486",
                          postImageUrl: AppConstants.demoImage,
                          postText:
                              "Fresh Cut, Fresh Start! 🔥💈 Kickstart your day with confidence!#BarberLife #StayFresh",
                          rating: "5.0 * (169)",
                          onFavoritePressed: () {
                            // Handle favorite button press
                          },
                          onVisitShopPressed: () {
                            AppRouter.route.pushNamed(
                                RoutePath.visitShop,
                                extra: userRole);
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
