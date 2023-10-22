import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trade/app_logic/sell_buy_provider.dart';
import 'package:trade/services/ui_services/app_colors.dart';
import 'package:trade/widgets/custom_container.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: MediaQuery.of(context).size.width,
      child: const Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _BalanceTitle(),
            SizedBox(
              height: 7,
            ),
            _BalanceValue()
          ]),
    );
  }
}

class _BalanceTitle extends StatelessWidget {
  const _BalanceTitle();

  @override
  Widget build(BuildContext context) {
    return Text('Balance',
        style: GoogleFonts.inter(
            textStyle: const TextStyle(
                color: AppColors.grey2,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                height: 14.52 / 12)));
  }
}

class _BalanceValue extends StatelessWidget {
  const _BalanceValue();

  @override
  Widget build(BuildContext context) {
    return Consumer<BuySellProvider>(builder: (context, viewModel, child) {
      return Text(viewModel.formatBalance(),
          style: const TextStyle(
              color: AppColors.white,
              fontFamily: 'SFPro',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 19.09 / 16));
    });
  }
}
