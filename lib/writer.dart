import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WriterPages extends StatefulWidget {
  const WriterPages({super.key});

  @override
  State<WriterPages> createState() => _WriterPagesState();
}
class _WriterPagesState extends State<WriterPages> {

  Future<bool> _onBackPressed() async {
    if (await WriterController.canGoBack()) {
      WriterController.goBack();
      return false;
    }
    return true;
  }

  WebViewController WriterController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(Colors.white)
    ..setNavigationDelegate(NavigationDelegate(
      onProgress: (int progress){},
      onWebResourceError: (error){

      },
      onPageFinished: (String url){},
      onPageStarted:  (String url){},
      onNavigationRequest: (request){
        if(request.url.startsWith('www.google.com')){
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ))
    ..loadRequest(Uri.parse('https://m.yenigunaydin.com/yazarlar/'));



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          body:Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: Container(
                child:  WebViewWidget(
                  controller:WriterController,

                ),
              ),
            ),
          ),
      ),
    );
  }
}
