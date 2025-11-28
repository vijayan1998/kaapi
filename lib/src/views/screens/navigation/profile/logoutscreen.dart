import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/screens/navigation/navigationscreen.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      appBar: AppBar(
        backgroundColor: Appcolors.appColors.shade50,
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Get.to(NavigationScreen(index: 4));
        }, icon: Icon(Icons.arrow_back,color: Appcolors.appColors.shade100,)),
        title: Text('Logout',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Appcolors.appColors.shade100,
          fontWeight: FontWeight.w700,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(Appimage.logoutimg),
            ),
            16.vspace,
            Center(
              child: Text('Are you sure you want to log out?',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600
              ),),
            ),
            24.vspace,
            Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xff1F1F1F),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text('You’ll need to sign in again to access your orders, rewards, and saved preferences.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Color(0xff838383)
              ),
              textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Custombuttonwidget(text: 'Logout', 
            color: Color(0xffE33D47), textColor: Appcolors.appColors.shade100,
            onPressed: (){
              Get.toNamed(Appnames.loginScreen);
            },),
            16.vspace,
            Custombuttonwidget(text: 'Cancel', 
            color: Color(0xff1F1F1F), textColor: Appcolors.appColors.shade100,
            onPressed: (){
              Get.to(NavigationScreen(index: 4));
            },),
          ],
        ),
      ),
    );
  }
}