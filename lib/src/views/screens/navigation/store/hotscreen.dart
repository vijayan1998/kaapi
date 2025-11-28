import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';

class StoreHotScreen extends StatefulWidget {
  const StoreHotScreen({super.key});

  @override
  State<StoreHotScreen> createState() => _StoreHotScreenState();
}

class _StoreHotScreenState extends State<StoreHotScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        24.vspace,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Appimage.coffee5,height: 56,width: 56,),
            16.hspace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Cappuccino',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Appcolors.appColors.shade100,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Espresso with steamed milk',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Appcolors.appColors.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff423329),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              onPressed: () {
                Get.toNamed(Appnames.orderAddScreen);
              },
              child: Text(
                'Add',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
              ),
            ),
          ],
        ),
       8.vspace,
         Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Appimage.coffee1,height: 56,width: 56,),
            16.hspace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Macchiato',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Appcolors.appColors.shade100,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Espresso with a small amount \nof milk',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Appcolors.appColors.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff423329),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              onPressed: () {
                Get.toNamed(Appnames.orderAddScreen);
              },
              child: Text(
                'Add',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
              ),
            ),
          ],
        ),
        8.vspace,
         Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Appimage.coffee6,height: 56,width: 56,),
            16.hspace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Americano',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Appcolors.appColors.shade100,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Espresso with hot water',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Appcolors.appColors.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff423329),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              onPressed: () {
                Get.toNamed(Appnames.orderAddScreen);
              },
              child: Text(
                'Add',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
              ),
            ),
          ],
        ),
        8.vspace,
         Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Appimage.coffee4,height: 56,width: 56,),
            16.hspace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Mocha',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Appcolors.appColors.shade100,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Espresso with chocolate and milk',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Appcolors.appColors.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff423329),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              onPressed: () {
                Get.toNamed(Appnames.orderAddScreen);
              },
              child: Text(
                'Add',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
              ),
            ),
          ],
        ),
        8.vspace,
         Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Appimage.coffee3,height: 56,width: 56,),
            16.hspace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Latte',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Appcolors.appColors.shade100,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Espresso with a lot of milk',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Appcolors.appColors.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff423329),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              onPressed: () {
                Get.toNamed(Appnames.orderAddScreen);
              },
              child: Text(
                'Add',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
              ),
            ),
          ],
        ),
      
       16.vspace,
      ],
    );
  }
}
