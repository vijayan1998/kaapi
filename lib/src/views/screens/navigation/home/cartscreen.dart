import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kappi/src/bloc/apiurl.dart';
import 'package:kappi/src/bloc/cart_bloc.dart';
import 'package:kappi/src/bloc/cart_event.dart';
import 'package:kappi/src/bloc/cart_state.dart';
import 'package:kappi/src/respositiory/api_service.dart';
import 'package:kappi/src/views/screens/navigation/navigationscreen.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartlist = [
    {'image': Appimage.coffee5, 'price': '₹120', 'title': 'Cappuccino'},
    {'image': Appimage.coffee1, 'price': '₹120', 'title': 'Latte'},
    {'image': Appimage.coffee7, 'price': '₹100', 'title': 'Espresso'},
  ];

  @override
  void initState(){
    StoreRepository().cartList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController text = TextEditingController();
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.to(NavigationScreen(index: 0));
        },icon: Icon(Icons.arrow_back, color: Appcolors.appColors.shade100)),
        backgroundColor: Appcolors.appColors.shade50,
        centerTitle: true,
        title: Text(
          'Your Cart',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Appcolors.appColors.shade100,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocProvider(
              create: (_) => CartFetchBloc(StoreRepository()),
              child: BlocBuilder<CartFetchBloc,CartState>(builder: (context,state){
                if(state is CartFetchInitialState){
                  BlocProvider.of<CartFetchBloc>(context).add(CartFetchEventState());
                  return CircularProgressIndicator();
                }
               else if(state is CartFetchLoading){
                  return CircularProgressIndicator();
                }
                else if(state is CartFetchSuccess){
                  
                  final cart = state.cartModel;
                  return  ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                itemCount: cart.orderDetails!.length,
                itemBuilder: (context, index) {
                  final cartlist  = cart.orderDetails![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(8),
                              child: Image.network(
                                "${Apiurl.apiurl}/uploads/menu/${cartlist.productimg.toString()}",
                                height: 56,
                                width: 56,
                                fit: BoxFit.cover,
                              ),
                            ),
                            16.hspace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  cartlist.price.toString(),
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge!.copyWith(
                                    color: Appcolors.appColors.shade100,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2.5,
                                  child: Text(
                                    cartlist.productname.toString(),
                                    style: Theme.of(context).textTheme.bodyLarge!
                                        .copyWith(color: Color(0xff8A7361)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        BlocProvider(create: (_) => CartCountBloc(StoreRepository()),
                        child: BlocConsumer<CartCountBloc,CartState>(
                           listener: (context,state){
                            if( state is CartInitialState){
                              CircularProgressIndicator();
                            }
                            if(state is CartSuccessState){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Count Update Successful',
                               style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ))));
                            }
                            if(state is CartErrorState){
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error,
                               style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ))));
                            }
                           },
                           builder: (context,state){
                              int count = cartlist.count!;
                            return  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: (){
                                 if(count > 1){
                                  setState(() {
                                    count --;
                                  });
                                 }
                                 context.read<CartCountBloc>().add(CardCountEventState(count: count.toString(), productid: cartlist.prodcutid.toString()));
                              },
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Appcolors.appColors.shade300,
                                child: Text('-',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Appcolors.appColors.shade100,
                                  fontSize: 20
                                ),),
                              ),
                            ),
                            8.hspace,
                            Text(count.toString(),style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Appcolors.appColors.shade100,
                              ),),
                            8.hspace,
                             InkWell(
                              onTap: (){
                                setState(() {
                                  count ++ ;
                                });
                                context.read<CartCountBloc>().add(CardCountEventState(count: count.toString(),productid: cartlist.prodcutid.toString()));
                              },
                               child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Appcolors.appColors.shade300,
                                child: Text('+',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Appcolors.appColors.shade100,
                                ),),
                              ),
                             ),
                          ],
                        );
                           },),)
                      ],
                    ),
                  );
                },
              );
                }
                else if(state is CartFetchError){
            return Text(state.message,style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white,
            ),);
          }
          return Container();
              })
              
            ),
            16.vspace,
            TextFormField(
              controller: text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color(0xff666666),
                  ),
                  borderRadius: BorderRadius.circular(12)
                ),
                hintText: 'Add special instructions',
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Color(0xff8A7361),
                )
              ),
            ),
            16.vspace,
            Text('Address',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Appcolors.appColors.shade100,
              fontWeight: FontWeight.w600,
            ),),
            16.vspace,
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xff1F1F1F),
              ),
              child: Text('123, Green Park Avenue, Besant Nagar, Chennai, 600001',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Appcolors.appColors.shade100,
                fontSize: 14,
              ),),
            ),
            16.vspace,
               Text('Price Summary',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Appcolors.appColors.shade100,
              fontWeight: FontWeight.w600,
            ),),
            16.vspace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Subtotal',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Appcolors.appColors.shade700,
                    ),),
                    8.vspace,
                      Text('Discount',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Appcolors.appColors.shade700,
                    ),),
                    8.vspace,
                      Text('Taxes & Fees',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Appcolors.appColors.shade700,
                    ),),
                    8.vspace,
                      Text('Total',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Appcolors.appColors.shade700,
                    ),)
                  ],
                ),
                  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('₹340',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Appcolors.appColors.shade700,
                    ),),
                    4.vspace,
                      Text('-₹20',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Appcolors.appColors.shade700,
                    ),),
                    8.vspace,
                      Text('₹15',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Appcolors.appColors.shade700,
                    ),),
                    8.vspace,
                      Text('₹335',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Appcolors.appColors.shade700,
                    ),)
                  ],
                ),
              ],
            ),
            24.vspace,
            Custombuttonwidget(text: 'Proceed to Checkout ₹335', 
            color: Appcolors.appColors.shade600, 
            textColor: Appcolors.appColors.shade100,onPressed: (){
              Get.toNamed(Appnames.cartsecondscreen);
            },),
            16.vspace,
          ],
        ),
      ),
    );
  }
}
