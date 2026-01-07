import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kappi/src/bloc/login_bloc.dart';
import 'package:kappi/src/bloc/login_event.dart';
import 'package:kappi/src/bloc/login_state.dart';
import 'package:kappi/src/respositiory/login_service.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';

class DeliveryEditScreen extends StatefulWidget {
  final String location;
  final String phone;
  final String address;
  final String address2;
  final String city;
  final String state;
  final String pincode;
  final bool isVisible;
  final String addressid;
  const DeliveryEditScreen({super.key, required this.location,required this.isVisible,required this.phone, required this.address, required this.address2, required this.city, required this.state, required this.pincode, required this.addressid});

  @override
  State<DeliveryEditScreen> createState() => _DeliveryEditScreenState();
}

class _DeliveryEditScreenState extends State<DeliveryEditScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state1 = TextEditingController();
  TextEditingController pincode = TextEditingController();

  late bool isvalue;
  @override
  void initState(){
    super.initState();
    name = TextEditingController(text: widget.location);
    phone = TextEditingController(text: widget.phone);
    address = TextEditingController(text: widget.address);
    address1 = TextEditingController(text: widget.address2);
    city = TextEditingController(text: widget.city);
    state1 = TextEditingController(text: widget.state);
    pincode = TextEditingController(text: widget.pincode);
    isvalue = widget.isVisible;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Appcolors.appColors.shade50,
         leading: IconButton(onPressed: (){
          Navigator.pop(context);
         }, 
        icon: Icon(Icons.arrow_back,color: Appcolors.appColors.shade100)),
        title: Text('Edit Addresses',style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                controller: phone,
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
                controller: address,
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
                controller: address1,
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
              BlocProvider(create: (_) => UserUpdateAddressBloc(LoginRepository()),
              child: BlocConsumer<UserUpdateAddressBloc,LoginState>(listener: (context,state){
                if(state is LoginLodingState){
                  CircularProgressIndicator();
                }else if(state is LoginSuccessState){
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Address Update Successfully',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Appcolors.appColors.shade100,
                    ),)));
                } else if(state is LoginErrorState){
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Appcolors.appColors.shade100,
                    ),)));
                }
              },
              builder: (context,state){
                 bool isLoading = state is LoginLodingState;
                 return  Custombuttonwidget(text: 'Update Address', 
          color: Appcolors.appColors.shade600, textColor: Appcolors.appColors.shade100,
          isLoading: isLoading,
          onPressed: (){
            context.read<UserUpdateAddressBloc>().add(LoginUpdateAddressEvent(name: name.text, contactnumber: phone.text, address: address.text, address2: address1.text,city: city.text, state: state1.text, 
            pincode: pincode.text, isdefault: isvalue, addressid:widget.addressid));
          },);
            }, ),),
         
          16.vspace,
          Custombuttonwidget(text: 'Cancel', 
          color: Color(0xff1F1F1F), textColor: Appcolors.appColors.shade100,
          onPressed: (){},),
          16.vspace,
            ],
          ),
        ),
      ),
    );
  }
}