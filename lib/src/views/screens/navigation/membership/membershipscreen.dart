import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kappi/src/bloc/apiurl.dart';
import 'package:kappi/src/bloc/member_bloc.dart';
import 'package:kappi/src/bloc/member_event.dart';
import 'package:kappi/src/bloc/member_state.dart';
import 'package:kappi/src/respositiory/api_service.dart';
import 'package:kappi/src/views/screens/navigation/membership/membershipdetail.dart';
import 'package:kappi/src/views/utilies/colors.dart';
import 'package:kappi/src/views/utilies/images.dart';
import 'package:kappi/src/views/utilies/route_name.dart';
import 'package:kappi/src/views/utilies/sizedbox.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColors.shade50,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            color: Color(0xff211712),
            alignment: Alignment.center,
            child: Text('Membership Plans',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Appcolors.appColors.shade100,
              fontWeight: FontWeight.w700,
            ),),
          ),
          Image.asset(Appimage.member,fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Join our membership program to enjoy exclusive benefits, discounts, and early access to new coffee blends.',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
          ),
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color(0xff211712),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [ 
                    Text('Current Plan',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Appcolors.appColors.shade400,
                    ),),
                    4.vspace,
                    Text('Gold Member',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Appcolors.appColors.shade100,
                      fontWeight: FontWeight.w600
                    ),),
                    4.vspace,
                     Text('Expires on December 31, 2025',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Appcolors.appColors.shade400,
                    ),),
                    12.vspace,
                    CommonButtonWidget(text: 'Manage',onTap: (){
                      Get.toNamed(Appnames.membershipdetails);
                    },),
                  ],
                ),
                Image.asset(Appimage.member1),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Explore Plans',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Appcolors.appColors.shade100,
              fontWeight: FontWeight.w600,
            ),),
          ),
          BlocProvider(create: (_)=> MemberBloc(StoreRepository()),
          child: BlocBuilder<MemberBloc,MemberState>(
            builder: (context,state){
            if(state is MemberinitialState){
              BlocProvider.of<MemberBloc>(context).add(MemberFetchEvent());
              return CircularProgressIndicator();
            }else if(state is MemberLoadingState){
              return CircularProgressIndicator();
            }else if(state is MemberSuccessState){
             return ListView.builder(
              padding: EdgeInsets.all(0),
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.memberModel.length,
              shrinkWrap: true,
              itemBuilder: (context,index){
                final member = state.memberModel[index];
            return Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color(0xff211712),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [ 
                    Text(member.planname.toString(),style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Appcolors.appColors.shade100,
                      fontWeight: FontWeight.w600
                    ),),
                    4.vspace,
                     SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                       child: Text(member.plandescription.toString(),style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Appcolors.appColors.shade400,
                                           ),),
                     ),
                    12.vspace,
                    CommonButtonWidget(text: member.planname.toString() == 'Free' ?  'Join' : 'Subscribe',
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MembershipDetailScreen(
                        planname: member.planname,planimg: member.planimg,description: member.plandescription,
                        price: member.price.toString(),termconditions: member.termscondition,cancelpolicy: member.cancelpolicy,
                        planbenefit: member.planbenefits,
                      )));
                    },),
                  ],
                ),
                Image.network('${Apiurl.apiurl}/uploads/membership/${member.planimg}'),
              ],
            ),
          );
              });
            } else if(state is MemberErrorState){
              return Text(state.toString(),style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Appcolors.appColors.shade100,
              ),);
            }
            return Container();
            }
            ),),
          ],
        ),
      ),
    );
  }
}

class CommonButtonWidget extends StatelessWidget {
  final String text;
  final Function()? onTap;
  
  const CommonButtonWidget({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Appcolors.appColors.shade300,
         borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(text,style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Appcolors.appColors.shade100,
            ),),
            8.hspace,
            Icon(Icons.arrow_forward_ios,color: Appcolors.appColors.shade100,size: 16,),
          ],
        ),
      ),
    );
  }
}