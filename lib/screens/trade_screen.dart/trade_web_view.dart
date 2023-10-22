import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TradeWebView extends StatefulWidget {
  const TradeWebView({
    super.key,
    required this.siteExample,
  });

  final String siteExample;
  @override
  State<TradeWebView> createState() => _TradeWebViewState();
}

class _TradeWebViewState extends State<TradeWebView> {
  var loadingPercentage = 0;
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
    configureWebView();
  }

  void configureWebView() {
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(),
      )
      ..loadHtmlString(
        widget.siteExample,
      );
  }

  @override
  void didUpdateWidget(covariant TradeWebView oldWidget) {
    if (widget.siteExample != oldWidget.siteExample) {
      configureWebView();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: _controller,
    );
  }
}
