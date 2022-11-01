import 'package:cardup/bloc/signup/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cardup/components/atoms/all_atoms.dart';
import 'package:cardup/modules/utilities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class MobileForm extends StatelessWidget {
  final LiquidController liquidController;
  final TextEditingController textEditingController = TextEditingController();

  MobileForm({Key? key, required this.liquidController}) : super(key: key);

  handleOnPressed(context) {
    String phoneNumber = textEditingController.text;
    BlocProvider.of<SignUpBloc>(context)
        .add(SubmitMobileEvent(phoneNumber: "+91$phoneNumber"));
    liquidController.animateToPage(
        page: liquidController.currentPage + 1, duration: 250);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
                  height: getHeight(context) * 0.05,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  width: getWidth(context) * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    child: customTextField(
                        keyboardType: TextInputType.number,
                        controller: textEditingController,
                        cursorColor: Colors.black,
                        cursorWidth: 15,
                        textColor: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        hint: '   Enter Phone Number',
                        hintColor: Colors.black),
                  ),
                ),
                SizedBox(
                  height: getHeight(context) * 0.4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: getWidth(context) * 0.5,
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
                            handleOnPressed(context);
                          },
                          child: const Text(
                            "Confirm Phone",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20
                                // fontFamily: FontFam
                                ),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
