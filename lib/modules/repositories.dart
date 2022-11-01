import 'dart:async';
import 'dart:convert';
import 'package:cardup/modules/state_manager.dart';
import 'package:http/http.dart' as http;

var host = "54.202.248.205/dd";

Map apiStore = {
  "sessionId": "http://$host/sessionId",
  "phoneNumberSubmit":"http://$host/mobile/submission",
  "mobileOTPVerification":"http://$host/mobile/verification",
  "emailSubmit":'http://$host/email/submission',
  "emailOtpVerification":"http://$host/email/verification",
  "setPassword":"https://registration-verification-service-anmp6fzngq-uc.a.run.app/registration/v1/set/password",
  "login":'https://registration-verification-service-anmp6fzngq-uc.a.run.app/registration/v1/login',
  "submitDetails":'https://registration-verification-service-anmp6fzngq-uc.a.run.app/registration/v1/enter/details',
};

Future getSessionId() async{
  var request = http.Request('GET', Uri.parse('http://$host/sessionId'));
  http.StreamedResponse response = await request.send();
  return response;
}

///Use 10.0.2.2 as Host while testing on android emulator.
///Use localhost as Host while testing on web/mac/ios emulator.
Future phoneNumberSubmit(String phoneNumber) async{

  var headers = {
    'Content-Type': 'application/json'
  };

  var request = http.Request('POST', Uri.parse(apiStore["phoneNumberSubmit"]));
  request.body = json.encode({
    "session_id": store.get("session_id"),
    "mobile_number": phoneNumber
  });

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  store.set("phone_number",phoneNumber);
  return response;
}

Future emailSubmit(String email) async{
  var headers = {
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse(apiStore["emailSubmit"]));
  request.body = json.encode({
    "email": email,
    "session_id": store.get("session_id")
  });
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  store.set("email",email);
  return response;
}

Future mobileOtpVerification(otp) async{
  var headers = {
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse(apiStore["mobileOTPVerification"]));
  request.body = json.encode({
    "phone_number": store.get("phone_number"),
    "otp": otp,
    "session_id": store.get("session_id")
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  return response;
}

Future emailOtpVerification(otp) async{
  var headers = {
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse(apiStore["emailOtpVerification"]));
  request.body = json.encode({
    "session_id": store.get("session_id"),
    "email": store.get("email"),
    "otp": "$otp"
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  return response;
}

Future setPassword(password) async{
  var headers = {
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse(apiStore["setPassword"]));
  request.body = json.encode({
    "session_id": store.get("session_id"),
    "email_address": store.get("email"),
    "email_password": password.toString()
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  return response;
}

Future login(username,password) async{
  var headers = {
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse(apiStore["login"]));
  request.body = json.encode({
    "email_address": "$username",
    "email_password": "$password"
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  return response;
}

Future submitDetails(firstName,lastName,dob,gender,address,state,country,city,pincode) async{
  var headers = {
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse(apiStore["submitDetails"]));
  request.body = json.encode({
    "session_id": store.get("session_id"),
    "first_name": firstName,
    "last_name": lastName,
    "date_of_birth": dob,
    "residential_address_1": address,
    "residential_address_2": address,
    "city": city,
    "state": state,
    "country": country,
    "pincode": pincode,
    "gender": gender
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  return response;
}