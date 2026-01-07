import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kappi/src/bloc/login_bloc.dart';
import 'package:kappi/src/bloc/login_event.dart';
import 'package:kappi/src/bloc/login_state.dart';
import 'package:kappi/src/respositiory/login_service.dart';
import 'package:kappi/src/views/screens/navigation/navigationscreen.dart';
import 'package:kappi/src/views/screens/navigation/profile/addaddress.dart';
import 'package:kappi/src/views/screens/navigation/profile/editaddress.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({super.key});

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      appBar: AppBar(
        backgroundColor: Appcolors.appColors.shade50,
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Get.to(NavigationScreen(index: 4));
        }, 
        icon: Icon(Icons.arrow_back,color: Appcolors.appColors.shade100)),
        title: Text('Delivery Addresses',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Appcolors.appColors.shade100,
          fontWeight: FontWeight.w700,
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                Text('Saved Address',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Appcolors.appColors.shade100,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),),
            16.vspace,
            BlocProvider(create: (_) => UserBloc(LoginRepository()),
            child:BlocBuilder<UserBloc,LoginState>(builder: (context,state){
              if(state is FetchLogininitalState){
                BlocProvider.of<UserBloc>(context).add(FetchLoginEvent());
              }else if(state is FetchLoginLoading){
                return CircularProgressIndicator();
              } else if(state is FetchLoginSuccessState){
                return ListView.builder(
                  padding: EdgeInsets.all(0),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.loginModel.address!.length,
                  itemBuilder: (context,index){
                    final delivery = state.loginModel.address![index];
                    return  Container(
                      margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xff1F1F1F),
                border: delivery.isVisible == true ? Border.all(
                  width: 2,
                  color:  Appcolors.appColors.shade100,
                ) : null,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(Appimage.delivery1),
                      8.hspace,
                      Text(delivery.name.toString(),style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Appcolors.appColors.shade100,
                        fontWeight: FontWeight.w600,
                      ),),
                      Spacer(),
                     delivery.isVisible == true ? Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Appcolors.appColors.shade600,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      child: Text('Default',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Appcolors.appColors.shade100
                      ),)) : SizedBox()
                    ],
                  ),
                  8.vspace,
                    Text(delivery.address1.toString(),style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Color(0xff838383),
                        fontWeight: FontWeight.w400,
                      ),),
                      4.vspace,
                        Text(delivery.contactnumber.toString(),style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Color(0xff838383),
                        fontWeight: FontWeight.w400,
                      ),),
                      12.vspace,
                    Divider(
                      thickness: 1,
                      color: Color(0xffDEE1E6),
                    ),
                    12.vspace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Appcolors.appColors.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(delivery.isVisible == true ? 'Default Address' : 'Set as Default',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Color(0xffBDC1CA),
                            fontWeight: FontWeight.w500,
                          ),),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryEditScreen(
                              location: delivery.name.toString(), isVisible: delivery.isVisible!, phone: delivery.contactnumber.toString(), 
                              address: delivery.address1.toString(), address2: delivery.address2.toString(), city: delivery.city.toString(), 
                              state: delivery.state.toString(), pincode: delivery.pincode.toString(), addressid: delivery.addressid.toString())));
                          },
                          child: Image.asset(Appimage.edit)),
                        24.hspace,
                        BlocProvider(create: (_) => UserDeleteAddressBloc(LoginRepository()),
                        child: BlocConsumer<UserDeleteAddressBloc,LoginState>(
                        listener: (context,state){
                          if(state is LoginLodingState){
                            CircularProgressIndicator();
                          }else if(state is LoginSuccessState){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Delete Address Successfully',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Appcolors.appColors.shade100,
                            ),)));
                          }else if(state is LoginErrorState){
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Appcolors.appColors.shade100,
                            ),)));
                          }
                        },
                        builder: (context,state){
                          return InkWell(
                          onTap: (){
                            context.read<UserDeleteAddressBloc>().add(LoginAddressDeleteEvent(addressid: delivery.addressid.toString()));
                          },
                          child: Image.asset(Appimage.delete1,color: Color(0xffD74753),));
                        },),)
                        
                      ],
                    )
                ],
              ),
            );
                  });
              } else if(state is FetchLoginErrorState){
                return Text(state.message,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),);
              }
              return Container();
            })),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Custombuttonwidget(text: '+ Add New Address', 
        color: Appcolors.appColors.shade600, textColor: Appcolors.appColors.shade100,onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddAddressScreens()));
        },),
      ),
    );
  }
}