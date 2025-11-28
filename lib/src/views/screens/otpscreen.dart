import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';
import 'package:pinput/pinput.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
    TextEditingController pinputController = TextEditingController();
     final focusNode = FocusNode(); 
  @override
  Widget build(BuildContext context) {
      final defaultPinTheme = PinTheme(
      width: 56,
      height: 66,
      textStyle:  TextStyle(
        fontSize: 24,
        color:Appcolors.appColors.shade100,
      ),
      decoration: BoxDecoration(
        color: Color(0xff362E2B),
        borderRadius: BorderRadius.circular(12)
      ),
    );
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.vspace,
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(Appimage.questions),
              ),
              24.vspace,
              Center(
                child: Text('Verify OTP',style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                  fontWeight: FontWeight.w700,
                ),),
              ),
              12.vspace,
               Center(
                child: Text('We have sent an OTP to +1 555-123-4567',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Appcolors.appColors.shade100,
                  fontWeight: FontWeight.w400,
                ),),
              ),
              46.vspace,
                Pinput(
                        controller: pinputController,
                        focusNode: focusNode,
                        length: 6,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: Color(0xff362E2B),
                            border: Border.all(color: Color(0xff362E2B)),
                          ),
                        ),
                        submittedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: Color(0xff362E2B),
                            border: Border.all(color: Color(0xff362E2B)),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyBorderWith(
                          border: Border.all(color: Colors.redAccent),
                        ),
                        onSubmitted: (value) {
                        },
                      ),
                  36.vspace,
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Resend OTP in 00:30',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Color(0xffB2A8A3)
                        ),)
                      ],
                    ),
                  ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.6,
              ),
                Custombuttonwidget(text: 'Verify & Continue', 
         color:  Appcolors.appColors.shade200, textColor: Appcolors.appColors.shade100,
         onPressed: (){
            Get.toNamed(Appnames.navigator);
         },),
         24.vspace,
         InkWell(
          onTap: (){
            Get.toNamed(Appnames.wrongScreen);
          },
           child: Center(
                  child: Text('Wrong number? Change',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Appcolors.appColors.shade100,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
         ),
              24.vspace,
            ],
          ),
        ),
      ),
     
    );
  }
}