import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trade/appData/app_data.dart';
import 'package:trade/app_logic/coins_provider.dart';
import 'package:trade/resources/resources.dart';
import 'package:trade/screens/trade_screen.dart/trade_scren_main.dart';
import 'package:trade/services/ui_services/app_colors.dart';

import 'package:trade/widgets/custom_app_bar.dart';
import 'package:trade/widgets/custom_container.dart';
import 'package:trade/widgets/page_route_animation.dart';

class CurrencyPairsScreen extends StatelessWidget {
  const CurrencyPairsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          SizedBox(height: 64),
          AppBarWidget(),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 36, 30, 0),
            child: CurrencyPairListView(),
          ),
        ],
      ),
    );
  }
}

class CurrencyPairListView extends StatelessWidget {
  const CurrencyPairListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: AppData().currencyPairs.length ~/ 2,
      itemBuilder: (context, index) {
        final firstPairIndex = index * 2;
        final secondPairIndex = firstPairIndex + 1;

        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              CurrencyPairCard(index: firstPairIndex),
              const SizedBox(width: 21),
              CurrencyPairCard(index: secondPairIndex),
            ],
          ),
        );
      },
    );
  }
}

class CurrencyPairCard extends StatelessWidget {
  const CurrencyPairCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap(context);
        },
        child: CustomContainer(
          padding: EdgeInsets.zero,
          child: Center(
            child: Text(
              AppData().currencyPairs[index],
              style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontFamily: 'SFPro',
                fontSize: 14,
                height: 16.71 / 14,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTap(BuildContext context) {
    context.read<CoinsProvider>().setCoinsPair(AppData().currencyPairs[index]);
    Navigator.of(context).pop();
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 27,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const Center(
            child: CustomAppBar(
              title: 'Currency pair',
              padding: 0,
            ),
          ),
          Positioned(
            left: 10,
            top: 2,
            child: GestureDetector(
              onTap: () {
                onGoToPreviousPageButton(context);
              },
              child: Image.asset(AppImages.arrowLeft),
            ),
          ),
        ],
      ),
    );
  }

  void onGoToPreviousPageButton(BuildContext context) {
    context.pop();
    // Navigator.of(context).pop();
  }
}
