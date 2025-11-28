import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/model/home_model.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';


class DineinScreen extends StatefulWidget {
  const DineinScreen({super.key});

  @override
  State<DineinScreen> createState() => _DineinScreenState();
}

class _DineinScreenState extends State<DineinScreen> {
    List<String> bannerimage =[
    Appimage.banner,
    Appimage.banner1,
    Appimage.banner3,
    Appimage.banner4
  ];

  List<HomeModel> homelist = [
  HomeModel(image: Appimage.coffee1, title: 'Cappuccino',price: '4.5 • ₹3.50'),
  HomeModel(image: Appimage.coffee2, title: 'Espresso',price:'4.5 • ₹3.50'),
  HomeModel(image: Appimage.coffee3, title: 'Latte',price:'4.5 • ₹3.50'),
  HomeModel(image: Appimage.coffee4, title: 'Mocha',price:'4.5 • ₹3.50'),
];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.vspace,
          Text('Good morning, Ethan',style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Appcolors.appColors.shade100,
            fontWeight: FontWeight.w500,
          ),),
          16.vspace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Text('Reorder your usual',style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Appcolors.appColors.shade100,
            fontWeight: FontWeight.w500,
          ),),
             Text('Cappuccino • 1 item',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Color(0xffCFB88C),
            fontWeight: FontWeight.w500,
          ),),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff4A3D21),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12)
                  )
                ),
                onPressed: (){
                  Get.toNamed(Appnames.myorderscreen);
              },
               child: Text('Reorder',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Appcolors.appColors.shade100,
               ),))
            ],),
            16.vspace,
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
              Text('Recommended for You',style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Appcolors.appColors.shade100,
            fontWeight: FontWeight.w500,
          ),),
          8.vspace,
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Appcolors.appColors.shade300,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Text('Coffee',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                child: Text('Tea',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                child: Text('Pastries',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),),
              )
            ],
          ),
          16.vspace,
          GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 2.3 / 3
                  ), 
                  itemCount: homelist.length,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                         Get.toNamed(Appnames.homedetails);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(homelist[index].image),
                          4.vspace,
                          Text(homelist[index].title,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Appcolors.appColors.shade100,
                            fontSize: 16
                          ),),
                          4.vspace,
                            Text(homelist[index].price,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Color(0xffCFB88C),
                                fontWeight: FontWeight.w500
                              ),),
                        ],
                      ),
                    );
                  }),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(4),
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context,index){
                  return Column(
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
                              Text('Limited Time Offer',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color:Color(0xFFCFB88C),
                                fontWeight: FontWeight.w400,
                              ),),
                              4.vspace,
                               Text('Loyalty & Wallet',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: Appcolors.appColors.shade100,
                                fontWeight: FontWeight.w600,
                              ),),
                              4.vspace,
                               Text('5 stamps • ₹15.00',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color:Color(0xFFCFB88C),
                                fontWeight: FontWeight.w400,
                              ),),
                            ],
                          ),
                          Image.asset(Appimage.layout),
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
                              Text('Store Status',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color:Color(0xFFCFB88C),
                                fontWeight: FontWeight.w400,
                              ),),
                              4.vspace,
                               Text('Open • 7 AM - 10 PM',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: Appcolors.appColors.shade100,
                                fontWeight: FontWeight.w600,
                              ),),
                              4.vspace,
                               Text('View Store Details',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color:Color(0xFFCFB88C),
                                fontWeight: FontWeight.w400,
                              ),),
                            ],
                          ),
                          Image.asset(Appimage.store1),
                        ],
                      ),
                    ],
                  );
                })
        ],
      ),
    );
  }
}