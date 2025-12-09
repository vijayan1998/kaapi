import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kappi/src/bloc/Auth/auth_bloc.dart';
import 'package:kappi/src/bloc/login_bloc.dart';
import 'package:kappi/src/bloc/login_event.dart';
import 'package:kappi/src/respositiory/login_service.dart';
import 'package:kappi/src/views/utilies/route_page.dart';
import 'package:kappi/src/views/widget/auth_handler.dart';

void main() async {
SystemChrome.setPreferredOrientations(
  [DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]
);
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
WidgetsFlutterBinding.ensureInitialized();
await Hive.initFlutter();
await Hive.openBox('userBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (context) => UserBloc(LoginRepository())..add(FetchLoginEvent())),
        BlocProvider<LocationBloc>(create: (context) => LocationBloc(LoginRepository())),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
      ],
      child: GetMaterialApp( 
        title: 'Kappi Shop',
        debugShowCheckedModeBanner: false,
         getPages: AppRoutes.appRoutes(),
        // defaultTransition: Transition.leftToRightWithFade,
        // initialRoute: Appnames.onboradingScreen,
        home: AuthHandler(),
      ),
    );
  }
}


