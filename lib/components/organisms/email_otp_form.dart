import 'package:cardup/bloc/signup/signup_bloc.dart';
import 'package:cardup/components/atoms/all_atoms.dart';
import 'package:cardup/modules/state_manager.dart';
import 'package:cardup/modules/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

class EmailOtpForm extends StatelessWidget {
  final LiquidController liquidController;
  List otpControllers = [];

  EmailOtpForm({Key? key, required this.liquidController}) : super(key: key);

  void handleSubmitButton(context, otp) async {
    String otp = "";

    for (var i = 0; i < otpControllers.length; i++) {
      otp += otpControllers[i].text;
    }

    BlocProvider.of<SignupBloc>(context).add(VerifyEmailOtpEvent(otp: otp));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            height: getHeight(context),
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: getWidth(context) * 0.8,
                child: Image.asset(
                  "assets/images/DD.png",
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: getHeight(context) * 0.7,
                width: getWidth(context),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black, spreadRadius: 0.1, blurRadius: 10)
                  ],
                  color: Colors.black,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getHeight(context) * 0.05,
                    ),
                    const Text(
                      "OTP is sent to",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Text(
                      "${store.get("email")}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    SizedBox(
                      height: getHeight(context) * 0.03,
                    ),
                    OtpTextField(
                      onSubmit: (otp){
                        handleSubmitButton(context, "1234");
                      },
                      handleControllers: (allControllers) {
                        otpControllers = allControllers;
                      },
                      numberOfFields: 4,
                      fieldWidth: getWidth(context) * 0.1,
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800
                      ),
                      keyboardType: TextInputType.number,
                      focusedBorderColor: Colors.white,
                      borderColor: const Color.fromRGBO(217, 19, 90, 1),
                      enabledBorderColor: const Color.fromRGBO(217, 19, 90, 1),
                      cursorColor: Colors.white,
                    ),
                    SizedBox(
                      height: getHeight(context) * 0.03,
                    ),
                    const InkWell(
                      child: Text(
                        "Resend OTP ?",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(context) * 0.2,
                    ),
                    SizedBox(
                      width: getWidth(context) * 0.5,
                      height: getHeight(context) * 0.05,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(217, 19, 90, 1)),
                            shape: MaterialStateProperty.all<
                                OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10))),
                          ),
                          onPressed: () {
                            handleSubmitButton(context, "1234");
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20
                              // fontFamily: FontFam
                            ),
                          )),
                    ),
                  ],
                )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: const Color.fromRGBO(217, 19, 90, 1),
              onPressed: (){},
              child: IconButton(
                onPressed: () {
                  liquidController.animateToPage(
                      page: liquidController.currentPage - 1,
                      duration: 150);
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
