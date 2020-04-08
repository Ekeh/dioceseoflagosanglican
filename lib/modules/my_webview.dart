import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  final String title;
  final String selectedUrl;

  MyWebView({
    @required this.title,
    @required this.selectedUrl,
  });
  @override
  createState() => _WebViewContainerState(this.title, this.selectedUrl);
}
class _WebViewContainerState extends State<MyWebView> {
  var _url;
  var _title;
  final _key = UniqueKey();
  var _loadStreamController = new StreamController<bool>.broadcast();
  Completer<WebViewController> _controller = Completer<WebViewController>();

  _WebViewContainerState(this._title, this._url);

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    _loadStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(_title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
        new WebView(
          key: _key,
          initialUrl: _url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (webViewCreate) {
            _controller.complete(webViewCreate);
          },
          onPageFinished: (finish) {
              _loadStreamController.add(false);
          },
        ),
           StreamBuilder<bool>(
             stream: _loadStreamController.stream,
             initialData: true,
             builder: (context, snapshot) {
               return
               snapshot.data ?
                 Container(
                  alignment: FractionalOffset.center,
                  child: CircularProgressIndicator(),
                ): Container(
                 width: 0.0,
                 height: 0.0
               );
             }
           )

          ],
        ),
      ),
    );
  }
}
