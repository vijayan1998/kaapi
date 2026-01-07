import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/model/member_model.dart';
import 'package:kappi/src/views/screens/navigation/navigationscreen.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';


class MembershipDetailScreen extends StatefulWidget {
  final String? planname;
  final String? planimg;
  final String? description;
  final String? price;
  final String? termconditions;
  final String? cancelpolicy;
  final List<PlanBenefit>? planbenefit;
  const MembershipDetailScreen({super.key, this.planname, this.planimg, this.description, this.price, this.termconditions, this.cancelpolicy,  this.planbenefit});

  @override
  State<MembershipDetailScreen> createState() => _MembershipDetailScreenState();
}

class _MembershipDetailScreenState extends State<MembershipDetailScreen> {
  @override 
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 24,left: 16,right: 16),
            color: Color(0xff211712),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: (){
                  Get.to(NavigationScreen(index: 1));
                },icon: Icon(Icons.arrow_back,color: Appcolors.appColors.shade100)),
                48.hspace,
                Text('Membership Plans',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Appcolors.appColors.shade100,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Image.asset(Appimage.membership2,width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill),
              16.vspace,
                Text(widget.planname.toString(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Appcolors.appColors.shade100,
              fontWeight: FontWeight.w700,
              fontSize: 18
            ),),
            8.vspace,
              Text(widget.description.toString(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
            8.vspace,
            Text(widget.price.toString(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
            24.vspace,
             Text('Benefits',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Appcolors.appColors.shade100,
              fontWeight: FontWeight.w700,
            ),),
            16.vspace,
            ListView.builder(
              padding: EdgeInsets.all(0),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.planbenefit!.length,
              itemBuilder: (context,index){
                final benefit = widget.planbenefit![index];
                return ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Image.asset(benefit.name.toString() == 'Discount'?  Appimage.discount : benefit.name.toString() == 'Free Delivery' ? Appimage.freedelivery
              : benefit.name.toString() == 'Support' ? Appimage.support : Appimage.notifications1 ),
              title: Text(benefit.name.toString(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Appcolors.appColors.shade100,
              fontWeight: FontWeight.w600
            ),),
            subtitle: Text(benefit.description.toString(),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
            ); 
              },),
            
            // ListTile(
            //   contentPadding: EdgeInsets.all(0),
            //   leading: Image.asset(Appimage.freedelivery),
            //   title: Text(widget.planbenefit!.first.name.toString(),
            // style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //   color: Appcolors.appColors.shade100,
            //   fontWeight: FontWeight.w600
            // ),),
            // subtitle: Text(widget.planbenefit!.first.description.toString(),
            // style: Theme.of(context).textTheme.bodySmall!.copyWith(
            //   color: Appcolors.appColors.shade100,
            // ),),
            // ),
            //  ListTile(
            //   contentPadding: EdgeInsets.all(0),
            //   leading: Image.asset(Appimage.notifications1),
            //   title: Text('Exclusive Blends',
            // style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //   color: Appcolors.appColors.shade100,
            //   fontWeight: FontWeight.w600
            // ),),
            // subtitle: Text('Access to exclusive coffee blends',
            // style: Theme.of(context).textTheme.bodySmall!.copyWith(
            //   color: Appcolors.appColors.shade100,
            // ),),
            // ),
            //  ListTile(
            //   contentPadding: EdgeInsets.all(0),
            //   leading: Image.asset(Appimage.support),
            //   title: Text('Priority Support',
            // style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //   color: Appcolors.appColors.shade100,
            //   fontWeight: FontWeight.w600
            // ),),
            // subtitle: Text('Priority customer support',
            // style: Theme.of(context).textTheme.bodySmall!.copyWith(
            //   color: Appcolors.appColors.shade100,
            // ),),
            // ),
            16.vspace,
             Text('Terms & Validity',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Appcolors.appColors.shade100,
              fontWeight: FontWeight.w700,
            ),),
            8.vspace,
            Text(widget.termconditions.toString(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
            16.vspace,
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  width: 2,
                  color: Appcolors.appColors.shade100,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text('Cancellation Policy',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
            Image.asset(Appimage.arrow)
                    ],
                  ),
                  8.vspace,
                    Text(widget.cancelpolicy.toString(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
                ],
              ),
            ),
            24.vspace,
            Custombuttonwidget(text: 'Join Now', 
         color:  Appcolors.appColors.shade200, textColor: Appcolors.appColors.shade100,
         onPressed: (){
            // Get.toNamed(Appnames.navigator);
         },),
         8.vspace,
              ],
            ),
          ),

          ],
        ),
      ),
    );
  }
}