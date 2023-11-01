import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trade/app_logic/app_logic_index.dart';
import 'package:trade/appData/app_data.dart';
import 'package:trade/screens/screens_index.dart';
import 'package:trade/services/services_index.dart';
import 'package:trade/widgets/widgets_index.dart';

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
