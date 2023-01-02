import 'package:cardup/bloc/signup/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cardup/components/atoms/all_atoms.dart';
import 'package:cardup/modules/utilities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../modules/state_manager.dart';

class EmailForm extends StatelessWidget {
  final LiquidController liquidController;
  final TextEditingController textEditingController = TextEditingController();

  EmailForm({Key? key, required this.liquidController}) : super(key: key);

  handleOnSubmit(String email) {
    if (email.isEmpty) return "Please enter Email";
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailValid) return "Enter valid email";
  }

  handleConfirmEmail(context) {
    String email = textEditingController.text;
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (email.isEmpty) {
      BlocProvider.of<SignupBloc>(context).add(NetworkErrorEvent(error: "Please Enter Email"));
    }
    else if (!emailValid) {
      BlocProvider.of<SignupBloc>(context).add(NetworkErrorEvent(error: "Please Enter Valid Email"));
    }
    else{
      store.set("email",email);
      BlocProvider.of<SignupBloc>(context).add(SubmitEmailEvent(email: email));
      liquidController.animateToPage(
          page: liquidController.currentPage + 1, duration: 250);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                        handleConfirmEmail(context);
                      },
                        controller: textEditingController,
                        cursorColor: Colors.white,
                        cursorWidth: 15,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        hint: '   Enter Email',
                        hintColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: BlocBuilder<SignupBloc, SignupState>(
                    builder: (context, state) {
                      if (state is NetworkErrorState) {
                        return Text(state.error, style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white
                        ),);
                      }
                      else{
                        return const SizedBox(height: 0,width: 0,);
                      }
                    },
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
                        MaterialStateProperty.all<Color>(const Color.fromRGBO(217, 19, 90, 1),),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () {
                        handleConfirmEmail(context);
                      },
                      child: const Text(
                        "Confirm Email",
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
    );
  }
}
