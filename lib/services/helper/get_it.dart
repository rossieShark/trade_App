import 'package:get_it/get_it.dart';
import 'package:trade/app_logic/coins_provider.dart';
import 'package:trade/app_logic/sell_buy_provider.dart';

import 'package:trade/app_logic/timer_provider.dart';
import 'package:trade/screens/top_traders_screen.dart/top_traders.dart';

class SetGetItDependencies {
  void setupProviderDependencies() {
    GetIt.instance.registerLazySingleton<TimerProvider>(
      () => TimerProvider(),
    );
    GetIt.instance.registerLazySingleton<CoinsProvider>(
      () => CoinsProvider(),
    );
    GetIt.instance.registerLazySingleton<BuySellProvider>(
      () => BuySellProvider(),
    );
    GetIt.instance.registerLazySingleton<TradersModel>(
      () => TradersModel(),
    );
  }
}
