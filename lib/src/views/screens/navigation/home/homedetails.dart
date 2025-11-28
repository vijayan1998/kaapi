import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/screens/navigation/navigationscreen.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomeDetailsScreen extends StatefulWidget {
  const HomeDetailsScreen({super.key});

  @override
  State<HomeDetailsScreen> createState() => _HomeDetailsScreenState();
}

class _HomeDetailsScreenState extends State<HomeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      appBar: AppBar(
        backgroundColor: Appcolors.appColors.shade50,
        leading: InkWell(
          onTap: (){
            Get.to(NavigationScreen(index: 0));
          },
          child: Image.asset(Appimage.cancel,color: Appcolors.appColors.shade100,),
        ),
        centerTitle: true,
        title: Text('Customize',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Appcolors.appColors.shade100,
          fontWeight: FontWeight.w700,
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(Appimage.coffee4,width: MediaQuery.of(context).size.width,fit: BoxFit.fill,),
              16.vspace,
              Text('Iced Vanilla Latte',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w500,
              ),),
              8.vspace,
               Text('A classic espresso drink with a sweet vanilla flavor, served over ice.',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w400,
              ),),
              16.vspace,
               Row(
              mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('4.6',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Appcolors.appColors.shade100,
                      ),),
                      4.vspace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(Appimage.star),
                          Image.asset(Appimage.star),
                          Image.asset(Appimage.star),
                          Image.asset(Appimage.star),
                          Image.asset(Appimage.yellowstar),
                        ],
                      ),
                      4.vspace,
                      Text('125 reviews',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Appcolors.appColors.shade100,
                      ),),
                    ],
                  ),
                  8.hspace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                Text('5',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Appcolors.appColors.shade100,
                                )),
                                 LinearPercentIndicator(
                                                 width: MediaQuery.of(context).size.width / 1.8,
                                                 lineHeight: 14.0,
                                                 percent: 0.5,
                                                 barRadius: Radius.circular(6),
                                                 backgroundColor: Color(0xff664533),
                                                 progressColor: Color(0xffED6B29),
                                               ),
                                Text('50%',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Appcolors.appColors.shade100,
                                )),
                               ],
                             ),
                             8.vspace,
                               Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                            Text('4',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Appcolors.appColors.shade100,
                            )),
                             LinearPercentIndicator(
                                             width: MediaQuery.of(context).size.width / 1.8,
                                             lineHeight: 14.0,
                                             percent: 0.3,
                                             barRadius: Radius.circular(6),
                                             backgroundColor: Color(0xff664533),
                                             progressColor: Color(0xffED6B29),
                                           ),
                            Text('30%',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Appcolors.appColors.shade100,
                            )),
                           ],
                         ),
                         8.vspace,
                         Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                            Text('3',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Appcolors.appColors.shade100,
                            )),
                             LinearPercentIndicator(
                                             width: MediaQuery.of(context).size.width / 1.8,
                                             lineHeight: 14.0,
                                             percent: 0.10,
                                             barRadius: Radius.circular(6),
                                             backgroundColor: Color(0xff664533),
                                             progressColor: Color(0xffED6B29),
                                           ),
                            Text('10%',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Appcolors.appColors.shade100,
                            )),
                           ],
                         ),
                         8.vspace,
                         Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                            Text('2',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Appcolors.appColors.shade100,
                            )),
                             LinearPercentIndicator(
                                             width: MediaQuery.of(context).size.width / 1.8,
                                             lineHeight: 14.0,
                                             percent: 0.05,
                                             barRadius: Radius.circular(6),
                                             backgroundColor: Color(0xff664533),
                                             progressColor: Color(0xffED6B29),
                                           ),
                            Text('5%',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Appcolors.appColors.shade100,
                            )),
                           ],
                         ),
                         8.vspace,
                         Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                            Text('1',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Appcolors.appColors.shade100,
                            )),
                             LinearPercentIndicator(
                                             width: MediaQuery.of(context).size.width / 1.8,
                                             lineHeight: 14.0,
                                             percent: 0.05,
                                             barRadius: Radius.circular(6),
                                             backgroundColor: Color(0xff664533),
                                             progressColor: Color(0xffED6B29),
                                           ),
                            Text('5%',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Appcolors.appColors.shade100,
                            )),
                           ],
                         ),
                  ],),    
               ],
             ),
             16.vspace,
             Text('Sugar',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Appcolors.appColors.shade100,
              fontWeight: FontWeight.w600,
             ),),
             8.vspace,
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                      color: Color(0xff664533),
                    ),
                  ),
                  child: Text('No Sugar',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Appcolors.appColors.shade100,
                  ),),
                ),
                 Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                      color: Color(0xff664533),
                    ),
                  ),
                  child: Text('Less Sugar',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Appcolors.appColors.shade100,
                  ),),
                ),
                 Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                      color: Color(0xff664533),
                    ),
                  ),
                  child: Text('Normal',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Appcolors.appColors.shade100,
                  ),),
                ),
                 Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                      color: Color(0xff664533),
                    ),
                  ),
                  child: Text('Extra Sweet',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Appcolors.appColors.shade100,
                  ),),
                ),
              ],
             ),
             24.vspace,
              Text('Price Summary',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Appcolors.appColors.shade100,
              fontWeight: FontWeight.w600,
             ),),
             16.vspace,
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Base Price',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Appcolors.appColors.shade700,
                      fontWeight: FontWeight.w600,
                    ),),
                    8.vspace,
                    Text('Add-ons',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Appcolors.appColors.shade700,
                      fontWeight: FontWeight.w600,
                    ),),
                    8.vspace,
                    Text('Total',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Appcolors.appColors.shade700,
                      fontWeight: FontWeight.w600,
                    ),),
                  ],
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('\$4.50',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Appcolors.appColors.shade100,
                      fontWeight: FontWeight.w600,
                    ),),
                    8.vspace,
                    Text('\$0.00',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Appcolors.appColors.shade100,
                      fontWeight: FontWeight.w600,
                    ),),
                    8.vspace,
                    Text('\$4.50',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Appcolors.appColors.shade100,
                      fontWeight: FontWeight.w600,
                    ),),
                  ],
                )
              ],
             ),
             16.vspace,
             Custombuttonwidget(text: '\$4.50 | Add to Cart', color: Color(0xff362417), 
             textColor: Appcolors.appColors.shade100,onPressed: (){},)
            ],
          ),
        ),
      ),
    );
  }
}