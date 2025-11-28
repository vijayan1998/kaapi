import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/screens/navigation/navigationscreen.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  List<String> bannerimage =[
    Appimage.banner,
    Appimage.banner1,
    Appimage.banner3,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      appBar: AppBar(
        backgroundColor: Appcolors.appColors.shade50,
        leading: IconButton(
          onPressed: () {
            Get.to(NavigationScreen(index: 4));
          },
          icon: Icon(Icons.arrow_back, color: Appcolors.appColors.shade100),
        ),
        centerTitle: true,
        title: Text(
          'Offer & Rewards',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Appcolors.appColors.shade100,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'You have 250 Points',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Color(0xff00AC4E),
                  fontWeight: FontWeight.w600,
                ),
              ),
              8.vspace,
              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width / 1.12,
                lineHeight: 10.0,
                percent: 0.8,
                barRadius: Radius.circular(6),
                backgroundColor: Color(0xff595A5C),
                progressColor: Color(0xff00AC4E),
              ),
              4.vspace,
              Text('50 more points to unlock a free drink',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Appcolors.appColors.shade100,
              ),),
              8.vspace,
              Custombuttonwidget(text: 'Redeem Now', color: Color(0xff00AC4E), 
              textColor: Appcolors.appColors.shade50,
              onPressed: (){}),
              16.vspace,
              Text('Featured Offers',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Appcolors.appColors.shade100,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
              8.vspace,
                CarouselSlider(
                    items: bannerimage.map((e) => Container(
                      margin: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(e),
                          fit: BoxFit.fill)
                      ),
                    ) ).toList(),
                     options: CarouselOptions(
                      initialPage: 0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      enlargeCenterPage: true,
                      enlargeFactor: 0.0,
                      aspectRatio: 35 /15
                    )
                    ),
               16.vspace,
              Text('Available Coupons',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Appcolors.appColors.shade100,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
              16.vspace,
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 1,
                    color: Color(0xff515151),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Text('Flat ₹100 Off',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Appcolors.appColors.shade100,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
              4.vspace,
               Text('Valid till 30 Aug, Min order ₹300',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Color(0xffCCCCCC),
              ),),
              4.vspace,
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xff4F4F4F),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Dine-in-Only',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),),
              ),
              16.vspace,
              InkWell(
                onTap: (){},
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color(0xff00AC4E),
                    ),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Text('Apply',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Color(0xff00AC4E)
                  ),),
                ),
              ),
                  ],
                ),
              ),
              12.vspace,
               Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 1,
                    color: Color(0xff515151),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Text('25% Off on Select Items',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Appcolors.appColors.shade100,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
              4.vspace,
               Text('Valid till 15 Sep, Max discount ₹200',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Color(0xffCCCCCC),
              ),),
              4.vspace,
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xff4F4F4F),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('Takeaway Only',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Appcolors.appColors.shade100,
                    ),),
                  ),
                  16.hspace,
                   Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xff4F4F4F),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('Online Order',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Appcolors.appColors.shade100,
                    ),),
                  ),
                ],
              ),
              16.vspace,
              InkWell(
                onTap: (){},
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color(0xff00AC4E),
                    ),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Text('Copy Code',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Color(0xff00AC4E)
                  ),),
                ),
              ),
                  ],
                ),
              ),
              12.vspace,
               Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 1,
                    color: Color(0xff515151),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Text('Free Delivery',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Appcolors.appColors.shade100,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
              4.vspace,
               Text('Valid till 31 Dec, Min order ₹150',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Color(0xffCCCCCC),
              ),),
              4.vspace,
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xff4F4F4F),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('First Order',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Appcolors.appColors.shade100,
                    ),),
                  ),
                  16.hspace,
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xff4F4F4F),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('App Exclusive',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Appcolors.appColors.shade100,
                    ),),
                  ),
                ],
              ),
              16.vspace,
              InkWell(
                onTap: (){},
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color(0xff00AC4E),
                    ),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Text('Apply',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Color(0xff00AC4E)
                  ),),
                ),
              ),
                  ],
                ),
              ),
              16.vspace,
              Text('Referral Bonus',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Appcolors.appColors.shade100,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
              12.vspace,
              Center(
                child: Image.asset(Appimage.offerimg),
              ),
              12.vspace,
               Center(
                 child: Text('Invite friends & earn ₹50 for each sign-up',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Appcolors.appColors.shade100,
                               ),),
               ),
               8.vspace,
               Center(
                 child: SizedBox(
                  width: MediaQuery.of(context).size.width / 3.2,
                   child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff00AC4E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16)
                      )
                    ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Appimage.call),
                        8.hspace,
                        Text('Share',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Appcolors.appColors.shade100,
                        ),)
                      ],
                    )),
                 ),
               ),
               16.vspace,
              
            ],
          ),
        ),
      ),
    );
  }
}
