
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:kappi/src/bloc/login_bloc.dart';
import 'package:kappi/src/bloc/login_event.dart';
import 'package:kappi/src/bloc/login_state.dart';
import 'package:kappi/src/respositiory/login_service.dart';
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
  String userid = '';
  String  latitude = '';
  String langtude = '';
  String storeid = '';
  @override 
  void initState(){
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener((){
      setState(() {});
    });
    getlocation();
      
  }
 
void getlocation() async {
  await Geolocator.checkPermission();
  await Geolocator.requestPermission();
  Position position = await Geolocator.getCurrentPosition(locationSettings: LocationSettings(
    accuracy: LocationAccuracy.low
  ));
  latitude = position.latitude.toString();
  langtude = position.longitude.toString();
    // // Listen to UserBloc updates
        context.read<UserBloc>().stream.listen((state){
          if(state is FetchLoginSuccessState){
            userid = state.loginModel.userid;
               // send location event after getting userid
               context.read<LocationBloc>().add(LocationPostEvent(langtude: langtude, latitude: latitude, userid: userid));
            Future.delayed(Duration(seconds: 2),() {
              setState(() {
                 storeid = state.loginModel.store;
              });
            });
         
          }
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(Appimage.location,height: 26,width: 26,),
                6.hspace,
                BlocProvider(create: (_) => UserBloc(LoginRepository()),
            child: BlocBuilder<UserBloc,LoginState>(builder: (context,state){
              if(state is FetchLogininitalState){
                BlocProvider.of<UserBloc>(context).add(FetchLoginEvent());
                return CircularProgressIndicator();
              }
              if(state is FetchLoginLoading){
                return CircularProgressIndicator();
              }
              if(state is FetchLoginSuccessState){
                 return Text(state.loginModel.username.isNotEmpty ? state.loginModel.username : "Guest User",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                 ),);
              } else if(state is FetchLoginErrorState){
                return Text(state.message,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                 ),);
              }
              return Container();
            }),
            ),
                6.hspace,
                Image.asset(Appimage.arrow,width: 26,height: 26,),
                Spacer(),
                Image.asset(Appimage.cart,width: 26,height: 26,),
                16.hspace,
                InkWell(
                onTap: (){
                  getlocation();
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