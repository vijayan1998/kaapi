import 'package:kappi/src/model/member_model.dart';

abstract class MemberState {}

class MemberinitialState extends MemberState{}

class MemberLoadingState extends MemberState{}

class MemberSuccessState extends MemberState{
  final List<MemberModel> memberModel;

  MemberSuccessState({required this.memberModel});
}

class MemberErrorState extends MemberState{
  final String message;

  MemberErrorState({ required this.message});
}

