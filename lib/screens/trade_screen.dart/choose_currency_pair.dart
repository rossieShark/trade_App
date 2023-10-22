import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade/app_logic/coins_provider.dart';
import 'package:trade/screens/currency_pair_screen.dart/currency_pair.dart';
import 'package:trade/resources/resources.dart';
import 'package:trade/services/ui_services/app_colors.dart';
import 'package:trade/widgets/custom_container.dart';
import 'package:trade/widgets/page_route_animation.dart';

class ChooseCoinsPairWidget extends StatelessWidget {
  const ChooseCoinsPairWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final coinsPair = context.watch<CoinsProvider>().coinsPait;
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
        Navigator.of(context).push(
          PageRouteAnimation(page: const CurrencyPairsScreen())
              .createPageRoute(),
        );
      },
      child: Image.asset(
        width: 24,
        height: 24,
        AppImages.arrowRight,
      ),
    );
  }
}
