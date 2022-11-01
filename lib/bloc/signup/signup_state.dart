part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();
}

class SignupInitial extends SignupState {
  @override
  List<Object> get props => [];
}

class SendEmailState implements SignupState{
  final String email;

  const SendEmailState({required this.email});

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();

}

class EmailSentState implements SignupState{


  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();

}

class SmsSentState implements SignupState{


  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();

}

class NetworkErrorState implements SignupState{
  final String error;

  const NetworkErrorState({required this.error});

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();
}

class EmailOtpVerifiedState implements SignupState{
  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();

}

class MobileOtpVerifiedState implements SignupState{
  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();

}
