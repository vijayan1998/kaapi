
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

