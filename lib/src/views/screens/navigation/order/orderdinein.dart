import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kappi/src/bloc/apiurl.dart';
import 'package:kappi/src/bloc/category_bloc.dart';
import 'package:kappi/src/bloc/category_event.dart';
import 'package:kappi/src/bloc/category_state.dart';
import 'package:kappi/src/respositiory/api_service.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';

class OrderDinein extends StatefulWidget {
  const OrderDinein({super.key});

  @override
  State<OrderDinein> createState() => _OrderDineinState();
}

class _OrderDineinState extends State<OrderDinein> {
  TextEditingController search = TextEditingController();

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
              BlocProvider(create: (_) => CategoryBloc(StoreRepository()),
              child: BlocBuilder<CategoryBloc,CategoryState>(builder: (context,state){
                if(state is CategoryinitState){
                  BlocProvider.of<CategoryBloc>(context).add(CategoryFetchEvent());
                  return CircularProgressIndicator();
                }
                else if(state is CategoryLoadingState){
                  return CircularProgressIndicator();
                }
                else if(state is CategorySuccessState){
                  return GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    ), 
                    itemCount: state.orderModel.length,
                    itemBuilder: (context,index){ 
                      final items = state.orderModel[index];
                      return InkWell(
                        onTap: (){
                         Get.toNamed(Appnames.orderdetails);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 1.5,
                              child: Image.network('${Apiurl.apiurl}/uploads/category/${items.categoryimage}')),
                            4.vspace,
                            Text(items.categoryname,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Appcolors.appColors.shade100,
                              fontSize: 16
                            ),),
                          ],
                        ),
                      );
                    });
                } else if(state is CategoryErrorState){
                  return Text(state.message,style: TextStyle(color: Colors.white),);
                }
                return Container();
              }),)
                
            ],
          ),
        ),
      ),
    );
  }
}