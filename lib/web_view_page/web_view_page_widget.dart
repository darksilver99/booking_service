import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'web_view_page_model.dart';
export 'web_view_page_model.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:booking_service/auth/firebase_auth/auth_util.dart';

class WebViewPageWidget extends StatefulWidget {
  const WebViewPageWidget({
    super.key,
    required this.title,
    required this.url,
  });

  final String? title;
  final String? url;

  @override
  State<WebViewPageWidget> createState() => _WebViewPageWidgetState();
}

class _WebViewPageWidgetState extends State<WebViewPageWidget> {
  late WebViewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  InAppWebViewController? _webViewController;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebViewPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            valueOrDefault<String>(
              widget.title,
              '-',
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Sora',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(widget.url!)),
            onWebViewCreated: (controller) {
              _webViewController = controller;
              controller.setSettings(
                settings: InAppWebViewSettings(incognito: true),
              );
            },
            onLoadStop: (controller, url) {
              print("onLoadStop : $url");
              controller.addJavaScriptHandler(
                handlerName: "getUserData",
                callback: (args) async {
                  return {
                    "userPath": currentUserDocument!.reference.path,
                  };
                },
              );

              controller.addJavaScriptHandler(
                handlerName: "callUploadFunctionOnFlutter",
                callback: (args) async {
                  print(args[0]["userPath"]);
                },
              );

              // controller.evaluateJavascript(source: 'window.callUploadFunction()');
            },
            onConsoleMessage: (controller, msg) {
              print("onConsoleMessage");
              print(msg);
            },
          ),
        ),
      ),
    );
  }
}
