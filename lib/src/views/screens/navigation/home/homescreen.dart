import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/screens/navigation/home/dineinscreen.dart';
import 'package:kappi/src/views/screens/navigation/home/takeawayscreen.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal:16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            16.vspace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(Appimage.location,height: 26,width: 26,),
                6.hspace,
                Text('Your Cafe: Anna Nagar ...',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),),
                6.hspace,
                Image.asset(Appimage.arrow,width: 26,height: 26,),
                Spacer(),
                Image.asset(Appimage.cart,width: 26,height: 26,),
                16.hspace,
                InkWell(
                  onTap: (){
                    Get.toNamed(Appnames.notifications);
                    },
                  child: Image.asset(Appimage.notifications,height: 26,width: 26,)),
              ],
            ),
            16.vspace,
             Container(
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
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
              DineinScreen(),
              TakeawayScreen(),
            ]))
          ],
        ),
      ),
    );
  }
}