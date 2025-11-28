import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';

import '../utilies/route_name.dart';

class WrongNumberScreen extends StatefulWidget {
  const WrongNumberScreen({super.key});

  @override
  State<WrongNumberScreen> createState() => _WrongNumberScreenState();
}

class _WrongNumberScreenState extends State<WrongNumberScreen> {
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                child: Text('Wrong number? \nLet’s fix it.',style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
                ),
              ),
              12.vspace,
               Center(
                child: Text('Enter the correct phone number to receive OTP.',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Appcolors.appColors.shade100,
                  fontWeight: FontWeight.w400,
                ),),
              ),
              24.vspace,
              IntlPhoneField(
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Appcolors.appColors.shade700,
                fontSize: 18,
              ),
              textAlign: TextAlign.start,
              controller: phone,
              dropdownTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Appcolors.appColors.shade700,
              ),
              dropdownIcon: Icon(
                Icons.arrow_drop_down,
                color: Appcolors.appColors.shade700,
              ),
              dropdownIconPosition: IconPosition.trailing,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                border: OutlineInputBorder(
                  gapPadding: 2.0,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Color(0xff664533)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Color(0xff664533), width: 1.0),
                ),
                hintText: 'Enter  10 digit phone number',
                hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Appcolors.appColors.shade700,
                ),
                errorStyle: TextStyle(
                  color: Appcolors.appColors.shade700,
                  fontWeight: FontWeight.bold,
                ),
                counterStyle: TextStyle(
                  color: Appcolors.appColors.shade700,
                  fontSize: 12,
                ),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {},
              validator: (value) {
                if (value == null) {
                  return 'Please enter a phone number';
                } else if (!value.isValidNumber()) {
                  return 'Please enter a valid phone number';
                } else {
                  return null;
                }
              },
            ),
                  24.vspace,
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('We’ll send an OTP to this number.',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Color(0xffB2A8A3)
                        ),)
                      ],
                    ),
                  ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.6,
              ),
                Custombuttonwidget(text: 'Send OTP →', 
         color:  Appcolors.appColors.shade200, textColor: Appcolors.appColors.shade100,
         onPressed: (){
            Get.toNamed(Appnames.wrongOTPscreen);
         },),
         24.vspace,
         Center(
                child: Text('By continuing, you agree to our Terms of Service and Privacy Policy.',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Appcolors.appColors.shade100,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
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