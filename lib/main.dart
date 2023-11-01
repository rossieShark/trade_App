import 'package:flutter/material.dart';
import 'package:trade/app_logic/app_logic_index.dart';
import 'package:trade/screens/screens_index.dart';
import 'package:trade/services/services_index.dart';

void main() {
  SetGetItDependencies().setupProviderDependencies;
  runApp(const MaterialApp(home: InitialPage()));
}

class TradingApp extends StatelessWidget {
  const TradingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CoinsProvider>(
          create: (context) => CoinsProvider(),
        ),
        ChangeNotifierProvider<BuySellProvider>(
          create: (context) => BuySellProvider(),
        ),
        ChangeNotifierProvider<TimerProvider>(
            create: (context) => TimerProvider()),
        ChangeNotifierProvider<TradersModel>(
          create: (context) => TradersModel(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
