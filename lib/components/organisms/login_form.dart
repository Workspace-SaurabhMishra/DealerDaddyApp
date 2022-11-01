import 'package:cardup/bloc/login/login_bloc.dart';
import 'package:cardup/components/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:cardup/components/atoms/all_atoms.dart';
import 'package:cardup/modules/utilities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LoginForm extends StatefulWidget {
  final LiquidController liquidController;

  const LoginForm({Key? key, required this.liquidController}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(217, 19, 90, 10),
          ),
          height: getHeight(context),
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: getWidth(context) * 0.8,
              child: Image.asset(
                "assets/images/dd_logo_white.png",
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
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: getHeight(context) * 0.03,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromRGBO(217, 19, 90, 1),
                      ),
                      width: getWidth(context) * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 50),
                        child: customTextField(
                          controller: textEditingController,
                            cursorColor: Colors.white,
                            cursorWidth: 15,
                            textColor: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            hint: '   Email',
                            hintColor: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(context) * 0.02,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromRGBO(217, 19, 90, 1),
                      ),
                      width: getWidth(context) * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 50),
                        child: customTextField(
                          controller: textEditingController,
                            cursorColor: Colors.white,
                            cursorWidth: 15,
                            textColor: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            hint: '   Password',
                            hintColor: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(context) * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        //TODO: forgot password
                        debugPrint("Clicked Forgot Password");
                      },
                      child: const Text(
                        "Forgot Password ?",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20
                          // fontFamily: FontFam
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(context) * 0.03,
                    ),
                    SizedBox(
                      width: getWidth(context) * 0.3,
                      height: getHeight(context) * 0.05,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(217, 19, 90, 1)),
                            shape:
                            MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10))),
                          ),
                          onPressed: () {
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20
                              // fontFamily: FontFam
                            ),
                          )),
                    ),
                    SizedBox(
                      height: getHeight(context) * 0.02,
                    ),
                    SizedBox(
                      width: getWidth(context) * 0.3,
                      height: getHeight(context) * 0.05,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(217, 19, 90, 1)),
                            shape:
                            MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10))),
                          ),
                          onPressed: () {
                            widget.liquidController.animateToPage(
                                page: widget.liquidController.currentPage + 1,
                                duration: 250);
                          },
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20
                              // fontFamily: FontFam
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
