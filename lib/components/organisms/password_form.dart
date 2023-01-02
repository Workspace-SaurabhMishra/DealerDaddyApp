import 'package:flutter/material.dart';
import 'package:cardup/components/atoms/all_atoms.dart';
import 'package:cardup/modules/utilities.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class PasswordForm extends StatelessWidget {
  final LiquidController liquidController;

  const PasswordForm({required this.liquidController});

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
                width: getWidth(context),
                child: Image.asset(
                  "assets/images/DD.png",
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: getHeight(context) * 0.6,
              width: getWidth(context),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
                          onSaved: (){
                          },
                          controller: TextEditingController(),
                          cursorColor: Colors.white,
                          cursorWidth: 15,
                          textColor: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          hint: '   Enter Password',
                          hintColor: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(context) * 0.01,
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
                          onSaved: (){
                          },
                          controller: TextEditingController(),
                          cursorColor: Colors.white,
                          cursorWidth: 15,
                          textColor: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          hint: '   Confirm Password',
                          hintColor: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(context) * 0.2,
                  ),
                  SizedBox(
                    width: getWidth(context) * 0.3,
                    height: getHeight(context) * 0.05,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(const Color.fromRGBO(217, 19, 90, 1),),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        onPressed: () {
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
                  )
                ],
              ),
            ),
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
