import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/screens/navigation/store/hotscreen.dart';
import 'package:kappi/src/views/screens/navigation/store/storecoldscreen.dart';
import 'package:kappi/src/views/screens/navigation/store/storelist.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';

class StoreaddScreen extends StatefulWidget {
  final String storeid;
  final String category;
  const StoreaddScreen({super.key, required this.storeid,required this.category});

  @override
  State<StoreaddScreen> createState() => _StoreaddScreenState();
}

class _StoreaddScreenState extends State<StoreaddScreen> with TickerProviderStateMixin{
  TextEditingController search = TextEditingController();
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
    return  Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      appBar: AppBar(
        backgroundColor: Appcolors.appColors.shade50,
        leading: InkWell(
          onTap: (){
            Get.to(StorelistScreen(storeid: widget.storeid,));
          },
          child: Icon(Icons.arrow_back,color: Appcolors.appColors.shade100,)),
        centerTitle: true,
        title: Text('Coffee Corner',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Appcolors.appColors.shade100,
          fontWeight: FontWeight.w700,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff382E29),
                  borderRadius: BorderRadius.circular(16),
                ),
                child:  TextFormField(
                         controller: search,
                         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                           color: Appcolors.appColors.shade400,
                           fontWeight: FontWeight.w500
                         ),
                         decoration: InputDecoration(
                          //  fillColor: Color(0xff382E29),
                          //  filled: true,
                           hintText: 'Search menu',
                           hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                             color: Color(0xffBAA69E),
                             fontSize: 16,
                           ),
                           prefixIcon: Padding(padding: EdgeInsets.all(8),
                           child: Icon(Icons.search,color: Appcolors.appColors.shade400,)),
                           contentPadding: EdgeInsets.all(16),
                           border: InputBorder.none,
                         ),
                        ),
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
              StoreHotScreen(storeid: widget.storeid,category: widget.category,),
              Storecoldscreen(storeid: widget.storeid,category: widget.category),
             ]))
          ],
        ),
      ),
    );
  }
}