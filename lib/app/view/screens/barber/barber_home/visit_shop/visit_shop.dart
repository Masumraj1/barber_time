import 'package:barber_time/app/core/route_path.dart';
import 'package:barber_time/app/core/routes.dart';
import 'package:barber_time/app/utils/enums/user_role.dart';
import 'package:barber_time/app/view/common_widgets/common_profile_total_card/common_profile_total_card.dart';
import 'package:barber_time/app/view/common_widgets/custom_button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:barber_time/app/core/custom_assets/assets.gen.dart';
import 'package:barber_time/app/utils/app_colors.dart';
import 'package:barber_time/app/utils/app_constants.dart';
import 'package:barber_time/app/utils/app_strings.dart';
import 'package:barber_time/app/view/common_widgets/custom_appbar/custom_appbar.dart';
import 'package:barber_time/app/view/common_widgets/custom_network_image/custom_network_image.dart';
import 'package:barber_time/app/view/common_widgets/custom_text/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class VisitShop extends StatefulWidget {
  const VisitShop({super.key});

  @override
  State<VisitShop> createState() => _VisitShopState();
}

class _VisitShopState extends State<VisitShop> {
  bool isFollowing = false;

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
      backgroundColor: AppColors.linearFirst,
      //==================✅✅Header✅✅===================
      appBar: const CustomAppBar(
        appBarBgColor: AppColors.linearFirst,
        appBarContent: "Barber Profile",
        iconData: Icons.arrow_back,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        const CustomText(
                          text: "Christian Ronaldo",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _customButton(isFollowing ? "Unfollow" : "Follow", Icons.person_add),
                            const SizedBox(width: 10),
                            _iconButton(Assets.images.chartSelected.image(
                              color: Colors.white,
                              height: 15,
                            )),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: CustomText(
                            maxLines: 20,
                            text:
                                "Great haircuts aren’t just a service; they’re an experience! With 10 years in the game, I specialize in fades, tapers, and beard perfection.",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        //==================✅✅Image✅✅===================
                        CustomNetworkImage(
                          imageUrl: AppConstants.demoImage,
                          height: 100,
                          width: 100,
                          boxShape: BoxShape.circle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      //==================✅✅Total Card✅✅===================
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonProfileTotalCard(
                              title: AppStrings.ratings, value: "290+"),
                          SizedBox(width: 8),
                          CommonProfileTotalCard(
                              title: AppStrings.following, value: "150+"),
                          SizedBox(width: 8),
                          CommonProfileTotalCard(
                              title: "Follower", value: "500+"),
                        ],
                      ),
                      const CustomText(
                        top: 10,
                        bottom: 8,
                        text: " Current Work",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),

                      const CustomText(
                        textAlign: TextAlign.start,
                        maxLines: 20,
                        text:
                            "I am currently employed as a barber at [Barber Time ], where I perform a variety of tasks including cutting, styling, and grooming hair for clients.",
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: AppColors.black,
                      ),

                      SizedBox(
                        height: 35.h,
                      ),
                      const CustomText(
                        text: "Skills & Experience(5 years )",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: List.generate(4, (index) {
                          return const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.arrow_forward,
                                color: AppColors.black,
                              ),
                              Expanded(
                                child: CustomText(
                                  textAlign: TextAlign.start,
                                  maxLines: 5,
                                  text:
                                      "Fades & Tapers –Clean low, mid, high, and skin fades",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                      const CustomText(
                        top: 10,
                        text: 'Photo Gallery',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white50,
                        bottom: 10,
                      ),

                      CustomNetworkImage(
                          imageUrl: AppConstants.demoImage,
                          height: 78,
                          width: 96),
                      const SizedBox(
                        height: 20,
                      ),


                      userRole == UserRole.owner?
                      Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: CustomButton(
                                title: AppStrings.rejected,
                                onTap: () {},
                                fillColor: Colors.white,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              flex: 5,
                              child: CustomButton(
                                onTap: () {},
                                fillColor: AppColors.bottomColor,
                                title: AppStrings.approve,
                                textColor: Colors.white,
                              )),
                        ],
                      ):const SizedBox(),

                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  // Function to toggle Follow/Unfollow state
  void _toggleFollow() {
    setState(() {
      isFollowing = !isFollowing; // Toggle the follow state
    });
  }

  // Custom Follow/Unfollow button
  Widget _customButton(String text, IconData icon) {
    return GestureDetector(
      onTap: _toggleFollow, // Toggle follow state on tap
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, size: 14, color: Colors.white),
            const SizedBox(width: 6),
            CustomText(
              text: text,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
  Widget _iconButton(Widget icon) {
    return GestureDetector(
        onTap: (){
          AppRouter.route
              .pushNamed(RoutePath.chatScreen, );
        },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: icon,
      ),
    );
  }
}
