import 'package:cardup/bloc/signup/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cardup/components/atoms/all_atoms.dart';
import 'package:cardup/modules/utilities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../color_pallet.dart';

class MobileForm extends StatelessWidget {
  final LiquidController liquidController;
  final TextEditingController textEditingController = TextEditingController();

  MobileForm({Key? key, required this.liquidController}) : super(key: key);

  handleOnPressed(context) {
    String phoneNumber = textEditingController.text;
    BlocProvider.of<SignupBloc>(context)
        .add(SubmitMobileEvent(phoneNumber: "+91$phoneNumber"));
    liquidController.animateToPage(
        page: liquidController.currentPage + 1, duration: 250);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration:  BoxDecoration(
            color:backgroundColor,
          ),
          height: getHeight(context),
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: SizedBox(
                width: getWidth(context),
                child: Image.asset(
                  "assets/images/DD.png",
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: getHeight(context) * 0.6,
            width: getWidth(context),
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: const Radius.circular(20)),
              // boxShadow: const [
              //    // BoxShadow(
              //    //    color: Colors.black, spreadRadius: 0.1, blurRadius: 10)
              // ],
              color: backgroundColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: getHeight(context) * 0.1,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: inputBoxColor,
                  ),
                  width: getWidth(context) * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    child: customTextField(
                      onSaved: (){
                        handleOnPressed(context);
                      },
                        keyboardType: TextInputType.number,
                        controller: textEditingController,
                        cursorColor: Colors.white,
                        cursorWidth: 15,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        hint: '   Enter Phone Number',
                        hintColor: Colors.white),
                  ),
                ),
                SizedBox(
                  height: getHeight(context) * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: getWidth(context) * 0.5,
                      height: getHeight(context) * 0.07,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(buttonColor,),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          onPressed: () {
                            handleOnPressed(context);
                          },
                          child: const Text(
                            "Send OTP",
                            style: TextStyle(
                                color: Colors.white,
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
