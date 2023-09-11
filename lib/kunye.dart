
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KunyePages extends StatefulWidget {
  const KunyePages({super.key});

  @override
  State<KunyePages> createState() => _KunyePagesState();
}

class _KunyePagesState extends State<KunyePages> {
  Future<bool> _onBackPressed() async {
    if (await KunyeController.canGoBack()) {
      KunyeController.goBack();
      return false;
    }
    return true;
  }

  WebViewController KunyeController = WebViewController()
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
    ..loadRequest(Uri.parse('https://m.yenigunaydin.com/sayfalar/kunye/'));



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
                controller:KunyeController,

              ),
            ),
          ),
        ),
      ),
    );
  }
}
