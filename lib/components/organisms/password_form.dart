import 'package:flutter/material.dart';
import 'package:cardup/components/atoms/all_atoms.dart';
import 'package:cardup/modules/utilities.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class PasswordForm extends StatelessWidget {
  final LiquidController liquidController;

  const PasswordForm({required this.liquidController});

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
            child: Center(child: Text("Password Screen"),),
          ),
        ),
      ],
    );
  }
}
