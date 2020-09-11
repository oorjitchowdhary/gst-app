import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Report extends StatelessWidget {
  static final String id = "report";
  final String url = 'https://cyberbaap.org/cyberbullying/reporting/';
  InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Report',
              style: TextStyle(fontFamily: 'Lexend Deca')
            ),
          ),
          body: InAppWebView(
            initialUrl: url,
            onWebViewCreated: (InAppWebViewController controller) {
              _webViewController = controller;
            },
          )
    );
  }
}