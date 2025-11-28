import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';

class Cartsecondscreen extends StatefulWidget {
  const Cartsecondscreen({super.key});

  @override
  State<Cartsecondscreen> createState() => _CartsecondscreenState();
}

class _CartsecondscreenState extends State<Cartsecondscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appcolors.appColors.shade50,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.toNamed(Appnames.cartScreen);
        },icon: Icon(Icons.arrow_back, color: Appcolors.appColors.shade100)),
        backgroundColor: Appcolors.appColors.shade50,
        centerTitle: true,
        title: Text(
          'Your Cart',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Appcolors.appColors.shade100,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(Appimage.cartimg)),
            24.vspace,
            Center(child: Text('Your cart is empty',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Appcolors.appColors.shade100,
              fontWeight: FontWeight.w600
            ),),),
            16.vspace,
             Center(child: Text('Explore our menu and add some delicious items to your cart.',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Appcolors.appColors.shade100,
              fontWeight: FontWeight.w400
            ),
            textAlign: TextAlign.center,),
            ),
            36.vspace,
            Custombuttonwidget(text: 'Explore Menu', 
            color: Appcolors.appColors.shade600, 
            textColor: Appcolors.appColors.shade100,
            onPressed: (){},),
          ],
        ),
      ),
    );
  }
}