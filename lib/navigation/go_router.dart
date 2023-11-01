import 'package:flutter/cupertino.dart';

import 'package:go_router/go_router.dart';
import 'package:trade/screens/bottom_bar.dart';
import 'package:trade/screens/currency_pair_screen.dart/currency_pair.dart';
import 'package:trade/screens/top_traders_screen.dart/top_traders.dart';
import 'package:trade/screens/trade_screen.dart/trade_scren_main.dart';
import 'package:trade/widgets/page_route_animation.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
        builder: (context, state, widget) => BottomBarNavigation(
              child: widget,
            ),
        routes: [
          GoRoute(
              path: routeNameMap[RouteName.trade]!,
              pageBuilder: (context, state) => const CupertinoPage(
                    child: TradeScreen(),
                  ),
              routes: [
                GoRoute(
                  path: routeNameMap[RouteName.currencyPair]!,
                  builder: (context, state) => Builder(
                    builder: (innerContext) => const PageRouteAnimation(
                      child: CurrencyPairsScreen(),
                    ),
                  ),
                ),
              ]),
          GoRoute(
            path: routeNameMap[RouteName.top]!,
            pageBuilder: (context, state) => const CupertinoPage(
              child: TopTradersScreen(),
            ),
          ),
        ]),
  ],
);

class NavigationUtils {
  static void mobileHandleTabTap(BuildContext context, int index) {

    switch (index) {
      case 0:
        context.go(routeNameMap[RouteName.trade]!);
        break;
      case 1:
        context.go(routeNameMap[RouteName.top]!);
        break;
    }
  }
}

enum RouteName {
  trade,
  top,
  currencyPair,
}

Map<RouteName, String> routeNameMap = {
  RouteName.trade: '/',
  RouteName.top: '/top',
  RouteName.currencyPair: 'currencyPair',
};
