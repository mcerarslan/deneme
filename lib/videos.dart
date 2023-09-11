import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideosPages extends StatefulWidget {
  const VideosPages({super.key});

  @override
  State<VideosPages> createState() => _VideosPagesState();
}

class _VideosPagesState extends State<VideosPages> {
  Future<bool> _onBackPressed() async {
    if (await VideosController.canGoBack()) {
      VideosController.goBack();
      return false;
    }
    return true;
  }

  WebViewController VideosController = WebViewController()
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
    ..loadRequest(Uri.parse('https://m.yenigunaydin.com/videolar/'));



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
                controller:VideosController,

              ),
            ),
          ),
        ),
      ),
    );
  }
}
