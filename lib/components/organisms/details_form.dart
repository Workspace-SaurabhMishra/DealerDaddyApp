import 'package:flutter/material.dart';
import 'package:cardup/components/atoms/all_atoms.dart';
import 'package:cardup/modules/utilities.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../color_pallet.dart';

class DetailsForm extends StatelessWidget {
  final LiquidController liquidController;

  DetailsForm({required this.liquidController});
  String dropDownValue = "";
  var items = ["male" , "female"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration:  BoxDecoration(
              color:backgroundColor,
            ),
            height: getHeight(context),
            child:Align(
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
                    topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.black, spreadRadius: 0.1, blurRadius: 10)
                // ],
                color:backgroundColor,
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
                      color: inputBoxColor,
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
                          hint: '   Enter Name',
                          hintColor: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(context) * 0.01,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: inputBoxColor,
                    ),
                    width: getWidth(context) * 0.8,
                    child: DropdownButton(
                      value: dropDownValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.,
                      onChanged: (String? newValue) {
                        },
                    ),
                  ),
                  SizedBox(
                    height: getHeight(context) * 0.1,
                  ),
                  SizedBox(
                    width: getWidth(context) * 0.3,
                    height: getHeight(context) * 0.05,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(buttonColor,),
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
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: FloatingActionButton(
          //     backgroundColor: buttonColor,
          //     onPressed: (){},
          //     child: IconButton(
          //       onPressed: () {
          //         liquidController.animateToPage(
          //             page: liquidController.currentPage - 1,
          //             duration: 150);
          //       },
          //       icon: const Icon(Icons.arrow_back),
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
