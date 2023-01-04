import 'package:cardup/bloc/signup/signup_bloc.dart';
import 'package:cardup/components/atoms/all_atoms.dart';
import 'package:cardup/components/pages/homepage.dart';
import 'package:cardup/modules/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../color_pallet.dart';

class MobileOtpForm extends StatelessWidget {
  final LiquidController liquidController;
  List otpControllers = [];

  MobileOtpForm({Key? key, required this.liquidController}) : super(key: key);

  void handleOnPressed(context) async {
    String otp = "";

    for (var i = 0; i < otpControllers.length; i++) {
      otp += otpControllers[i].text;
    }

    BlocProvider.of<SignupBloc>(context).add(VerifyMobileOtpEvent(otp: otp));
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
                      "OTP is sent to your number",
                      style: TextStyle(
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
                        handleOnPressed(context);
                      },
                      handleControllers: (allControllers){
                        otpControllers = allControllers;
                      },
                      numberOfFields: 4,
                      fieldWidth: getWidth(context) * 0.1,
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w800
                      ),
                      keyboardType: TextInputType.number,
                      focusedBorderColor: Colors.white,
                      borderColor: buttonColor,
                      enabledBorderColor: buttonColor,
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
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(context) * 0.3,
                    ),
                    SizedBox(
                      width: getWidth(context) * 0.5,
                      height: getHeight(context) * 0.05,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(217, 19, 90, 1)),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          onPressed: () {
                            handleOnPressed(context);
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
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        backgroundColor: buttonColor,
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
                )),
          ),
        ],
      ),
    );
  }
}
