import 'package:cardup/bloc/signup/signup_bloc.dart';
import 'package:cardup/bloc/login/login_bloc.dart';
import 'package:cardup/components/organisms/details_form.dart';
import 'package:cardup/components/organisms/email_otp_form.dart';
import 'package:cardup/components/organisms/home_page.dart';
import 'package:cardup/components/organisms/mobile_form.dart';
import 'package:cardup/components/organisms/mobile_otp_form.dart';
import 'package:cardup/components/organisms/password_form.dart';
import 'package:cardup/components/pages/homepage__.dart';
import 'package:cardup/components/pages/mobile_otp.dart';
import 'package:flutter/material.dart';
import 'package:cardup/components/organisms/login_form.dart';
import 'package:cardup/components/organisms/email_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class EntryPage extends StatelessWidget {
  final LiquidController liquidController = LiquidController();

  EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocProvider(
          create: (context) => SignupBloc(),
          child: BlocListener<SignupBloc, SignupState>(
            listener: (context, state) {
              if (state is NetworkErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
              }
              else if (state is EmailOtpVerifiedState) {
                liquidController.animateToPage(
                    page: liquidController.currentPage + 1,
                    duration: 250);
              }
              else if (state is MobileOtpVerifiedState) {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return HomePage__();
                    }));
              }
            },
            child: LiquidSwipe(
              initialPage: 0,
              liquidController: liquidController,
              disableUserGesture: true,
              waveType: WaveType.liquidReveal,
              enableLoop: true,
              pages: [
                LoginForm(liquidController: liquidController,),
                EmailForm(liquidController: liquidController,),
                EmailOtpForm(liquidController: liquidController),
                MobileForm(liquidController: liquidController),
                MobileOtpForm(liquidController: liquidController,),
                PasswordForm(liquidController: liquidController),
                // DetailsForm(liquidController: liquidController),
                HomePage(liquidController: liquidController),
              ],
            ),
          ),
        ));
  }
}