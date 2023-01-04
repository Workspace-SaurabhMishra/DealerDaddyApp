import 'package:cardup/components/organisms/details_form.dart';
import 'package:cardup/components/organisms/email_form.dart';
import 'package:cardup/components/organisms/password_form.dart';
import 'package:cardup/components/pages/email_otp.dart';
import 'package:cardup/components/pages/entry_page.dart';
import 'package:cardup/components/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:liquid_swipe/liquid_swipe.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
       MaterialApp(
          home: DetailsForm(liquidController: LiquidController(),)
      )
  );
}