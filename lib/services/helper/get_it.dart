import 'package:get_it/get_it.dart';
import 'package:trade/app_logic/app_logic_index.dart';
import 'package:trade/screens/screens_index.dart';

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
