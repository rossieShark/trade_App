import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:trade/app_logic/sell_buy_provider.dart';
import 'package:trade/screens/bottom_bar.dart';
import 'package:trade/app_logic/coins_provider.dart';

import 'package:trade/screens/top_traders_screen.dart/top_traders.dart';

import 'package:trade/app_logic/timer_provider.dart';
import 'package:trade/services/helper/get_it.dart';

void main() {
  SetGetItDependencies().setupProviderDependencies;
  runApp(const MaterialApp(home: TradingApp()));
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
      child: const MaterialApp(
        home: BottomBarNavigation(),
      ),
    );
  }
}
