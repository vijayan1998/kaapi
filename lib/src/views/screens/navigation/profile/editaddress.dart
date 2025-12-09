import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kappi/src/bloc/login_bloc.dart';
import 'package:kappi/src/bloc/login_event.dart';
import 'package:kappi/src/bloc/login_state.dart';
import 'package:kappi/src/respositiory/login_service.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';

class EditAddressScreens extends StatefulWidget {
  final String? name;
  final String? address;
  const EditAddressScreens({super.key,this.address,this.name});

  @override
  State<EditAddressScreens> createState() => _EditAddressScreensState();
}

class _EditAddressScreensState extends State<EditAddressScreens> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  @override
  void initState(){
    //  name.text = widget.name.toString();
    //  address.text = widget.address.toString();
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
        title: Text('Edit Address',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Appcolors.appColors.shade100,
          fontWeight: FontWeight.w700,
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24,horizontal:16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               24.vspace,
               Text('Address',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Appcolors.appColors.shade100,
              ),),
              8.vspace,
              TextFormField(
                controller: name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xff737373),
                    ),
                  )
                ),
              ),
              16.vspace,
               8.vspace,
              TextFormField(
                controller: address,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),
                minLines: 6,
                maxLines: 8,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xff737373),
                    ),
                  )
                ),
              ),
             
            ],
          ),
        ),
      ),
      bottomNavigationBar:  BlocProvider(create: (_) => UserAddressBloc(LoginRepository()),
              child: BlocConsumer<UserAddressBloc,LoginState>(
                listener: (context,state){
                  if(state is FetchLoginLoading){

                  }
                  if(state is FetchLoginErrorState){
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
        context.read<UserAddressBloc>().add(LoginAddressEvent(location: address.text, name: name.text));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Address Successfully')));
      }, 
     color: Color(0xff40332B),  
     textColor: Appcolors.appColors.shade100,),);

              }),),
    );
  }
}