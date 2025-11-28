import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';

class OrderDinein extends StatefulWidget {
  const OrderDinein({super.key});

  @override
  State<OrderDinein> createState() => _OrderDineinState();
}

class _OrderDineinState extends State<OrderDinein> {
  TextEditingController search = TextEditingController();

List<Map<String,dynamic>> orderlist = [
  {
    'image':Appimage.order1,
    'title':'Coffee',
  },
  {
    'image':Appimage.order2,
    'title':'Tea',
  },{
    'image':Appimage.order3,
    'title':'Cold Brews',
  },{
    'image':Appimage.order4,
    'title':'Pastries',
  },{
    'image':Appimage.order5,
    'title':'Sandwiches',
  },{
    'image':Appimage.order6,
    'title':'Desserts',
  },{
    'image':Appimage.order7,
    'title':'Smoothies',
  },{
    'image':Appimage.order8,
    'title':'Healthy',
  },
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff382E29),
                  borderRadius: BorderRadius.circular(16),
                ),
                child:  TextFormField(
                         controller: search,
                         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                           color: Appcolors.appColors.shade400,
                           fontWeight: FontWeight.w500
                         ),
                         decoration: InputDecoration(
                          //  fillColor: Color(0xff382E29),
                          //  filled: true,
                           hintText: 'Search  drinks, snacks, combos...',
                           hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                             color: Color(0xffBAA69E),
                             fontSize: 16,
                           ),
                           prefixIcon: Padding(padding: EdgeInsets.all(8),
                           child: Icon(Icons.search,color: Appcolors.appColors.shade400,)),
                           contentPadding: EdgeInsets.all(16),
                           border: InputBorder.none,
                         ),
                        ),
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
                    childAspectRatio: 2 / 2
                    ), 
                    itemCount: orderlist.length,
                    itemBuilder: (context,index){ 
                      final items = orderlist[index];
                      return InkWell(
                        onTap: (){
                         Get.toNamed(Appnames.orderdetails);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(items['image']),
                            4.vspace,
                            Text(items['title'],style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Appcolors.appColors.shade100,
                              fontSize: 16
                            ),),
                          ],
                        ),
                      );
                    }),
            ],
          ),
        ),
      ),
    );
  }
}