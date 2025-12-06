import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/screens/navigation/navigationscreen.dart';
import 'package:kappi/src/views/screens/navigation/order/coldscreen.dart';
import 'package:kappi/src/views/screens/navigation/order/hotscreen.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> with TickerProviderStateMixin {
    late TabController tabController;

    @override 
  void initState(){
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener((){
      setState(() {
        
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      appBar: AppBar(
        backgroundColor: Appcolors.appColors.shade50,
        leading: InkWell(
          onTap: (){
              Get.to(NavigationScreen(index: 2));
          },
          child: Icon(Icons.arrow_back,color: Appcolors.appColors.shade100,)),
        centerTitle: true,
        title: Text('Coffee',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Appcolors.appColors.shade100,
          fontWeight: FontWeight.w700,
        ),),
        actions: [
          IconButton(onPressed: (){
          }, 
          icon: Icon(Icons.search,color: Appcolors.appColors.shade100,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             8.vspace,
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Appcolors.appColors.shade300,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Text('Popular',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),),
              ),
              8.hspace,
               Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Appcolors.appColors.shade300,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Text('Price',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),),
              ),
              8.hspace,
               Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Appcolors.appColors.shade300,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Text('Recency',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),),
              ),
            ],
          ),
          16.vspace,
            Container(
            margin: EdgeInsets.all(4),
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Appcolors.appColors.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
               child: TabBar(
               padding: EdgeInsets.all(4),
                  controller: tabController,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                     color: Appcolors.appColors.shade50,
                  ),
                tabs: [
                Tab(
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),     
                    child: Text('Hot',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: tabController.index == 0 ? Appcolors.appColors.shade100 : Color(0xffCFB88C),
                    ),),
                  ),
                ),
                Tab(
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    child: Text('Cold',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: tabController.index == 1 ? Appcolors.appColors.shade100 : Color(0xffCFB88C),
                      fontWeight: FontWeight.w600
                    ),),
                  ),
                ),
              ]),
             ),
             Expanded(child: TabBarView(
              controller: tabController,
              children: [
              HotScreen(),
              ColdScreen(),
             ]))
          ],
        ),
      ),
    );
  }
}