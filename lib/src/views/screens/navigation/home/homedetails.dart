import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kappi/src/bloc/apiurl.dart';
import 'package:kappi/src/bloc/cart_bloc.dart';
import 'package:kappi/src/bloc/cart_event.dart';
import 'package:kappi/src/bloc/cart_state.dart';
import 'package:kappi/src/model/menu_model.dart';
import 'package:kappi/src/respositiory/api_service.dart';
import 'package:kappi/src/views/screens/navigation/navigationscreen.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomeDetailsScreen extends StatefulWidget {
  final String category;
  final String productid;
  final String productimg;
  final String productname;
  final String description;
  final List<AddOn> addons;
  final int price;
  const HomeDetailsScreen({super.key, required this.category, required this.productimg, required this.productname, required this.description, required this.addons, required this.price,required this.productid});

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
        title: Text(widget.category,style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
              Image.network('${Apiurl.apiurl}/uploads/menu/${widget.productimg}',width: MediaQuery.of(context).size.width,fit: BoxFit.fill,),
              16.vspace,
              Text(widget.productname,style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w500,
              ),),
              8.vspace,
               Text(widget.description,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: widget.addons.isNotEmpty ? widget.addons.map((addons){
                return  Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                      color: Color(0xff664533),
                    ),
                  ),
                  child: Text(addons.name.toString(),style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Appcolors.appColors.shade100,
                  ),),
                );
              }).toList() 
              : [
                Text('No Addons Available',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors..shade100,
                ),)
              ]
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
                    Text('\$${widget.price}',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Appcolors.appColors.shade100,
                      fontWeight: FontWeight.w600,
                    ),),
                    8.vspace,
                    Text('\$0.00',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Appcolors.appColors.shade100,
                      fontWeight: FontWeight.w600,
                    ),),
                    8.vspace,
                    Text('\$${widget.price}',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Appcolors.appColors.shade100,
                      fontWeight: FontWeight.w600,
                    ),),
                  ],
                )
              ],
             ),
             16.vspace,
             BlocProvider(create: (_) => CartBloc(StoreRepository()),
              child: BlocConsumer<CartBloc,CartState>( 
                listener: (context,state){
                  if(state is CartInitialState){

                  }
                  if(state is CartSuccessState){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message.toString(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),)));
                  }
                   if(state is CartErrorState){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Appcolors.appColors.shade100,
                    ),)));
                  }
                },
              builder: (context,state){
                 bool isLoading = state is CartLoadingState;
                 return Custombuttonwidget(text: '\$${widget.price} | Add to Cart', color: Color(0xff362417), 
             textColor: Appcolors.appColors.shade100,onPressed: (){  
                context.read<CartBloc>().add(CartEventState(productid: widget.productid)); 
             },
             isLoading: isLoading,);
              },),),
            
            ],
          ),
        ),
      ),
    );
  }
}