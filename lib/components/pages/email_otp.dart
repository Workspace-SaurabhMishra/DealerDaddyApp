import 'package:cardup/components/atoms/all_atoms.dart';
import 'package:cardup/modules/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class EmailOtp extends StatelessWidget {
  const EmailOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            height: getHeight(context),
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: getWidth(context) * 0.8,
                child: Image.asset(
                  "assets/images/dd_logo_pink.png",
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
                  color: Color.fromRGBO(217, 19, 90, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getHeight(context) * 0.1,
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
                      numberOfFields: 4,
                      fieldWidth: getWidth(context) * 0.1,
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800
                      ),
                      keyboardType: TextInputType.number,
                      focusedBorderColor: Colors.black,
                      cursorColor: Colors.black,
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
                      height: getHeight(context) * 0.3,
                    ),
                    SizedBox(
                      width: getWidth(context) * 0.3,
                      height: getHeight(context) * 0.05,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          onPressed: () {

                          },
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20
                              // fontFamily: FontFam
                            ),
                          )),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
