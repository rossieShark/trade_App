import 'package:flutter/material.dart';
import 'package:trade/app_logic/app_logic_index.dart';
import 'package:trade/services/services_index.dart';

import 'package:trade/widgets/widgets_index.dart';

class BuySellSection extends StatelessWidget {
  const BuySellSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(children: [
        const Row(
          children: [
            _TimerWidgwrt(),
            SizedBox(width: 10),
            _InvestmentWidget(),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            BuySellButton(
              text: 'Buy',
              color: AppColors.green,
              onButtonTap: () => _onBuySellButtonTap(context, true),
            ),
            const SizedBox(width: 10),
            BuySellButton(
              text: 'Sell',
              color: AppColors.red2,
              onButtonTap: () => _onBuySellButtonTap(context, false),
            ),
          ],
        ),
      ]),
    );
  }

  void _onBuySellButtonTap(BuildContext context, bool isBuy) {
    final viewModel = context.read<BuySellProvider>();
    final timerProvider = context.read<TimerProvider>();
    final action = isBuy ? 'buy' : 'sell';
    final message = 'The $action was a success';
    final investment = isBuy ? 'buy' : 'sale';

    timerProvider.onSellButtonTapped(() {
      AlertDialogWidget().showAlertDialog(
          context, message, 'You $investment ${viewModel.state.investment}');
      if (isBuy) {
        viewModel.minusBalance();
      } else {
        viewModel.addToBalance();
      }
    });
  }
}

class BuySellButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onButtonTap;

  const BuySellButton({
    super.key,
    required this.text,
    required this.color,
    required this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButtons(
      color: color,
      text: text,
      onTap: () {
        onButtonTap();
      },
    );
  }
}

class _InvestmentWidget extends StatelessWidget {
  const _InvestmentWidget();

  @override
  Widget build(BuildContext context) {
    return Consumer<BuySellProvider>(
      builder: (context, viewModel, child) {
        final investmentValue = viewModel.state.investment;
        return CustomManageButtons(
          text: 'Investment',
          minusOnTap: () {
            viewModel.onDecrementButtonPressed();
          },
          addOnTap: () {
            viewModel.onIncrementButtonPressed();
            print(investmentValue);
          },
          mask: '0,000',
          controllerText: viewModel.formatNumber(),
        );
      },
    );
  }
}

class _TimerWidgwrt extends StatelessWidget {
  const _TimerWidgwrt();

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(builder: (context, timerProvider, child) {
      return CustomManageButtons(
          text: 'Timer',
          minusOnTap: () {
            timerProvider.onDecrementButtonPressed();
          },
          addOnTap: () {
            timerProvider.onIncrementButtonPressed();
          },
          mask: '00:00',
          controllerText: timerProvider.formattedTime);
    });
  }
}
