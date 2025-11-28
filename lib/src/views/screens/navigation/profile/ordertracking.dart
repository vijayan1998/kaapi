import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';

class OrderTracking extends StatefulWidget {
  const OrderTracking({super.key});

  @override
  State<OrderTracking> createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
 List<Map<String,dynamic>> trackinglist = [
  {
    'image':Appimage.coffee1,
    'title':'Cappuccino',
  },
  {
    'image':Appimage.coffee2,
    'title':'Espresso',
  },
  {
    'image':Appimage.coffee3,
    'title':'Latte',
  },
  {
    'image':Appimage.coffee4,
    'title':'Mocha',
  },
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
        appBar: AppBar(
        backgroundColor: Appcolors.appColors.shade50,
        leading: IconButton(onPressed: (){
        Get.toNamed(Appnames.myorderscreen);
        },
        icon: Icon(Icons.arrow_back,color: Appcolors.appColors.shade100)),
        title: Text('Order Tracking',style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                16.vspace,
                Image.asset(Appimage.locations,fit: BoxFit.cover,width: MediaQuery.of(context).size.width),
                16.vspace,
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(Appimage.tracking),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 24),
                          child: Container(
                            alignment: Alignment.center,
                            height: 25,
                            width: 2,
                            color: Color(0xffE5E0DB),
                          ),
                        ),
                      ],
                    ),
                    16.hspace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Order Placed',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Appcolors.appColors.shade100,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,    
                        ),),
                         Text('10.00 AM',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Appcolors.appColors.shade100,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,    
                        ),),
                      ],
                    ),                
                  ]
                ),
                8.vspace,
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(Appimage.tracking),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 24),
                          child: Container(
                            alignment: Alignment.center,
                            height: 25,
                            width: 2,
                            color: Color(0xffE5E0DB),
                          ),
                        ),
                      ],
                    ),
                    16.hspace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Preparing',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Appcolors.appColors.shade100,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,    
                        ),),
                         Text('10.15 AM',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Appcolors.appColors.shade100,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,    
                        ),),
                      ],
                    ),                
                  ]
                ),
                8.vspace,
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(Appimage.tracking1),
                    8.hspace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Out for Delivery',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Appcolors.appColors.shade100,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,    
                        ),),
                         Text('10.30 AM',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Appcolors.appColors.shade100,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,    
                        ),),
                      ],
                    ),                
                  ]
                ),
              24.vspace,
              Text('Order Details',style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Appcolors.appColors.shade100,
            fontWeight: FontWeight.w700,
          ),),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text('Order #12345',style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
            subtitle: Text('2 items',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
            trailing: Text('\$15.50',style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text('Cappuccino',style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
            subtitle: Text('2x Cappuccino',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
            trailing: Text('\$15.50',style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text('Latte',style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
            subtitle: Text('1x Latte',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
            trailing: Text('\$15.50',style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
          ),
          8.vspace,
              Text('Delivery',style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Appcolors.appColors.shade100,
            fontWeight: FontWeight.w700,
          ),),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text('Delivery Address',style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
            subtitle: Text('Estimated Delivery: 11:00 AM',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
            trailing: Icon(Icons.location_on_outlined,color: Appcolors.appColors.shade100,)
          ),
           8.vspace,
              Text('Reorder',style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Appcolors.appColors.shade100,
            fontWeight: FontWeight.w700,
          ),),
          16.vspace,
            SizedBox(
              height: 250,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: trackinglist.length,
                itemBuilder: (context,index){
                  final items = trackinglist[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(items['image']),
                        8.vspace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(items['title'],style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Appcolors.appColors.shade100,
                            ),),
                            28.hspace,
                              Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Appcolors.appColors.shade300,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Icon(Icons.add,color: Appcolors.appColors.shade100,size: 20,)),
                          ],
                        )
                      ],
                    ),
                  );
              }),
            )
            ],
          ),
        ),
      ),
    );
  }
}