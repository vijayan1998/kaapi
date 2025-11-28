import 'package:flutter/material.dart';
import 'package:kappi/src/views/screens/navigation/home/homescreen.dart';
import 'package:kappi/src/views/screens/navigation/membership/membershipscreen.dart';
import 'package:kappi/src/views/screens/navigation/order/orderscreen.dart';
import 'package:kappi/src/views/screens/navigation/profile/profilescreen.dart';
import 'package:kappi/src/views/screens/navigation/store/store.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';


// ignore: must_be_immutable
class NavigationScreen extends StatefulWidget {
  int index;
   NavigationScreen({super.key, required this.index});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widget.index == 0 ? HomeScreen() : widget.index == 1 ? MembershipScreen()
        : widget.index == 2 ? OrderScreen() : widget.index == 3 ? StoreScreen()
        : widget.index == 4 ? ProfileScreen(): HomeScreen()
      ),
      bottomNavigationBar: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 8,right: 8,bottom: 8),
        color: Color(0xff4A3D21),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  widget.index = 0;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 16.vspace,
                  Image.asset(Appimage.home,height: 28,width: 28,color: widget.index == 0 ?Color(0xffFFFFFF) : Color(0xffCFB88C),),
                  6.vspace,
                  Text('Home',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color:widget.index == 0 ? Color(0xffFFFFFF) : Color(0xffCFB88C),
                    fontWeight: FontWeight.w500,
                  ),)
                ],
              ),
            ),
             InkWell(
              onTap: (){
                setState(() {
                  widget.index = 1;
                });
              },
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 16.vspace,
                  Image.asset(Appimage.membership,height: 28,width: 28,color: widget.index == 1 ?Color(0xffFFFFFF) : Color(0xffCFB88C),),
                  6.vspace,
                  Text('Memberships',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: widget.index == 1 ? Color(0xffFFFFFF): Color(0xffCFB88C),
                    fontWeight: FontWeight.w500,
                  ),)
                ],
                           ),
             ),
             InkWell(
              onTap: (){
                setState(() {
                  widget.index = 2;
                });
              },
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 16.vspace,
                  Image.asset(Appimage.order,height: 28,width: 28,color: widget.index == 2 ?Color(0xffFFFFFF) : Color(0xffCFB88C),),
                  6.vspace,
                  Text('Order',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: widget.index == 2 ?Color(0xffFFFFFF) : Color(0xffCFB88C),
                    fontWeight: FontWeight.w500,
                  ),)
                ],
                           ),
             ),
             InkWell(
              onTap: (){
                setState(() {
                  widget.index = 3;
                });
              },
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 16.vspace,
                  Image.asset(Appimage.store,height: 28,width: 28,color: widget.index == 3 ?Color(0xffFFFFFF) : Color(0xffCFB88C),),
                  6.vspace,
                  Text('Store',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: widget.index == 3 ?Color(0xffFFFFFF) : Color(0xffCFB88C),
                    fontWeight: FontWeight.w500,
                  ),)
                ],
                           ),
             ),
             InkWell(
              onTap: (){
                setState(() {
                  widget.index = 4;
                });
              },
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 16.vspace, 
                  Image.asset(Appimage.profile,height: 28,width: 28,color: widget.index == 4 ?Color(0xffFFFFFF) : Color(0xffCFB88C),),
                  6.vspace,
                  Text('Profile',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: widget.index == 4 ?Color(0xffFFFFFF) : Color(0xffCFB88C),
                    fontWeight: FontWeight.w500,
                  ),)
                ],
              ),
             ),
          ],
        ),
      ),
    );
  }
}