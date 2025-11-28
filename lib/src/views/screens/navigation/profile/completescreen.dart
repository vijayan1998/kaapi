import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';

class CompleteScreen extends StatefulWidget {
  const CompleteScreen({super.key});

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Order #23645',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Color(0xffBDA89E),
                          ),),
                          Text('Latte + Blueberry Muffin',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color:Appcolors.appColors.shade100,
                            fontWeight: FontWeight.w600,
                          ),),
                          Text('Aug 22, 10:45 AM',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Color(0xffBDA89E),
                          ),),
                          8.vspace,
                          ElevatedButton(onPressed: (){
                              Get.toNamed(Appnames.reorderscreen);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff40332B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(12)
                            )
                          ), 
                          child: Row(
                            children: [
                              Text('Reorder',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Appcolors.appColors.shade100,
                              ),),
                              8.hspace,
                              Icon(Icons.arrow_forward,color: Appcolors.appColors.shade100,size: 16,)
                            ],
                          ))
                        ],
                      ),
                      Image.asset(Appimage.coffee4,height: 120,width: 120,),
                        ],
                      ),
                      16.vspace,
                   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Order #23646',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Color(0xffBDA89E),
                          ),),
                          Text('Cappuccino + Croissant',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color:Appcolors.appColors.shade100,
                            fontWeight: FontWeight.w600,
                          ),),
                          Text('Aug 21, 9:30 AM',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Color(0xffBDA89E),
                          ),),
                          8.vspace,
                          ElevatedButton(onPressed: (){
                               Get.toNamed(Appnames.reorderscreen);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff40332B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(12)
                            )
                          ), 
                          child: Row(
                            children: [
                              Text('Reorder',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Appcolors.appColors.shade100,
                              ),),
                              8.hspace,
                              Icon(Icons.arrow_forward,color: Appcolors.appColors.shade100,size: 16,)
                            ],
                          ))
                        ],
                      ),
                      Image.asset(Appimage.coffee6,height: 120,width: 120,),
                        ],
                      ),
                      16.vspace,
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Order #23647',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Color(0xffBDA89E),
                          ),),
                          Text('Espresso + Donut',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color:Appcolors.appColors.shade100,
                            fontWeight: FontWeight.w600,
                          ),),
                          Text('Aug 20, 11:15 AM',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Color(0xffBDA89E),
                          ),),
                          8.vspace,
                          ElevatedButton(onPressed: (){
                             Get.toNamed(Appnames.reorderscreen);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff40332B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(12)
                            )
                          ), 
                          child: Row(
                            children: [
                              Text('Reorder',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Appcolors.appColors.shade100,
                              ),),
                              8.hspace,
                              Icon(Icons.arrow_forward,color: Appcolors.appColors.shade100,size: 16,)
                            ],
                          ))
                        ],
                      ),
                      Image.asset(Appimage.coffee5,height: 120,width: 120,),
                        ],
                      ),
        ],
      ),
    );
  }
}