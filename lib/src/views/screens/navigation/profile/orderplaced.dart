import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';

class OrderPlaced extends StatefulWidget {
  const OrderPlaced({super.key});

  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
        appBar: AppBar(
        backgroundColor: Appcolors.appColors.shade50,
        centerTitle: true,
        leading: IconButton(onPressed: (){
        Get.toNamed(Appnames.reorderscreen);
        },
        icon: Icon(Icons.arrow_back,color: Appcolors.appColors.shade100)),
        title: Text('Order Placed!',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Appcolors.appColors.shade100,
          fontWeight: FontWeight.w700,
        ),),
        actions: [
          IconButton(onPressed: (){}, icon: Image.asset(Appimage.order,color: Appcolors.appColors.shade100),),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(Appimage.placed,fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width),
              16.vspace,
              Text('Order #123456',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),), 
               Text('1x Iced Latte, 1x Croissant',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Appcolors.appColors.shade100,
              ),),
               Text('Store: The Daily Grind',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Appcolors.appColors.shade100,
              ),),
               Text('123 Main St, 0.5 mi',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Appcolors.appColors.shade100,
              ),), 
              24.vspace,
              Text('Estimated Pickup Time',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),),
              16.vspace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff40332B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8)
                            )
                          ),
                          onPressed: (){}, 
                        child: Text('15',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Appcolors.appColors.shade100,
                        ),)),
                      ),
                     16.vspace,
                     Text('Minutes',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Appcolors.appColors.shade100,
                     ),)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff40332B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8)
                            )
                          ),
                          onPressed: (){}, 
                        child: Text('00',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Appcolors.appColors.shade100,
                        ),)),
                      ),
                     16.vspace,
                     Text('Seconds',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Appcolors.appColors.shade100,
                     ),)
                    ],
                  )
                ],
              ),
              16.vspace,
              Image.asset(Appimage.locations,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill),
              24.vspace,
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(Appimage.orderplaced1),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                        child: Container(
                          alignment: Alignment.center,
                          height: 15,
                          width: 2,
                          color: Color(0xffE5E0DB),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                        child: Container(
                          alignment: Alignment.center,
                          height: 5,
                          width: 2,
                          color: Color(0xffE5E0DB),
                        ),
                      ),
                    ],
                  ),
                  16.hspace,
                  Text('Order Placed',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Color(0xffFE9B20),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,    
                  ),),                
                ]
              ),
              6.vspace,
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(Appimage.orderplaced2),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                        child: Container(
                          alignment: Alignment.center,
                          height: 15,
                          width: 2,
                          color: Color(0xffE5E0DB),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                        child: Container(
                          alignment: Alignment.center,
                          height: 5,
                          width: 2,
                          color: Color(0xffE5E0DB),
                        ),
                      ),
                    ],
                  ),
                  16.hspace,
                  Text('Preparing',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Color(0xffFE9B20),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,    
                  ),),                
                ]
              ),
               6.vspace,
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Image.asset(Appimage.orderplaced3),
                  16.hspace,
                  Text('Ready for Pickup',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color:Appcolors.appColors.shade100,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,    
                  ),),                
                ]
              ),
              24.vspace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Delivery Partner',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Appcolors.appColors.shade100,
                      ),),
                       Text('15 mins',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Appcolors.appColors.shade100,
                      ),),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff362417),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(8),
                      )
                    ),
                    onPressed: (){}, 
                  child: Text('Contact Delivery',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Appcolors.appColors.shade100,
                  ),))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}