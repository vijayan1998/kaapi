import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/widget/custom_button.dart';
import 'package:kappi/src/views/widget/onboarding_widget.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Expanded(
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            children: [
              OnboardingWidget(
                image: Appimage.kappisplash, 
                text: 'Skip', 
                onTap: (){
                 Get.toNamed(Appnames.loginScreen);
                },
                skipColor:Appcolors.appColors.shade100,
                titleColor: Appcolors.appColors.shade100,
                subtitleColor: Appcolors.appColors.shade100,
                image1: Appimage.splash1, 
                title: 'Freshly Brewed Happiness', 
                subtitle: 'Start your day with the perfect cup, anytime, anywhere.', 
                buttonWidget:Custombuttonwidget(text: 'Next', color: Appcolors.appColors.shade200, textColor: Appcolors.appColors.shade100,
                onPressed: (){
                  pageController.nextPage(duration: Duration(milliseconds: 300), 
                  curve: Curves.easeInOut);
                },),
                pageController: pageController),
                 OnboardingWidget(
                image: Appimage.kappisplash2, 
                text: 'Skip', 
                onTap: (){
                   Get.toNamed(Appnames.loginScreen);
                },
                skipColor:Appcolors.appColors.shade50,
                titleColor: Appcolors.appColors.shade50,
                subtitleColor: Appcolors.appColors.shade50,
                image1: Appimage.splash2, 
                title: 'Dine In or Takeaway', 
                subtitle: 'Enjoy coffee your way – sit back and relax or grab it on the go.', 
                buttonWidget:Custombuttonwidget(text: 'Next', color: Appcolors.appColors.shade200, textColor: Appcolors.appColors.shade100,
                onPressed: (){
                   pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                         curve: Curves.easeInOut,
                        );
                },),
                pageController: pageController),
                 OnboardingWidget(
                image: Appimage.kappisplash3, 
                text: 'Skip', 
                onTap: (){
                  Get.toNamed(Appnames.loginScreen);
                },
                skipColor:Appcolors.appColors.shade100,
                titleColor: Appcolors.appColors.shade100,
                subtitleColor: Appcolors.appColors.shade100,
                image1: Appimage.splash3, 
                title: 'Order & Enjoy', 
                subtitle: 'Easily place your order and get it served hot & fresh.', 
                buttonWidget:Custombuttonwidget(text: 'Get Started', color: Appcolors.appColors.shade200, textColor: Appcolors.appColors.shade100,
                onPressed: (){
                Get.toNamed(Appnames.loginScreen);
                },),
                pageController: pageController)
            ],
          ))
        ],
      )
    );
  }
}
