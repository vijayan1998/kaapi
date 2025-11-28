import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';

class DeliveryAddScreen extends StatefulWidget {
  const DeliveryAddScreen({super.key});

  @override
  State<DeliveryAddScreen> createState() => _DeliveryAddScreenState();
}

class _DeliveryAddScreenState extends State<DeliveryAddScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pincode = TextEditingController();

  bool isvalue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Appcolors.appColors.shade50,
         leading: IconButton(onPressed: (){
          Get.toNamed(Appnames.delivery);
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
              Text('FullName',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),),
              8.vspace,
              TextFormField(
                controller: name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xff1F1F1F),
                  filled: true,
                  suffixIcon: Icon(Icons.person_2_outlined,color: Color(0xff80736B),)
                ),
              ),
              16.vspace,
               Text('Phone',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),),
              8.vspace,
              TextFormField(
                controller: phone,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xff1F1F1F),
                  filled: true,
                  suffixIcon: Icon(Icons.call_outlined,color: Color(0xff80736B),)
                ),
              ),
              16.vspace,
              Text('Address Line 1',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),),
              8.vspace,
              TextFormField(
                controller: address,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xff1F1F1F),
                  filled: true,
                  suffixIcon: Icon(Icons.location_city,color: Color(0xff80736B),)
                ),
              ),
              16.vspace,
              Text('Address Line 2',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),),
              8.vspace,
              TextFormField(
                controller: address1,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xff1F1F1F),
                  filled: true,
                  suffixIcon: Icon(Icons.location_city_outlined,color: Color(0xff80736B),)
                ),
              ),
              16.vspace,
              Text('City',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),),
              8.vspace,
              TextFormField(
                controller: city,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xff1F1F1F),
                  filled: true,
                ),
              ),
              16.vspace,
              Text('State',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),),
              8.vspace,
              TextFormField(
                controller: state,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xff1F1F1F),
                  filled: true,
                ),
              ),
              16.vspace,
              Text('Pin/Zin code',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),),
              8.vspace,
              TextFormField(
                controller: pincode,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xff1F1F1F),
                  filled: true,
                  suffixIcon: Icon(Icons.location_on_outlined,color: Color(0xff80736B),)
                ),
              ),
              16.vspace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text('Set as Default Address',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),),
              Switch(
                inactiveThumbColor: Appcolors.appColors.shade100,
                inactiveTrackColor: Appcolors.appColors.shade50,
                value: false, 
              onChanged: (value){
                setState(() {
                  isvalue = value;
                });
              })
                ],
              ),
              16.vspace,
               Custombuttonwidget(text: 'Save Address', 
          color: Appcolors.appColors.shade600, textColor: Appcolors.appColors.shade100,
          onPressed: (){},),
          16.vspace,
          Custombuttonwidget(text: 'Cancel', 
          color: Color(0xff1F1F1F), textColor: Appcolors.appColors.shade100,
          onPressed: (){},),
          16.vspace,
            ],
          ),
        ),
      ),
    );
  }
}