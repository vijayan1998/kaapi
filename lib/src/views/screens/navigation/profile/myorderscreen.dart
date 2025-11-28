import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/screens/navigation/navigationscreen.dart';
import 'package:kappi/src/views/screens/navigation/profile/completescreen.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';

class MyorderScreen extends StatefulWidget {
  const MyorderScreen({super.key});

  @override
  State<MyorderScreen> createState() => _MyorderScreenState();
}

class _MyorderScreenState extends State<MyorderScreen> with TickerProviderStateMixin{
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener((){
      setState(() {
        
      });
    });
    super.initState();
  }
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
        title: Text('My Orders',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Appcolors.appColors.shade100,
          fontWeight: FontWeight.w700,
        ),),
        actions: [
          IconButton(onPressed: (){}, icon: Image.asset(Appimage.order,color: Appcolors.appColors.shade100),),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TabBar(
            padding: EdgeInsets.all(6),
            dividerColor: Color(0xffCFDBE8),
            indicatorColor: Appcolors.appColors.shade100,
            labelColor: Appcolors.appColors.shade100,
            labelPadding: EdgeInsets.all(12),
            unselectedLabelColor: Color(0xffBDA89E),
            controller: tabController,
            tabs: [
              Text('Ongoing',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),),
              Text('Completed',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),)
          ]),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Padding(
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
                          Text('Order #23456',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Color(0xffBDA89E),
                          ),),
                          Text('Cappuccino + Croissant',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color:Appcolors.appColors.shade100,
                            fontWeight: FontWeight.w600,
                          ),),
                          Text('Ready in 10 mins',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Color(0xffBDA89E),
                          ),),
                          8.vspace,
                          ElevatedButton(onPressed: (){
                            Get.toNamed(Appnames.ordertracking);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff40332B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(12)
                            )
                          ), 
                          child: Row(
                            children: [
                              Text('Track',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Appcolors.appColors.shade100,
                              ),),
                              8.hspace,
                              Icon(Icons.arrow_forward,color: Appcolors.appColors.shade100,size: 16,)
                            ],
                          ))
                        ],
                      ),
                      Image.asset(Appimage.coffee1,height: 120,width: 120,),
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
                          Text('Order #23457',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Color(0xffBDA89E),
                          ),),
                          Text('Latte + Muffin',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color:Appcolors.appColors.shade100,
                            fontWeight: FontWeight.w600,
                          ),),
                          Text('Preparing',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Color(0xffBDA89E),
                          ),),
                          8.vspace,
                          ElevatedButton(onPressed: (){
                            Get.toNamed(Appnames.ordertracking);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff40332B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(12)
                            )
                          ), 
                          child: Row(
                            children: [
                              Text('Track',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                    ],
                  ),
                ),
                CompleteScreen(),
            ]),
          )
        ],
      ),
      floatingActionButton: SizedBox(
        height: 50,
        width: 140,
        child: Align(
          alignment: Alignment.topRight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff4D2C03),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12)
              )
            ),
            onPressed: (){}, 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.add,color: Appcolors.appColors.shade100),
              Text('New Order',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Appcolors.appColors.shade100,
              ),)
            ],
          )),
        ),
      ),
    );
  }
}