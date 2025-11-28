import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';

class OTPVerified extends StatefulWidget {
  const OTPVerified({super.key});

  @override
  State<OTPVerified> createState() => _OTPVerifiedState();
}

class _OTPVerifiedState extends State<OTPVerified> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                 Padding(
                   padding: const EdgeInsets.only(right: 16,top: 24),
                   child: InkWell(
                    onTap: (){
                      Get.to(Appnames.wrongOTPscreen);
                    },
                     child: Align(
                                     alignment: Alignment.topRight,
                                     child: Image.asset(Appimage.cancel),
                                   ),
                   ),
                 ),
              24.vspace,
              Image.asset(Appimage.otpverified,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,),
              24.vspace,
               Center(
                child: Text('OTP Verified!',style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                  fontWeight: FontWeight.w600,
                ),),
              ),
              12.vspace,
               Center(
                child: Text('You have successfully verified your number.',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Appcolors.appColors.shade100,
                  fontWeight: FontWeight.w400,
                ),),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(padding: EdgeInsets.all(16),
      child: Custombuttonwidget(text: 'Go to Home', 
         color:  Appcolors.appColors.shade200, textColor: Appcolors.appColors.shade100,
         onPressed: (){
            Get.toNamed(Appnames.navigator);
         },),),
    );
  }
}