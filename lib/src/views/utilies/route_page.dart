import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:kappi/src/views/screens/loginscreen.dart';
import 'package:kappi/src/views/screens/navigation/home/cartscreen.dart';
import 'package:kappi/src/views/screens/navigation/home/cartsecondscreen.dart';
import 'package:kappi/src/views/screens/navigation/home/homedetails.dart';
import 'package:kappi/src/views/screens/navigation/home/notifications.dart';
import 'package:kappi/src/views/screens/navigation/membership/membershipdetail.dart';
import 'package:kappi/src/views/screens/navigation/navigationscreen.dart';
import 'package:kappi/src/views/screens/navigation/order/orderaddscreen.dart';
import 'package:kappi/src/views/screens/navigation/order/orderdetails.dart';
import 'package:kappi/src/views/screens/navigation/profile/deleteaccount.dart';
import 'package:kappi/src/views/screens/navigation/profile/deliveryadd.dart';
import 'package:kappi/src/views/screens/navigation/profile/deliveryaddress.dart';
import 'package:kappi/src/views/screens/navigation/profile/editscreen.dart';
import 'package:kappi/src/views/screens/navigation/profile/logoutscreen.dart';
import 'package:kappi/src/views/screens/navigation/profile/myorderscreen.dart';
import 'package:kappi/src/views/screens/navigation/profile/offerreward.dart';
import 'package:kappi/src/views/screens/navigation/profile/orderplaced.dart';
import 'package:kappi/src/views/screens/navigation/profile/ordertracking.dart';
import 'package:kappi/src/views/screens/navigation/profile/paymentscreen.dart';
import 'package:kappi/src/views/screens/navigation/profile/reorderscreen.dart';
import 'package:kappi/src/views/screens/navigation/store/storeadd.dart';
import 'package:kappi/src/views/screens/navigation/store/storelist.dart';
import 'package:kappi/src/views/screens/onboardingscreen.dart';
import 'package:kappi/src/views/screens/otpscreen.dart';
import 'package:kappi/src/views/screens/otpverified.dart';
import 'package:kappi/src/views/screens/wrongnumberscreen.dart';
import 'package:kappi/src/views/screens/wrongotpscreen.dart';
import 'package:kappi/src/views/utilies/route_name.dart';

class AppRoutes {
  static appRoutes() => [
   GetPage(
      name: Appnames.onboradingScreen,
      page: () => Onboardingscreen() ,
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
    GetPage(
      name: Appnames.loginScreen,
      page: () => LoginScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
     GetPage(
      name: Appnames.wrongScreen,
      page: () => WrongNumberScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
     GetPage(
      name: Appnames.wrongOTPscreen,
      page: () => WrongOTPScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
     GetPage(
      name: Appnames.otpverified,
      page: () => OTPVerified(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
    GetPage(
      name: Appnames.otpScreen,
      page: () => Otpscreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
     GetPage(
      name: Appnames.navigator,
      page: () => NavigationScreen(index: 0,),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
    GetPage(
      name: Appnames.cartScreen,
      page: () => CartScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
     GetPage(
      name: Appnames.cartsecondscreen,
      page: () => Cartsecondscreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
    GetPage(
      name: Appnames.notifications,
      page: () => Notifications(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
    GetPage(
      name: Appnames.orderdetails,
      page: () => OrderDetailsScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
    GetPage(
      name: Appnames.orderAddScreen,
      page: () => OrderAddScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
     GetPage(
      name: Appnames.myorderscreen,
      page: () => MyorderScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
     GetPage(
      name: Appnames.logout,
      page: () => LogoutScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
     GetPage(
      name: Appnames.offerrewards,
      page: () => OfferScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
     GetPage(
      name: Appnames.paymentscreen,
      page: () => PaymentMethods(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
     GetPage(
      name: Appnames.delivery,
      page: () => DeliveryAddress(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
     GetPage(
      name: Appnames.deliveryadd,
      page: () => DeliveryAddScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
     GetPage(
      name: Appnames.delete,
      page: () => DeleteAccountScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
      GetPage(
      name: Appnames.membershipdetails,
      page: () => MembershipDetailScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
     GetPage(
      name: Appnames.edit,
      page: () => EditScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
     GetPage(
      name: Appnames.storelist,
      page: () => StorelistScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
     GetPage(
      name: Appnames.storeaddscreen,
      page: () => StoreaddScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
    GetPage(
      name: Appnames.homedetails,
      page: () => HomeDetailsScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
     GetPage(
      name: Appnames.reorderscreen,
      page: () => ReorderaddScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
     GetPage(
      name: Appnames.orderplaced,
      page: () => OrderPlaced(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
     GetPage(
      name: Appnames.ordertracking,
      page: () => OrderTracking(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
  ];
}