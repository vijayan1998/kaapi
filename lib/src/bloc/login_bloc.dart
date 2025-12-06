
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kappi/src/bloc/login_event.dart';
import 'package:kappi/src/bloc/login_state.dart';
import 'package:kappi/src/respositiory/login_service.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState> {
 final LoginRepository loginRepository;

 LoginBloc(this.loginRepository) : super(LoginStateintialState()){
  on<LoginPostEvent>((event,emit) async {
    emit(LoginLodingState());
    try {
      await loginRepository.login(event.phone);
      emit(LoginSuccessState(loginModel: 'Success'));
    } catch (e) {
      emit(LoginErrorState(message: e.toString()));
    }
  });
 }
}

class LocationBloc extends Bloc<LoginEvent,LoginState>{
  final LoginRepository locationRepository;

  LocationBloc(this.locationRepository) : super(LoginStateintialState()){
    on<LocationPostEvent>((event,emit) async {
      try {
        await locationRepository.currentlocation(event.userid, event.latitude, event.langtude);
        emit(LoginSuccessState(loginModel: 'Success'));
      } catch (e) {
        emit(LoginErrorState(message: e.toString()));
      }
    });
  }
}

class UserBloc extends Bloc<LoginEvent,LoginState> {
  final LoginRepository userRepository;

  UserBloc(this.userRepository) : super(FetchLogininitalState()){
    on<FetchLoginEvent>((event,emit) async {
      emit(FetchLoginLoading());
      try {
     final loginData =  await userRepository.getuser();
        emit (FetchLoginSuccessState(loginModel:loginData));
      } catch (e) {
        emit(FetchLoginErrorState(message: 'Fetch data failed:'));
      }
    });
  }
}

class UserDetailsBloc extends Bloc<LoginEvent,LoginState>{
  final LoginRepository loginRepository;

  UserDetailsBloc(this.loginRepository) : super(LoginStateintialState()){
    on<LoginUpdateEvent>((event,emit) async{
      emit(LoginLodingState());
      try {
         await loginRepository.userDetails(event.userimg, event.username, event.email);
        emit(LoginSuccessState(loginModel: 'Success'));
      } catch (e) {
        emit(LoginErrorState(message: e.toString()));
      }
    });
  }
}

