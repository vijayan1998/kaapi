import 'package:flutter/material.dart';
import 'package:kappi/src/views/screens/navigation/order/orderdinein.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with TickerProviderStateMixin {
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
        centerTitle: true,
        title: Text('Explore Menu',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Appcolors.appColors.shade100,
          fontWeight: FontWeight.w700,
        ),),
        actions: [
          IconButton(onPressed: (){}, icon: Image.asset(Appimage.order,color: Appcolors.appColors.shade100,))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Container(
            margin: EdgeInsets.all(8),
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
                    child: Text('Dine-in',style: Theme.of(context).textTheme.titleSmall!.copyWith(
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
                    child: Text('Takeaway',style: Theme.of(context).textTheme.titleSmall!.copyWith(
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
              OrderDinein(),
            OrderDinein(),
             ])),
        ],
      ),
    );
  }
}