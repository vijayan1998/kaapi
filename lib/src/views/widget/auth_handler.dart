
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kappi/src/bloc/Auth/auth_bloc.dart';
import 'package:kappi/src/bloc/Auth/auth_event.dart';
import 'package:kappi/src/bloc/Auth/auth_state.dart';
import 'package:kappi/src/views/screens/navigation/navigationscreen.dart';
import 'package:kappi/src/views/screens/onboardingscreen.dart';

class AuthHandler extends StatefulWidget {
  const AuthHandler({super.key});

  @override
  State<AuthHandler> createState() => _AuthHandlerState();
}

class _AuthHandlerState extends State<AuthHandler> {
  @override
  void initState() {
    context.read<AuthBloc>().add(CheckuserEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc,AuthState>(builder: (context,state){
      if(state is AuthinitialState || state is AuthloadingState){
        return const Onboardingscreen();
      }
      if(state is AuthLogoutState){
        return const Onboardingscreen();
      } 
      if(state is AuthLogginState){
        return  NavigationScreen(index: 0);
      }
      return const Onboardingscreen();
    });
  }
}