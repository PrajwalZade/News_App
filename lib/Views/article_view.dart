import 'dart:async';

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class Article extends StatefulWidget {
  final String blogUrl;

  Article({this.blogUrl});

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("India"),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            )
          ],
        )),
        //leading: new Container(),
        actions: [
          Opacity(
            opacity: 0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            // child: IconButton(
            //   icon: Icon(Icons.save),
            //   onPressed: () {
            //     Fluttertoast.showToast(
            //         msg: "Saved",
            //         toastLength: Toast.LENGTH_SHORT,
            //         gravity: ToastGravity.CENTER,
            //         timeInSecForIosWeb: 1,
            //         backgroundColor: Colors.red,
            //         textColor: Colors.white,
            //         fontSize: 16.0);
            //   },
            // )
          ),
        ],
        elevation: 4,
      ),
      body: Container(
          // padding: EdgeInsets.symmetric(horizontal: 16),
          child: WebView(
        initialUrl: widget.blogUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: ((WebViewController webViewController) {
          _completer.complete(webViewController);
        }),
      )),
    );
  }
}
