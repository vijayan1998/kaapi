import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kappi/src/bloc/apiurl.dart';
import 'package:kappi/src/bloc/menu_bloc.dart';
import 'package:kappi/src/bloc/menu_event.dart';
import 'package:kappi/src/bloc/menu_state.dart';
import 'package:kappi/src/respositiory/api_service.dart';
import 'package:kappi/src/views/screens/navigation/order/orderaddscreen.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';

class StoreHotScreen extends StatefulWidget {
  final String storeid;
  final String category;
  const StoreHotScreen({super.key, required this.storeid,required this.category});

  @override
  State<StoreHotScreen> createState() => _StoreHotScreenState();
}

class _StoreHotScreenState extends State<StoreHotScreen> {
  @override
  Widget build(BuildContext context) {
    return 
        BlocProvider(create: (_) => StoremenuBloc(StoreRepository()),
        child: BlocBuilder<StoremenuBloc,MenuState>(builder: (context,state){
          if(state is FetchMenuInitiState){
            BlocProvider.of<StoremenuBloc>(context).add(FetchStoreMenuEvent(storeid: widget.storeid,category: widget.category));
            return CircularProgressIndicator();
          }else if(state is FetchMenuLoadingState){
            return CircularProgressIndicator();
          }else if(state is FetchMenuSuccessState){
            final hotlist = state.menuModel.where((element) => element.type == 'hot').toList();
            if(hotlist.isEmpty) {
              return Center(
                child: Text(
                      'No Menu',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                       color: Appcolors.appColors.shade100,
                    ),
                    ),
                );
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: hotlist.length,
              itemBuilder: (context,index){
              final items = hotlist[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Image.network('${Apiurl.apiurl}/uploads/menu/${items.productimg}',height: 56,width: 56,),
              8.hspace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    items.productname,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Appcolors.appColors.shade100,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      items.description,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Appcolors.appColors.shade400,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff423329),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  ),
                ),
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => OrderAddScreen(productid: items.productid,
                    productname: items.productname, productimg: items.productimg, description: items.description, 
                    price: items.price, addons: items.addons!, category: items.category)));
                },
                child: Text(
                  'Add',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Appcolors.appColors.shade100,
                  ),
                ),
              ),
                        ],
                      ),
            );
              });
          }else if(state is FetchMenuErrorState){
            return Text(state.message,style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Appcolors.appColors.shade100,
            ),);
          }
          return Container();
        }),
        );
  }
}
