import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kappi/src/views/screens/otpscreen.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phone = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            Appimage.login,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.4,
            fit: BoxFit.fill,
          ),
          24.vspace,
          Center(
            child: Text(
              'Login / Sign Up',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          8.vspace,
          Center(
            child: Text(
              'Enter your phone number to continue',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          16.vspace,
          Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IntlPhoneField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
            ),
          ),
        ],
      ),
      bottomNavigationBar:Padding(padding: EdgeInsets.all(16),
            child: Custombuttonwidget(text: 'Send OTP', 
            color: Appcolors.appColors.shade200, textColor: Appcolors.appColors.shade100,
            onPressed: () async {
              if(formkey.currentState!.validate()){
                if(phone.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(16)
                ),
                content: Text('Please Enter Your Phone Number',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
              ),),
              backgroundColor: Appcolors.appColors.shade200,));
                } 
                else{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Otpscreen(phone: phone.text)));
                } 
                //  context.read<LoginBloc>().add(LoginPostEvent(phone: phone.text)); 
              } 
            },),)
    );
  }
}
