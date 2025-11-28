import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/screens/navigation/navigationscreen.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({super.key});

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      appBar: AppBar(
        backgroundColor: Appcolors.appColors.shade50,
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Get.to(NavigationScreen(index: 4));
        }, 
        icon: Icon(Icons.arrow_back,color: Appcolors.appColors.shade100)),
        title: Text('Delivery Addresses',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Appcolors.appColors.shade100,
          fontWeight: FontWeight.w700,
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                Text('Saved Address',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Appcolors.appColors.shade100,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),),
            16.vspace,
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xff1F1F1F),
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
                    children: [
                      Image.asset(Appimage.delivery1),
                      8.hspace,
                      Text('My Home Address',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Appcolors.appColors.shade100,
                        fontWeight: FontWeight.w600,
                      ),),
                      Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.appColors.shade600,
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(8)
                          )
                        ),
                        onPressed: (){}, 
                      child: Text('Default',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Appcolors.appColors.shade100
                      ),))
                    ],
                  ),
                    Text('123, Green Park Avenue, Besant Nagar, \nChennai, 600001',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Color(0xff838383),
                        fontWeight: FontWeight.w400,
                      ),),
                      4.vspace,
                        Text('+91 9876543210',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Color(0xff838383),
                        fontWeight: FontWeight.w400,
                      ),),
                      12.vspace,
                    Divider(
                      thickness: 1,
                      color: Color(0xffDEE1E6),
                    ),
                    12.vspace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Appcolors.appColors.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8)
                            )
                          ),
                          onPressed: (){},
                          child: Text('Default Address',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Color(0xffBDC1CA),
                            fontWeight: FontWeight.w500,
                          ),),
                        ),
                        Spacer(),
                        Image.asset(Appimage.edit),
                        24.hspace,
                        Image.asset(Appimage.delete1,color: Color(0xffD74753),)
                      ],
                    )
                ],
              ),
            ),
            24.vspace,
             Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xff1F1F1F),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(Appimage.delivery2),
                      8.hspace,
                      Text('Office Location',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Appcolors.appColors.shade100,
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                  16.vspace,
                    Text('45, Tech Park Road, Guindy, Chennai, Tamil\n Nadu, 600032, India',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Color(0xff838383),
                        fontWeight: FontWeight.w400,
                      ),),
                      4.vspace,
                        Text('+91 8765432109',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Color(0xff838383),
                        fontWeight: FontWeight.w400,
                      ),),
                      12.vspace,
                    Divider(
                      thickness: 1,
                      color: Color(0xffDEE1E6),
                    ),
                    12.vspace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Appcolors.appColors.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8)
                            )
                          ),
                          onPressed: (){},
                          child: Text('Set as Default',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Color(0xffBDC1CA),
                            fontWeight: FontWeight.w500,
                          ),),
                        ),
                        Spacer(),
                        Image.asset(Appimage.edit),
                        24.hspace,
                        Image.asset(Appimage.delete1,color: Color(0xffD74753),)
                      ],
                    )
                ],
              ),
            ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Custombuttonwidget(text: '+ Add New Address', 
        color: Appcolors.appColors.shade600, textColor: Appcolors.appColors.shade100,onPressed: (){
          Get.toNamed(Appnames.deliveryadd);
        },),
      ),
    );
  }
}