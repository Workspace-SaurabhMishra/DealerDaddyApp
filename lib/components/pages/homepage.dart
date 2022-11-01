import 'package:cardup/modules/utilities.dart';
import 'package:cardup/statics.dart';
import 'package:cardup/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController controller = PageController();
  var options = InAppBrowserClassOptions(
      crossPlatform: InAppBrowserOptions(hideUrlBar: false),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(javaScriptEnabled: true)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(217, 19, 90, 1),
      body: Align(
        alignment: Alignment.topCenter,
        child: ListView(children: [
          Column(
            children: List.generate(availablePlatforms.length, (index) {
              return InkWell(
                onTap: () async{
                  webview().browser.openUrlRequest(
                      urlRequest: URLRequest(url: Uri.parse(availablePlatforms[index]["website"])),
                      options: options
                  );
                },
                child: SizedBox(
                  height: getHeight(context) * 0.1,
                  width: getWidth(context) * 0.9,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: Image.network(
                            availablePlatforms[index]["image_url"],
                          ),
                        ),
                        Text(
                          availablePlatforms[index]["name"],
                          style: const TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ]),
      ),
    );
  }
}