import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kappi/src/bloc/Auth/auth_event.dart';
import 'package:kappi/src/bloc/Auth/auth_state.dart';
import 'package:kappi/src/views/utilies/hive_storage.dart';

class AuthBloc  extends Bloc<AuthEvent,AuthState> {

  AuthBloc() : super(AuthinitialState()){
    on<CheckuserEvent>((event,emit)  {
      emit(AuthloadingState());
        final userid =  HiveStorage.readUser();
        if(userid == null){
          emit(AuthLogoutState());
        }else{
          emit(AuthLogginState(userid: userid));
        }
    });

    on<SaveUserEvent>((event,emit) async {
      await HiveStorage.saveuser(event.userid.toString());
      emit(AuthLogginState(userid:event.userid.toString()));
    });

    on<LogoutEvent>((event,emit) async {
      await HiveStorage.clearUser();
      emit(AuthLogoutState());
    });
  }
} 