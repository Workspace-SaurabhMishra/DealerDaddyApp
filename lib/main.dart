import 'dart:convert';

import 'package:cardup/components/pages/email_otp.dart';
import 'package:cardup/components/pages/entry_page.dart';
import 'package:cardup/components/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MaterialApp(
          home: EntryPage()
      )
  );
}