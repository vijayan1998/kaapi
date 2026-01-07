import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kappi/src/bloc/login_bloc.dart';
import 'package:kappi/src/bloc/login_event.dart';
import 'package:kappi/src/bloc/login_state.dart';
import 'package:kappi/src/respositiory/login_service.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';

class AddAddressScreens extends StatefulWidget {
  final String? name;
  final String? address;
  const AddAddressScreens({super.key,this.address,this.name});

  @override
  State<AddAddressScreens> createState() => _AddAddressScreensState();
}

class _AddAddressScreensState extends State<AddAddressScreens> {
  TextEditingController name = TextEditingController();
  TextEditingController contactnumber = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state1 = TextEditingController();
  TextEditingController pincode = TextEditingController();
  bool isvalue = false;
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
       appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, 
        icon: Icon(Icons.arrow_back,color: Appcolors.appColors.shade100,)),
        backgroundColor: Appcolors.appColors.shade50,
        centerTitle: true,
        title: Text('Add Address',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Appcolors.appColors.shade100,
          fontWeight: FontWeight.w700,
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24,horizontal:16),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('FullName',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),),
              8.vspace,
              TextFormField(
                controller: name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xff1F1F1F),
                  filled: true,
                  suffixIcon: Icon(Icons.person_2_outlined,color: Color(0xff80736B),)
                ),
              ),
              16.vspace,
               Text('Phone',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),),
              8.vspace,
              TextFormField(
                controller: contactnumber,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xff1F1F1F),
                  filled: true,
                  suffixIcon: Icon(Icons.call_outlined,color: Color(0xff80736B),)
                ),
              ),
              16.vspace,
              Text('Address Line 1',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),),
              8.vspace,
              TextFormField(
                controller: address1,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xff1F1F1F),
                  filled: true,
                  suffixIcon: Icon(Icons.location_city,color: Color(0xff80736B),)
                ),
              ),
              16.vspace,
              Text('Address Line 2',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),),
              8.vspace,
              TextFormField(
                controller: address2,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xff1F1F1F),
                  filled: true,
                  suffixIcon: Icon(Icons.location_city_outlined,color: Color(0xff80736B),)
                ),
              ),
              16.vspace,
              Text('City',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),),
              8.vspace,
              TextFormField(
                controller: city,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xff1F1F1F),
                  filled: true,
                ),
              ),
              16.vspace,
              Text('State',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),),
              8.vspace,
              TextFormField(
                controller: state1,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xff1F1F1F),
                  filled: true,
                ),
              ),
              16.vspace,
              Text('Pin/Zin code',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),),
              8.vspace,
              TextFormField(
                controller: pincode,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xff1F1F1F),
                  filled: true,
                  suffixIcon: Icon(Icons.location_on_outlined,color: Color(0xff80736B),)
                ),
              ),
              16.vspace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text('Set as Default Address',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),),
              Switch(
                inactiveThumbColor: Appcolors.appColors.shade100,
                inactiveTrackColor: Appcolors.appColors.shade50,
                value: isvalue, 
              onChanged: (value){
                setState(() {
                  isvalue = value;
                });
              })
                ],
              ),
          16.vspace,
            ],
          ),
        ),
      ),
      bottomNavigationBar:  BlocProvider(create: (_) => UserAddressBloc(LoginRepository()),
              child: BlocConsumer<UserAddressBloc,LoginState>(
                listener: (context,state){
                  if(state is LoginLodingState){
                    CircularProgressIndicator();
                  }
                   else if(state is LoginSuccessState){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User Address uploads Successfully',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Appcolors.appColors.shade100,
                    ),)));
                  }
                 else if(state is LoginErrorState){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Appcolors.appColors.shade100,
                    ),)));
                  }
                
                },
                builder: (context,state){
                  bool isLoading = state is LoginLodingState;
                  return Padding(padding: EdgeInsets.all(16),
      child: Custombuttonwidget(text: 'Save', isLoading: isLoading,
      onPressed: (){
        context.read<UserAddressBloc>().add(LoginAddressEvent(contactnumber: contactnumber.text, name: name.text,
        address1: address1.text,address2: address2.text,city: city.text,pincode: pincode.text,isVisible: isvalue,state: state1.text));
        
      }, 
     color: Color(0xff40332B),  
     textColor: Appcolors.appColors.shade100,),);

              }),),
    );
  }
}