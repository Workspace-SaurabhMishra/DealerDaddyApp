part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class SubmitEmailEvent implements SignupEvent{
  final String email;

  const SubmitEmailEvent({required this.email});

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();

}

class NetworkErrorEvent implements SignupEvent{
  final String error;

  const NetworkErrorEvent({required this.error});

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();

}

class VerifyEmailOtpEvent implements SignupEvent{
  final String otp;

  const VerifyEmailOtpEvent({required this.otp});

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();

}

class SubmitMobileEvent implements SignupEvent{
  final String phoneNumber;

  const SubmitMobileEvent({required this.phoneNumber});

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();

}

class VerifyMobileOtpEvent implements SignupEvent{
  final String otp;

  const VerifyMobileOtpEvent({required this.otp});

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();

}


