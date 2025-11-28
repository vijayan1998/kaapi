import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/screens/navigation/navigationscreen.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
        appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.to(NavigationScreen(index: 0));
          },
          icon: Icon(Icons.arrow_back, color: Appcolors.appColors.shade100)),
        backgroundColor: Appcolors.appColors.shade50,
        centerTitle: false,
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Appcolors.appColors.shade100,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Appimage.notifications1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Your cappuccino is ready for',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Appcolors.appColors.shade100,
                      ),),
                      Text('Order #234 will be served at 10:30 AM',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Appcolors.appColors.shade700,
                      ),),
                    ],
                  ),
                  Text('2m ago',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Appcolors.appColors.shade700,
                  ),)
                ],
              ),
            ),
             Padding(
               padding: const EdgeInsets.all(16.0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Appimage.notifications2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Buy 1 Get 1 Free Latte today!',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Appcolors.appColors.shade100,
                      ),),
                      Text('Enjoy a free latte with any purchase today',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Appcolors.appColors.shade700,
                      ),),
                    ],
                  ),
                  Text('1h ago',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Appcolors.appColors.shade700,
                  ),)
                ],
                           ),
             ),
             Padding(
               padding: const EdgeInsets.all(16.0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Appimage.notifications3),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Haven’t had your coffee yet?',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Appcolors.appColors.shade100,
                      ),),
                      Text('Order now and get your caffeine fix!',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Appcolors.appColors.shade700,
                      ),),
                    ],
                  ),
                  Text('3h ago',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Appcolors.appColors.shade700,
                  ),)
                ],
                           ),
             ),
             Padding(
               padding: const EdgeInsets.all(16.0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Appimage.notifications1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Your order is ready!',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Appcolors.appColors.shade100,
                      ),),
                      Text('Order #233 is ready for pickup',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Appcolors.appColors.shade700,
                      ),),
                    ],
                  ),
                  Text('1d ago',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Appcolors.appColors.shade700,
                  ),)
                ],
                           ),
             )
          ],
        ),
      ),
    );
  }
}