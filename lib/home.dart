import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<bool> _onBackPressed() async {
    if (await HomeController.canGoBack()) {
      HomeController.goBack();
      return false;
    }
    return true;
  }
  WebViewController HomeController = WebViewController()
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
  ..loadRequest(Uri.parse('https://m.yenigunaydin.com/'));
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
               controller:HomeController,

             ),
           ),
         ),
       ),
      ),
    );
  }
}
