import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kappi/src/bloc/apiurl.dart';
import 'package:kappi/src/bloc/login_bloc.dart';
import 'package:kappi/src/bloc/login_event.dart';
import 'package:kappi/src/bloc/login_state.dart';
import 'package:kappi/src/bloc/menu_bloc.dart';
import 'package:kappi/src/bloc/menu_event.dart';
import 'package:kappi/src/bloc/menu_state.dart';
import 'package:kappi/src/respositiory/api_service.dart';
import 'package:kappi/src/views/screens/navigation/home/homedetails.dart';
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
String storeid = '';
String username = '';
@override
void initState(){
    // get the storeid in userlist
    BlocProvider.of<UserBloc>(context).add(FetchLoginEvent());
    context.read<UserBloc>().stream.listen((state) {
      if (state is FetchLoginSuccessState) {
        username = state.loginModel.username;
        setState(() {
          storeid = state.loginModel.store;
        });
      }
    });
  super.initState();
  
}
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.vspace,
          Text(username.isNotEmpty ? 'Good morning, $username' : 'Good morning Guest ',style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
          BlocProvider(create: (_) => MenuBloc(StoreRepository()),
          child: BlocBuilder<MenuBloc,MenuState>(
            builder: (context,state){
              if(state is FetchMenuInitiState){
                Future.delayed(Duration(seconds: 2),() =>{
                   BlocProvider.of<MenuBloc>(context).add(FetchMenuEvent(storeid:storeid)),
                });
            
                return Center(child: CircularProgressIndicator());
              }
              else if(state is FetchMenuLoadingState){
                return Center(child: CircularProgressIndicator());
              }else if(state is FetchMenuSuccessState){
                return  GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio:2/2.5
                  ), 
                  itemCount: state.menuModel.length,
                  itemBuilder: (context,index){
                    final items = state.menuModel[index];
                    return InkWell(
                      onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetailsScreen(
                            category:items.category, productimg: items.productimg,productid: items.productid, 
                            productname: items.productname, description: items.description, 
                            addons: items.addons!, price: items.price)));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 1.5,
                            child: Image.network('${Apiurl.apiurl}/uploads/menu/${items.productimg}',
                            errorBuilder: (_, __,___) => Icon(Icons.error,color: Colors.red,),),
                          ),
                          4.vspace,
                          Text(items.productname,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Appcolors.appColors.shade100,
                            fontSize: 16
                          ),),
                          4.vspace,
                            Text(items.price.toString(),style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Color(0xffCFB88C),
                                fontWeight: FontWeight.w500
                              ),),
                        ],
                      ),
                    );
                  });
              } else if(state is FetchMenuErrorState){
                return Text(state.message,style: TextStyle(
                  color: Colors.white,
                ),);
              }
              return Container();
          }
          ),
          ),
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