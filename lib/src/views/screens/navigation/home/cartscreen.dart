import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              itemCount: cartlist.length,
              itemBuilder: (context, index) {
                final cart = cartlist[index];
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
                            child: Image.asset(
                              cart['image'],
                              height: 56,
                              width: 56,
                            ),
                          ),
                          16.hspace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                cart['price'],
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge!.copyWith(
                                  color: Appcolors.appColors.shade100,
                                ),
                              ),
                              Text(
                                cart['title'],
                                style: Theme.of(context).textTheme.bodyLarge!
                                    .copyWith(color: Color(0xff8A7361)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Appcolors.appColors.shade300,
                            child: Text('-',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Appcolors.appColors.shade100,
                              fontSize: 20
                            ),),
                          ),
                          8.hspace,
                          Text('1',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Appcolors.appColors.shade100,
                            ),),
                          8.hspace,
                           CircleAvatar(
                            radius: 20,
                            backgroundColor: Appcolors.appColors.shade300,
                            child: Text('+',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Appcolors.appColors.shade100,
                            ),),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
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
