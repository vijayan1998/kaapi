import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            color: Color(0xff211712),
            alignment: Alignment.center,
            child: Text('Membership Plans',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Appcolors.appColors.shade100,
              fontWeight: FontWeight.w700,
            ),),
          ),
          Image.asset(Appimage.member,fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Join our membership program to enjoy exclusive benefits, discounts, and early access to new coffee blends.',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
          ),
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color(0xff211712),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [ 
                    Text('Current Plan',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Appcolors.appColors.shade400,
                    ),),
                    4.vspace,
                    Text('Gold Member',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Appcolors.appColors.shade100,
                      fontWeight: FontWeight.w600
                    ),),
                    4.vspace,
                     Text('Expires on December 31, 2025',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Appcolors.appColors.shade400,
                    ),),
                    12.vspace,
                    CommonButtonWidget(text: 'Manage',onTap: (){
                      Get.toNamed(Appnames.membershipdetails);
                    },),
                  ],
                ),
                Image.asset(Appimage.member1),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Explore Plans',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Appcolors.appColors.shade100,
              fontWeight: FontWeight.w600,
            ),),
          ),
           Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color(0xff211712),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [ 
                    Text('Free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Appcolors.appColors.shade100,
                      fontWeight: FontWeight.w600
                    ),),
                    4.vspace,
                     SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                       child: Text('Enjoy basic benefits and access to our coffee shop',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Appcolors.appColors.shade400,
                                           ),),
                     ),
                    12.vspace,
                    CommonButtonWidget(text: 'Join',
                    onTap: (){
                      Get.toNamed(Appnames.membershipdetails);
                    },),
                  ],
                ),
                Image.asset(Appimage.member2),
              ],
            ),
          ),
           Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color(0xff211712),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [ 
                    Text('Gold',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Appcolors.appColors.shade100,
                      fontWeight: FontWeight.w600
                    ),),
                    4.vspace,
                     SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                       child: Text('Unlock exclusive discounts and early access to new blends',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Appcolors.appColors.shade400,
                                           ),),
                     ),
                    12.vspace,
                    CommonButtonWidget(text: 'Subscribe',
                    onTap: (){
                      Get.toNamed(Appnames.membershipdetails);
                    },),
                  ],
                ),
                Image.asset(Appimage.member3),
              ],
            ),
          ),
           Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color(0xff211712),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [ 
                    Text('VIP',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Appcolors.appColors.shade100,
                      fontWeight: FontWeight.w600
                    ),),
                    4.vspace,
                     SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                       child: Text('Experience the ultimate coffee journey with premium perks',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Appcolors.appColors.shade400,
                                           ),),
                     ),
                    12.vspace,
                    CommonButtonWidget(text: 'Subscribe',onTap: (){
                      Get.toNamed(Appnames.membershipdetails);
                    },),
                  ],
                ),
                Image.asset(Appimage.member4),
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}

class CommonButtonWidget extends StatelessWidget {
  final String text;
  final Function()? onTap;
  
  const CommonButtonWidget({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Appcolors.appColors.shade300,
         borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(text,style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
            8.hspace,
            Icon(Icons.arrow_forward_ios,color: Appcolors.appColors.shade100,size: 16,),
          ],
        ),
      ),
    );
  }
}