import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cardup/modules/repositories.dart';
import 'package:cardup/modules/state_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {

    on<SubmitEmailEvent>((event,emit) async{
      StreamedResponse sessionIdResponse = await getSessionId();
      String sessionId = jsonDecode(await sessionIdResponse.stream.bytesToString())["response"];
      store.set("session_id",sessionId);
      print("sessionID $sessionId");
      StreamedResponse httpResponse = await emailSubmit(event.email);
      if (httpResponse.statusCode != 200){
        var response = await httpResponse.stream.bytesToString();
        print(response);
        var errorJson =  json.decode(response);
        print(errorJson["response"]);
        emit(NetworkErrorState(error: errorJson["response"]));
        print(httpResponse.statusCode);
      }
    });

    on<VerifyEmailOtpEvent>((event, emit) async{
      StreamedResponse httpResponse = await emailOtpVerification(event.otp);
      if (httpResponse.statusCode != 200) {
        print("Bloc Print: Error in email otp verification");
        print(await httpResponse.stream.bytesToString());
      }
      else{
        emit(EmailOtpVerifiedState());
      }

    });

    on<SubmitMobileEvent>((event,emit) async{
      StreamedResponse httpResponse = await phoneNumberSubmit(event.phoneNumber);
      if (httpResponse.statusCode != 200){
        var x = await httpResponse.stream.bytesToString();
        print(x);
        var errorJson =  json.decode(x);
        print(errorJson["response"]);
        emit(NetworkErrorState(error: x));
        print(httpResponse.statusCode);
      }
    });


    on<VerifyMobileOtpEvent>((event, emit) async{
      StreamedResponse httpResponse = await mobileOtpVerification(event.otp);
      if (httpResponse.statusCode != 200) {
        print("Bloc Print: Error in mobile otp verification");
        print(await httpResponse.stream.bytesToString());
      }
      else{
        emit(MobileOtpVerifiedState());
      }

    });
    
    on<NetworkErrorEvent>((event, emit) async{
      emit(NetworkErrorState(error: event.error));
    });
  }
}
