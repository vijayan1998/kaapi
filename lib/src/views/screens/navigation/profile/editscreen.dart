import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kappi/src/bloc/login_bloc.dart';
import 'package:kappi/src/bloc/login_event.dart';
import 'package:kappi/src/bloc/login_state.dart';
import 'package:kappi/src/model/login_model.dart';
import 'package:kappi/src/respositiory/login_service.dart';
import 'package:kappi/src/views/screens/navigation/navigationscreen.dart';
import 'package:kappi/src/views/screens/navigation/profile/editaddress.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';

class EditScreen extends StatefulWidget {
  final String? image;
  final String? username;
  final String? email;
  final String? phone;
  final List<Address>? address;

  const EditScreen({super.key, this.username, this.email,this.phone,this.image,this.address});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
   XFile? image;

  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);

      // Get the file size in bytes
      int imageSize = await imageFile.length();

      // Convert bytes to MB
      double imageSizeInMB = imageSize / (1024 * 1024);

      // Check if the image size exceeds 3MB
      if (imageSizeInMB > 5) {
        // Show an error message (using SnackBar in this case)
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Image size exceeds 5MB. Please choose a smaller file.'),
          ),
        );
      } else {
        // If the image size is acceptable, update the state
        setState(() {
          image = pickedImage;
        });
      }
    }
  }
  @override
  void initState() {
    name = TextEditingController(text: widget.username);
    email = TextEditingController(text: widget.email);
    phone = TextEditingController(text: widget.phone);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
       appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.to(NavigationScreen(index: 4));
        }, 
        icon: Icon(Icons.arrow_back,color: Appcolors.appColors.shade100,)),
        backgroundColor: Appcolors.appColors.shade50,
        centerTitle: true,
        title: Text('Edit Profile',style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children:[ 
                   image != null ?  Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: FileImage(
                                        File(image!.path),
                                      ),
                                      fit: BoxFit.cover)),
                            ) : widget.image!.isEmpty ? Image.asset(Appimage.profileimg) : Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                shape:BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage('${widget.image}',),
                                  fit: BoxFit.cover), 
                              ),
                              ),
                    Positioned(
                      right: -5,
                      bottom: 6,
                      child: InkWell(
                        onTap: pickImage,
                        child: Image.asset(Appimage.editprofile)))
            ]),
              ),
              24.vspace,
               Text('Full Name',
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
              24.vspace,
               Text('Email',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Appcolors.appColors.shade100,
              ),),
              8.vspace,
              TextFormField(
                controller: email,
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
                24.vspace,
               Text('Phone Number',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Appcolors.appColors.shade100,
              ),),
              8.vspace,
              TextFormField(
                controller: phone,
                readOnly: true,
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
              24.vspace,
              Text('Address',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Appcolors.appColors.shade100,
                fontWeight: FontWeight.w600,
              ),),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Image.asset(Appimage.home2),
                title: Text(widget.address!.isEmpty ? 'Home' :widget.address!.first.name.toString(),style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),),
                subtitle: Text(widget.address!.isEmpty ? '123 Asssmdg' :widget.address!.first.address1.toString(),style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),),
                trailing: InkWell(child: Image.asset(Appimage.edit),onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditAddressScreens(
                    // name: widget.address!.first.name.toString(),
                    // address: widget.address!.first.address.toString(),
                  )));
                },),
              ),
               ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Image.asset(Appimage.work),
                title: Text('Work',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),),
                subtitle: Text('456 Oak Ave, Anytown, USA',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Appcolors.appColors.shade100,
                ),),
                trailing: Image.asset(Appimage.edit),
              ),
              24.vspace,
              BlocProvider(create: (_) => UserDetailsBloc(LoginRepository()),
              child: BlocConsumer<UserDetailsBloc,LoginState>(
                listener: (context,state){
                  if(state is FetchLoginSuccessState){
                     Get.to(NavigationScreen(index: 4));
                  }
                  if(state is FetchLoginErrorState){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Appcolors.appColors.shade100,
                    ),)));
                  }
                },
              builder: (context,state){
                bool isLoading = state is LoginLodingState;
                return  Custombuttonwidget(text: 'Save', 
                color: Color(0xff40332B), 
                isLoading: isLoading,
                textColor: Appcolors.appColors.shade100,
                onPressed: (){
                  // final fileName = image != null ? image!.path.split('/').last : "";
                  context.read<UserDetailsBloc>().add(LoginUpdateEvent(email: email.text, 
                  userimg: image, username: name.text));
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Update Successfully')));
                },);
              },),),
              
            ],
          ),
        ),
      ),
    );
  }
}