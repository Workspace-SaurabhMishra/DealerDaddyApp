import 'package:flutter/material.dart';
import 'package:cardup/components/atoms/all_atoms.dart';
import 'package:cardup/modules/utilities.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../color_pallet.dart';

class DetailsForm extends StatefulWidget {
  final LiquidController liquidController;

  DetailsForm({required this.liquidController});

  @override
  State<DetailsForm> createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {
  String dropDownValue = "";

  var items = ["Gender", "Male", "Female"];
  var dob = DateTime.now().toString();

  _DetailsFormState() {
    dropDownValue = items[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: backgroundColor,
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
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: backgroundColor,
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
                      borderRadius: BorderRadius.circular(10),
                      color: inputBoxColor,
                    ),
                    width: getWidth(context) * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: customTextField(
                          onSaved: () {},
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
                      borderRadius: BorderRadius.circular(10),
                      color: inputBoxColor,
                    ),
                    width: getWidth(context) * 0.8,
                    height: getHeight(context) * 0.07,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(border: InputBorder.none),
                      borderRadius: BorderRadius.zero,
                      alignment: Alignment.centerRight,
                      value: dropDownValue,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      items: items.map((values) {
                        return DropdownMenuItem(
                          value: values,
                          child: Text(
                            values,
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {},
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 40,
                      ),
                      dropdownColor: inputBoxColor,
                    ),
                  ),
                  SizedBox(
                    height: getHeight(context) * 0.01,
                  ),
                  SizedBox(
                    width: getWidth(context) * 0.8,
                    height: getHeight(context) * 0.07,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          inputBoxColor,
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () async {
                        var datePicker = showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
                        setState(() async {
                          //Todo: Consider null value
                          var temp = await datePicker;
                          print(temp?.toUtc().toString().substring(0, 11));
                          print(temp?.year);
                        });
                      },
                      child: Text(
                        dob,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(context) * 0.1,
                  ),
                  SizedBox(
                    width: getWidth(context) * 0.5,
                    height: getHeight(context) * 0.07,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            buttonColor,
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        onPressed: () {},
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
