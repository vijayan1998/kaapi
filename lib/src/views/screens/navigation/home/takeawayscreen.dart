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
import 'package:kappi/src/model/order_model.dart';
import 'package:kappi/src/respositiory/api_service.dart';
import 'package:kappi/src/views/screens/navigation/home/homedetails.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';

class TakeawayScreen extends StatefulWidget {
  const TakeawayScreen({super.key});

  @override
  State<TakeawayScreen> createState() => _TakeawayScreenState();
}

class _TakeawayScreenState extends State<TakeawayScreen> {

List<Takeawaymodel> takeList=[
  Takeawaymodel(image: Appimage.coffee5, subtitle: 'Fast Pickup', title: 'Cappuccino'),
  Takeawaymodel(image: Appimage.coffee6, subtitle: 'Fast Pickup', title: 'Espresso'),
  Takeawaymodel(image: Appimage.coffee3, subtitle: 'Fast Pickup', title: 'Latte'),
  Takeawaymodel(image: Appimage.coffee4, subtitle: 'Fast Pickup', title: 'Mocha'),
];
String username = '';
String storeid = '';
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          16.vspace,
            Text('Good morning,$username',style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                Text('Quick Picks for You',style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Appcolors.appColors.shade100,
              fontWeight: FontWeight.w500,
            ),),
             16.vspace,

             BlocProvider(create: (_) => MenuBloc(StoreRepository()),
             child: BlocBuilder<MenuBloc,MenuState>(builder: (context,state){
              if(state is FetchMenuInitiState){
                Future.delayed(Duration(seconds: 2),() =>{
                   BlocProvider.of<MenuBloc>(context).add(FetchMenuEvent(storeid:storeid)),
                });
            
                return Center(child: CircularProgressIndicator());
              }
              else if(state is FetchMenuLoadingState){
                return Center(child: CircularProgressIndicator());
              } else if(state is FetchMenuSuccessState){
                return   GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 2 / 2.5
                    ), 
                    itemCount: state.menuModel.length,
                    itemBuilder: (context,index){
                      final items = state.menuModel[index];
                      return InkWell(
                        onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetailsScreen(
                            category:items.category, productimg: items.productimg, productid: items.productid,
                            productname: items.productname, description: items.description, 
                            addons: items.addons!, price: items.price)));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 1.5,
                              child: Image.network('${Apiurl.apiurl}/uploads/menu/${items.productimg}')),
                            4.vspace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width / 2.5,
                                      child: Text(items.productname,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                                    fontWeight: FontWeight.w500,
                                                                    color: Appcolors.appColors.shade100,
                                                                    fontSize: 16
                                                                  ),),
                                    ),
                            4.vspace,
                              Text(items.price.toString(),style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Color(0xffCFB88C),
                                  fontWeight: FontWeight.w500
                                ),),
                                  ],
                                ),
                               
                              ],
                            ),
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

             }),),
           
                24.vspace,
                            Custombuttonwidget(text: 'Go to cart', 
                            color: Appcolors.appColors.shade600, 
                            textColor: Appcolors.appColors.shade100,
                            onPressed: (){
                              Get.toNamed(Appnames.cartScreen);
                            },),
              
        ],
      ),
    );
  }
}