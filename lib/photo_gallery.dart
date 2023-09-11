import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PhotoGalleryPages extends StatefulWidget {
  const PhotoGalleryPages({super.key});

  @override
  State<PhotoGalleryPages> createState() => _PhotoGalleryPagesState();
}

class _PhotoGalleryPagesState extends State<PhotoGalleryPages> {
  Future<bool> _onBackPressed() async {
    if (await PhotoGalleryController.canGoBack()) {
      PhotoGalleryController.goBack();
      return false;
    }
    return true;
  }

  WebViewController PhotoGalleryController = WebViewController()
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
    ..loadRequest(Uri.parse('https://m.yenigunaydin.com/galeriler/'));



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
                controller:PhotoGalleryController,

              ),
            ),
          ),
        ),
      ),
    );
  }
}
