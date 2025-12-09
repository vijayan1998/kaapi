import 'package:flutter/material.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingWidget extends StatelessWidget {
  final String image;
  final String text;
  final String image1;
  final String title;
  final String subtitle;
  final Color titleColor;
  final Color subtitleColor;
  final Widget buttonWidget;
  final Color skipColor;
  final PageController pageController;
  final Function()? onTap;

  const OnboardingWidget({super.key, required this.image, required this.text, required this.image1, required this.title, required this.subtitle, required this.buttonWidget, required this.pageController, this.onTap, required this.skipColor, required this.titleColor, required this.subtitleColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      body: Column(
        children: [
            Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/1.35,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(image,
                )),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              24.vspace,
                InkWell(
                  onTap: onTap,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(text,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:skipColor,
                    )),
                  ),
                ),
               26.vspace,
               Center(
                 child: Text(title,style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: titleColor,
                 ),
                 ),
               ),
               12.vspace,
               Center(
                 child: Text(subtitle,style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: subtitleColor,
                 ),
                 textAlign: TextAlign.center,),
               ), 
               28.vspace,
              Image.asset(image1,height:MediaQuery.of(context).size.height / 2.5,width: MediaQuery.of(context).size.width,),
              ],
            ),
          ),
          48.vspace,
           Center(
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                spacing: 16,
                dotColor: Color(0xffFFFFFF),
                activeDotColor: Color(0xff332119),
              ),
            ),
          ),
         
        ],
      ),
      bottomNavigationBar:  Padding(
            padding: const EdgeInsets.all(16.0),
            child: buttonWidget,
          ),
    );
  }
}