import 'package:flutter/material.dart';
import 'package:trade/app_logic/app_logic_index.dart';
import 'package:trade/resources/resources.dart';
import 'package:trade/services/services_index.dart';
import 'package:trade/widgets/widgets_index.dart';

class ChooseCoinsPairWidget extends StatelessWidget {
  const ChooseCoinsPairWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomContainer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          _CurrencyPairTitle(),
          Positioned(
            right: 10,
            top: 15,
            child: _ArrowIconWidget(),
          ),
        ],
      ),
    );
  }
}

class _CurrencyPairTitle extends StatelessWidget {
  const _CurrencyPairTitle();

  @override
  Widget build(BuildContext context) {
    final coinsPair = context.watch<CoinsProvider>().state.coinsPair;
    return Center(
      child: Text(
        coinsPair,
        style: const TextStyle(
          color: AppColors.white,
          fontFamily: 'SFPro',
          fontWeight: FontWeight.w600,
          fontSize: 16,
          height: 19.09 / 16,
        ),
      ),
    );
  }
}

class _ArrowIconWidget extends StatelessWidget {
  const _ArrowIconWidget();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go('/${routeNameMap[RouteName.currencyPair]!}');
      },
      child: Image.asset(
        width: 24,
        height: 24,
        AppImages.arrowRight,
      ),
    );
  }
}
