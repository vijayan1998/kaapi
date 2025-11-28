import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';

class ReorderaddScreen extends StatefulWidget {
  const ReorderaddScreen({super.key});

  @override
  State<ReorderaddScreen> createState() => _ReorderaddScreenState();
}

class _ReorderaddScreenState extends State<ReorderaddScreen> {
   List<Map<String, dynamic>> cartlist = [
    {'image': Appimage.coffee5, 'price': '₹120', 'title': 'Cappuccino'},
    {'image': Appimage.coffee1, 'price': '₹120', 'title': 'Latte'},
    {'image': Appimage.coffee7, 'price': '₹100', 'title': 'Espresso'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
        appBar: AppBar(
        backgroundColor: Appcolors.appColors.shade50,
        centerTitle: true,
        leading: IconButton(onPressed: (){
        Get.toNamed(Appnames.myorderscreen);
        },
        icon: Icon(Icons.arrow_back,color: Appcolors.appColors.shade100)),
        title: Text('Reorder',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Appcolors.appColors.shade100,
          fontWeight: FontWeight.w700,
        ),),
        actions: [
          IconButton(onPressed: (){}, icon: Image.asset(Appimage.order,color: Appcolors.appColors.shade100),),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              itemCount: cartlist.length,
              itemBuilder: (context, index) {
                final cart = cartlist[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(8),
                            child: Image.asset(
                              cart['image'],
                              height: 56,
                              width: 56,
                            ),
                          ),
                          16.hspace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                cart['price'],
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge!.copyWith(
                                  color: Appcolors.appColors.shade100,
                                ),
                              ),
                              Text(
                                cart['title'],
                                style: Theme.of(context).textTheme.bodyLarge!
                                    .copyWith(color: Color(0xff8A7361)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Appcolors.appColors.shade300,
                            child: Text('-',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Appcolors.appColors.shade100,
                              fontSize: 20
                            ),),
                          ),
                          8.hspace,
                          Text('1',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Appcolors.appColors.shade100,
                            ),),
                          8.hspace,
                           CircleAvatar(
                            radius: 20,
                            backgroundColor: Appcolors.appColors.shade300,
                            child: Text('+',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Appcolors.appColors.shade100,
                            ),),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(padding: EdgeInsets.all(16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff40332B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              )
            ),
            onPressed: (){
              Get.toNamed(Appnames.orderplaced);
            }, 
          child: Text('Buy Now',style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Appcolors.appColors.shade100,
          ),)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff4D2C03),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              )
            ),
            onPressed: (){}, 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.add,color: Appcolors.appColors.shade100),
              16.hspace,
              Text('Add Items',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Appcolors.appColors.shade100,
              ),),
            ],
          ))
        ],
      ),),
    );
  }
}