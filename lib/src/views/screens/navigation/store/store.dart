import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kappi/src/bloc/store_bloc.dart';
import 'package:kappi/src/bloc/store_event.dart';
import 'package:kappi/src/bloc/store_state.dart';
import 'package:kappi/src/model/store_model.dart';
import 'package:kappi/src/respositiory/api_service.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            48.vspace,
            Center(
              child: Text('Select a store',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w700
              ),),
            ),
            16.vspace,
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xff332119),
              ),
              child: Text('Use My Location',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600
              ),),
            ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff382E29),
                  borderRadius: BorderRadius.circular(16),
                ),
                    child: TextFormField(
                     controller: search,
                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                       color: Appcolors.appColors.shade400,
                       fontWeight: FontWeight.w500
                     ),
                     decoration: InputDecoration(
                       fillColor: Color(0xff382E29),
                       filled: true,
                       hintText: 'Search  by coach name, sport, or location',
                       hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                         color: Appcolors.appColors.shade400,
                         fontSize: 16,
                       ),
                       prefixIcon: Padding(padding: EdgeInsets.all(8),
                       child: Icon(Icons.search,color: Appcolors.appColors.shade400,)),
                       contentPadding: EdgeInsets.all(16),
                       border: InputBorder.none,
                     ),
                                 ),
                  ),
              ),
               Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Text('Nearby Stores',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Appcolors.appColors.shade100,
                  fontWeight: FontWeight.w700
                             ),),
               ),
               Padding(padding: EdgeInsets.only(left: 16,right: 16,top: 8),
               child: Image.asset(Appimage.locations,width: MediaQuery.of(context).size.width,),),
               Padding(padding: EdgeInsets.all(16),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   BlocProvider(create: (_) => FetchStoreBloc(StoreRepository()),
              child: BlocBuilder<FetchStoreBloc,StoreState>(
                builder: (context,state){
                  if(state is FetchStoreInitial){
                    BlocProvider.of<FetchStoreBloc>(context).add(FetchStoreEvent());
                     return Center(child: CircularProgressIndicator());
                  }
                  else if(state is FetchStoreLoading){
                      return Center(child: CircularProgressIndicator());
                  } else if( state is FetchStoreSuccess){
                    return ListView.builder(
                      padding: EdgeInsets.all(0),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                itemCount: state.storelist.length,
                itemBuilder: (context, index) {
                  StoreModel item = state.storelist[index];
                  return ListTile(
                    title: Text(item.storename,style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Appcolors.appColors.shade100,
                            fontWeight: FontWeight.w600,
                          ),),
                    subtitle: Text(item.address,style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Appcolors.appColors.shade400,
                            fontWeight: FontWeight.w500,
                          ),),
                    trailing:     ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff423329),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        )
                      ),
                      onPressed: (){
                        // Get.toNamed(Appnames.storelist);
                      },
                      child: Text('Select Store',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Appcolors.appColors.shade100,
                      ),)),
                  );
                },
              );
                  } else if(state is FetchStoreError){
                    return Center(child: Text('Error: ${state.message}',style: TextStyle(color: Colors.white),));
                  }
                  return Container();
                },
               ),),
                 ],
               ),)
        
          ]
        ),
      ),
    );
  }
}