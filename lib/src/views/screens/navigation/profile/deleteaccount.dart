import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/screens/navigation/navigationscreen.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  bool isvalue = false;
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
        title: Text('Delete account',style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
              Center(
                child: Image.asset(Appimage.delete2),
              ),
              16.vspace,
              Center(
                child: Text('We\'re sad to see you go!',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),),
              ),
              16.vspace,
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xff1F1F1F),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Deleting your account will permanently remove all your data, including order history and personal information. This action cannot be undone.',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Color(0xff838383),
                    ),),
                    12.vspace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          activeColor: Appcolors.appColors.shade100,
                          checkColor: Appcolors.appColors.shade50,
                          value: isvalue, 
                        onChanged: (bool? newvalue){
                          setState(() {
                            isvalue = newvalue!;
                          });
                        }),
                        12.hspace,
                         SizedBox(
                          width: MediaQuery.of(context).size.width / 1.8,
                           child: Text('I understand that my account and data will be permanently deleted',
                                               style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                 color: Color(0xff838383),
                                               ),),
                         ),
                      ],
                    ),
                  ],
                ),
              ),
              16.vspace,
               Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: Color(0xff838383)
                  )
                ),
                 child: DropdownButton(
                       hint:Text('Reason for  leaving  (optional)',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                         color: Color(0xff838383)
                       ),),
                       isExpanded: true,
                       underline: SizedBox(),
                       iconSize: 30.0,
                       dropdownColor: Appcolors.appColors.shade50,
                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                         color: Color(0xff838383),
                       ),
                       items: ['One', 'Two', 'Three'].map(
                         (val) {
                           return DropdownMenuItem<String>(
                             value: val,
                             child: Text(val),
                           );
                         },
                       ).toList(),
                       onChanged: (val) {
                         setState(
                           () {
                             // _dropDownValue = val;
                           },
                         );
                       },
                     ),
               ),
            ],
          ),
        ),
      ),
         bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Custombuttonwidget(text: 'Delete My Account', 
            color: Color(0xffE33D47), textColor: Appcolors.appColors.shade100,
            onPressed: (){
              Get.to(Appnames.loginScreen);
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