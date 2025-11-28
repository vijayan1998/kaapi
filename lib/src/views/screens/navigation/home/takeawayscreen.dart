import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/model/home_model.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';

class TakeawayScreen extends StatefulWidget {
  const TakeawayScreen({super.key});

  @override
  State<TakeawayScreen> createState() => _TakeawayScreenState();
}

class _TakeawayScreenState extends State<TakeawayScreen> {

List<Takeawaymodel> takeList=[
  Takeawaymodel(image: Appimage.coffee5, subtitle: 'Fast Pickup', title: 'Cappuccino'),
  Takeawaymodel(image: Appimage.coffee6, subtitle: 'Fast Pickup', title: 'Espresso'),
  Takeawaymodel(image: Appimage.coffee3, subtitle: 'Fast Pickup', title: 'Latte'),
  Takeawaymodel(image: Appimage.coffee4, subtitle: 'Fast Pickup', title: 'Mocha'),
];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          16.vspace,
            Text('Good morning, Ethan',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Appcolors.appColors.shade100,
              fontWeight: FontWeight.w500,
            ),),
            16.vspace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Text('Reorder your usual',style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Appcolors.appColors.shade100,
              fontWeight: FontWeight.w500,
            ),),
               Text('Cappuccino • 1 item',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Color(0xffCFB88C),
              fontWeight: FontWeight.w500,
            ),),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff4A3D21),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12)
                    )
                  ),
                  onPressed: (){
                    Get.toNamed(Appnames.myorderscreen);
                },
                 child: Text('Reorder',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                 ),))
              ],),
                16.vspace,
                Text('Quick Picks for You',style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Appcolors.appColors.shade100,
              fontWeight: FontWeight.w500,
            ),),
             16.vspace,
            GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 2.3 / 3
                    ), 
                    itemCount: takeList.length,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){
                          // Get.toNamed(Appnames.homedetails);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(takeList[index].image),
                            4.vspace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(takeList[index].title,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Appcolors.appColors.shade100,
                              fontSize: 16
                            ),),
                            4.vspace,
                              Text(takeList[index].subtitle,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Color(0xffCFB88C),
                                  fontWeight: FontWeight.w500
                                ),),
                                  ],
                                ),
                              24.hspace,
                                Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Appcolors.appColors.shade300,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(Icons.add,color: Appcolors.appColors.shade100,size: 20,)),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                24.vspace,
                            Custombuttonwidget(text: 'Go to cart', 
                            color: Appcolors.appColors.shade600, 
                            textColor: Appcolors.appColors.shade100,
                            onPressed: (){
                              Get.toNamed(Appnames.cartScreen);
                            },),
              
        ],
      ),
    );
  }
}