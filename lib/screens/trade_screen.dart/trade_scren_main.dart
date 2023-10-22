import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade/app_logic/coins_provider.dart';

import 'package:trade/screens/trade_screen.dart/balance_widget.dart';
import 'package:trade/screens/trade_screen.dart/buy_sell_section.dart';
import 'package:trade/screens/trade_screen.dart/choose_currency_pair.dart';
import 'package:trade/screens/trade_screen.dart/trade_web_view.dart';
import 'package:trade/services/text_modifier/text_modifier_service.dart';
import 'package:trade/widgets/custom_app_bar.dart';
import 'package:trade/appData/app_data.dart';

class TradeScreen extends StatelessWidget {
  const TradeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currency = TextModifierService()
        .removeForwardSlash(context.watch<CoinsProvider>().state.coinsPair);

    return Column(
      children: [
        const CustomAppBar(title: 'Trade'),
        const SizedBox(height: 15),
        const BalanceWidget(),
        const SizedBox(height: 25),
        Expanded(
          child: TradeWebView(
            siteExample: AppData().returnHTMLRequest(currency),
          ),
        ),
        const SizedBox(height: 25),
        const ChooseCoinsPairWidget(),
        const SizedBox(height: 10),
        const BuySellSection(),
        const SizedBox(height: 12),
      ],
    );
  }
}
