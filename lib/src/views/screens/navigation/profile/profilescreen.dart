import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kappi/src/bloc/login_bloc.dart';
import 'package:kappi/src/bloc/login_event.dart';
import 'package:kappi/src/bloc/login_state.dart';
import 'package:kappi/src/model/login_model.dart';
import 'package:kappi/src/views/screens/navigation/profile/editscreen.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';
import 'package:kappi/src/views/widget/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username ='';
  String userimg = '';
  String phone = '';
  String email = '';
  List<Address> address = [];
  @override
  void initState(){
    // get the storeid in userlist
  BlocProvider.of<UserBloc>(context).add(FetchLoginEvent());
    context.read<UserBloc>().stream.listen((state){
      if(state is FetchLoginSuccessState){
        setState(() {
            username = state.loginModel.username;
            userimg = state.loginModel.userimg;
            phone = state.loginModel.phone;
            email = state.loginModel.email;
            address = state.loginModel.address!;
        });
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Appcolors.appColors.shade50,
        centerTitle: true,
        title: Text('Profile',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Appcolors.appColors.shade100,
          fontWeight: FontWeight.w700,
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                Center(
                  child:  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image:DecorationImage(
                        image: userimg.isNotEmpty ? NetworkImage(userimg) : AssetImage(Appimage.profileimg),
                        fit: BoxFit.cover)
                    ),
                  ),
                ),
                8.vspace,
                Center(
                  child: Text(username.isNotEmpty ? username :'AAABBSBBSS',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Appcolors.appColors.shade100,
                  ),),
                ),
                 Center(
                  child: Text(phone.isNotEmpty ? phone :'+91 99837346387',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Color(0xffBDA89E),
                  ),),
                ),
                8.vspace,
                Custombuttonwidget(text: 'Edit Profile', 
                color: Color(0xff40332B), 
                textColor: Appcolors.appColors.shade100,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditScreen(
                    username: username, email: email, phone: phone,image: userimg,address: address,)));
                },),
                16.vspace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Loyalty Points',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Color(0xffBDA89E),
                        ),),
                        Text('120',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color:Appcolors.appColors.shade100,
                          fontWeight: FontWeight.w600,
                        ),),
                        Text('Redeem for free drinks',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Color(0xffBDA89E),
                        ),),
                        8.vspace,
                        ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff40332B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(12)
                          )
                        ), 
                        child: Text('Redeem Now',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Appcolors.appColors.shade100,
                        ),))
                      ],
                    ),
                    Image.asset(Appimage.profile1),
                  ],
                ),
                16.vspace,
                InkWell(
                  onTap: (){
                    Get.toNamed(Appnames.myorderscreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(Appimage.orderprofile,height: 56,width: 56),
                      24.hspace,
                      Text('My Orders',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Appcolors.appColors.shade100,
                        fontWeight: FontWeight.w600,
                      ),)
                    ],
                  ),
                ),
                 InkWell(
                  onTap: (){
                    Get.toNamed(Appnames.offerrewards);
                  },
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(Appimage.offer,height: 56,width: 56),
                      24.hspace,
                      Text('Offer & Rewards',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Appcolors.appColors.shade100,
                        fontWeight: FontWeight.w600,
                      ),)
                    ],
                  ),
                 ),
                 InkWell(
                  onTap: (){
                    Get.toNamed(Appnames.paymentscreen);
                  },
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(Appimage.payment,height: 56,width: 56),
                      24.hspace,
                      Text('Saved Payment Methods',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Appcolors.appColors.shade100,
                        fontWeight: FontWeight.w600,
                      ),)
                    ],
                                   ),
                 ),
                 InkWell(
                  onTap: (){
                    Get.toNamed(Appnames.delivery);
                  },
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(Appimage.locationpro,height: 56,width: 56),
                      24.hspace,
                      Text('Delivery Address',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Appcolors.appColors.shade100,
                        fontWeight: FontWeight.w600,
                      ),)
                    ],
                                   ),
                 ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(Appimage.help,height: 56,width: 56),
                    24.hspace,
                    Text('Help & Support',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Appcolors.appColors.shade100,
                      fontWeight: FontWeight.w600,
                    ),)
                  ],
                ),
                 InkWell(
                  onTap: (){
                    Get.toNamed(Appnames.delete);
                  },
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(Appimage.delete,height: 56,width: 56),
                      24.hspace,
                      Text('Delete Account',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Appcolors.appColors.shade100,
                        fontWeight: FontWeight.w600,
                      ),)
                    ],
                                   ),
                 ),
                 InkWell(
                  onTap: (){
                    Get.toNamed(Appnames.logout);
                  },
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(Appimage.logout,height: 56,width: 56),
                      24.hspace,
                      Text('Logout',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Appcolors.appColors.shade100,
                        fontWeight: FontWeight.w600,
                      ),)
                    ],
                  ),
                 ),
            ],
          ),
        ),
      ),
    );
  }
}