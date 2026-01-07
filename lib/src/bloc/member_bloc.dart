
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kappi/src/bloc/member_event.dart';
import 'package:kappi/src/bloc/member_state.dart';
import 'package:kappi/src/respositiory/api_service.dart';

class MemberBloc extends Bloc<MemberEvent,MemberState>{
  final StoreRepository storeRepository;

  MemberBloc(this.storeRepository) : super(MemberinitialState()){
    on<MemberFetchEvent>((event,emit) async {
      emit(MemberLoadingState());
      try {
        final memberList = await storeRepository.memberList();
        emit(MemberSuccessState(memberModel: memberList));
      } catch (e) {
        emit(MemberErrorState(message: e.toString()));
      }
    });
  }
}