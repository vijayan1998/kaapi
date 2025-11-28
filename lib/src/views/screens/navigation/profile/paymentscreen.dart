import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/screens/navigation/navigationscreen.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  bool isvalue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      appBar: AppBar(
        backgroundColor: Appcolors.appColors.shade50,
        leading: IconButton(onPressed: (){
          Get.to(NavigationScreen(index: 4));
        }, 
        icon: Icon(Icons.arrow_back,color: Appcolors.appColors.shade100)),
        title: Text('Saved Payment Methods',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Appcolors.appColors.shade100,
          fontWeight: FontWeight.w700,
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                Text('Saved Cards',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),),
            16.vspace,
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xff1F1F1F),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(Appimage.visa),
                      16.hspace,
                      Text('**** **** **** 9876',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Appcolors.appColors.shade100,
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                  16.vspace,
                   Text('John Doe',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Appcolors.appColors.shade100,
                        fontWeight: FontWeight.w600,
                      ),),
                     Text('Exp: 08/27',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Color(0xffBDC1CA),
                        fontWeight: FontWeight.w500,
                      ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(Appimage.check),
                      8.hspace,
                      Text('Set as Default',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Color(0xffBDC1CA),
                        fontWeight: FontWeight.w500,
                      ),),
                      8.hspace,
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffFF0000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(8)
                          )
                        ),
                        onPressed: (){}, 
                      child: Row(
                        children: [
                          Image.asset(Appimage.delete1),
                          16.hspace,
                          Text('Delete',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Color(0xffBDC1CA),
                        fontWeight: FontWeight.w500,
                      ),),
        
                        ],
                      ))
                    ],
                  )
                ],
              ),
            ),
            16.vspace,
             Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xff1F1F1F),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(Appimage.visa1),
                      16.hspace,
                      Text('**** **** **** 1234',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Appcolors.appColors.shade100,
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                  16.vspace,
                   Text('Jane Smith',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Appcolors.appColors.shade100,
                        fontWeight: FontWeight.w600,
                      ),),
                     Text('Exp: 12/25',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Color(0xffBDC1CA),
                        fontWeight: FontWeight.w500,
                      ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                      8.hspace,
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffFF0000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(8)
                          )
                        ),
                        onPressed: (){}, 
                      child: Row(
                        children: [
                          Image.asset(Appimage.delete1),
                          16.hspace,
                          Text('Delete',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Color(0xffBDC1CA),
                        fontWeight: FontWeight.w500,
                      ),),
        
                        ],
                      ))
                    ],
                  ),
                ],
              ),
            ),
            16.vspace,
              Text('Wallets & UPI',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),),
            16.vspace,
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xff1F1F1F),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Text('john.doe@upi',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Color(0xffF3F4F6),
                        fontWeight: FontWeight.w500,
                      ),),
                    Spacer(),
                     Text('Set Default',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Color(0xffBDC1CA),
                        fontWeight: FontWeight.w500,
                      ),),
                    6.hspace,
                    Switch(
                      activeTrackColor: Color(0xff6C9CEF),
                      inactiveTrackColor: Color(0xffBDC1CA),
                      value: isvalue, 
                    onChanged: (value){
                      setState(() {
                        isvalue = value;
                      });
                    }),
                ],
              ),
            ),
            16.vspace,
             Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xff1F1F1F),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(Appimage.paytm),
                  6.hspace,
                   Text('Paytm Wallet',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Color(0xffF3F4F6),
                        fontWeight: FontWeight.w500,
                      ),),
                    Spacer(),
                     Text('Set Default',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Color(0xffBDC1CA),
                        fontWeight: FontWeight.w500,
                      ),),
                    6.hspace,
                    Switch(
                      activeTrackColor: Color(0xff6C9CEF),
                      inactiveTrackColor: Color(0xffBDC1CA),
                      value: false, 
                    onChanged: (value){
                      setState(() {
                        isvalue = value;
                      });
                    }),
                ],
              ),
            ),
            16.vspace,
             Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xff1F1F1F),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(Appimage.googlepay),
                  6.hspace,
                   Text('Google Pay',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Color(0xffF3F4F6),
                        fontWeight: FontWeight.w500,
                      ),),
                    Spacer(),
                     Text('Set Default',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Color(0xffBDC1CA),
                        fontWeight: FontWeight.w500,
                      ),),
                    6.hspace,
                    Switch(
                      activeTrackColor: Color(0xff6C9CEF),
                      inactiveTrackColor: Color(0xffBDC1CA),
                      value: false, 
                    onChanged: (value){
                      setState(() {
                        isvalue = value;
                      });
                    }),
                ],
              ),
            ),
            16.vspace,
            Custombuttonwidget(text: '+ Add New Card', 
            color: Appcolors.appColors.shade600, textColor: Appcolors.appColors.shade100,onPressed: (){},),
            16.vspace,
            ],
          ),
        ),
      ),
    );
  }
}