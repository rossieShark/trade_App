import 'package:trade/models/models_index.dart';
import 'package:trade/resources/resources.dart';

class AppData {
  final List<String> _currencyPairs = [
    'EUR/USD',
    'GBP/USD',
    'EUR/USD',
    'EUR/USD',
    'GBP/USD',
    'EUR/USD',
    'EUR/USD',
    'EUR/USD',
    'EUR/USD',
    'GBP/USD',
    'EUR/USD',
    'EUR/USD',
    'GBP/USD',
    'EUR/USD',
  ];

  final List<TopTraders> _topTraders = [
    TopTraders(
      country: AppImages.unitedStates,
      name: 'Oliver',
      deposit: 2367,
      profit: 336755,
    ),
    TopTraders(
      country: AppImages.canada,
      name: 'Jack',
      deposit: 1175,
      profit: 148389,
    ),
    TopTraders(
        country: AppImages.brazil,
        name: 'Harry',
        deposit: 1000,
        profit: 113888),
    TopTraders(
        country: AppImages.southKorea,
        name: 'Jacob',
        deposit: 999,
        profit: 36755),
    TopTraders(
        country: AppImages.germany,
        name: 'Charley',
        deposit: 888,
        profit: 18389),
    TopTraders(
        country: AppImages.brazil, name: 'Thomas', deposit: 777, profit: 12000),
    TopTraders(
        country: AppImages.france, name: 'George', deposit: 666, profit: 11111),
    TopTraders(
        country: AppImages.newZealand,
        name: 'Oscar',
        deposit: 555,
        profit: 9988),
    TopTraders(
        country: AppImages.india, name: 'James', deposit: 444, profit: 8877),
    TopTraders(
        country: AppImages.spain, name: 'William', deposit: 333, profit: 6652),
  ];

  List<String> get currencyPairs => _currencyPairs;
  List<TopTraders> get topTraders => _topTraders;
  String returnHTMLRequest(String currency) {
    final htmlRequest = '''

<!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container" style="height:100%;width:100%">
  
 
  <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
  <script type="text/javascript">
  new TradingView.widget(
  {
  "autosize": true,
 
      "symbol": "FX:$currency",
      "interval": "V",
 
      "theme": "dark",
      "style": "8",
      "locale": "en",
      "timezone": "Etc/UTC",
      "enable_publishing": false,
      "backgroundColor": "rgba(18, 22, 41, 1)",
      "hide_top_toolbar": true,
      "hide_legend": true,
      "save_image": false,
      "container_id": "tradingview_bde7d",
      "range": "1D",
      "timeFrames": [],  // An empty array to remove the date
      "overrides": {
        "paneProperties.background": "#121d26",
        "volumePaneSize": 0
      },
      "plotOpts": {
        "candlestick": {
          "wickColor": "#00FF00", // Color of candle wicks
          "borderUpColor": "#FF0000", // Color of bullish candles
          "borderDownColor": "#0000FF" // Color of bearish candles
        }
      }
    }
    );
  </script>
  <!-- Add the meta tag for constant zoom level -->
  <meta name="viewport" content="width=device-width, initial-scale=1.1, user-scalable=no">
</div>
<!-- TradingView Widget END -->
''';
    return htmlRequest;
  }
}
