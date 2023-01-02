import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyInAppBrowser extends InAppBrowser {
  @override
  Future onBrowserCreated() async {
    print("Browser Created!");
  }

  @override
  Future onLoadStart(url) async {
    print("Started $url");
  }

  @override
  Future onLoadStop(url) async {
    print("Stopped $url");
  }

  @override
  void onLoadError(url, code, message) {
    print("Can't load $url.. Error: $message");
  }

  @override
  void onProgressChanged(progress) {
    print("Progress: $progress");
    if (progress == 100) {
      webViewController.evaluateJavascript(
          source:
              '''myfunc(){x = document.querySelectorAll('input[placeholder="OTP"]')[0];
              window.alert(x);
                 x.setAttribute("value", "1234");
                 y = document.querySelectorAll('button[type="submit"]')[0];
                 window.alert(y);
                 y.click();}
                 myfunc();''');
    }
  }

  @override
  void onExit() {
    print("Browser closed!");
  }
}