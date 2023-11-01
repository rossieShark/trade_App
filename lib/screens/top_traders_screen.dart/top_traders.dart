// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:trade/appData/app_data.dart';
import 'package:trade/app_logic/app_logic_index.dart';
import 'package:trade/models/models_index.dart';
import 'package:trade/services/services_index.dart';
import 'dart:math';
import 'dart:async';
import 'package:trade/widgets/widgets_index.dart';

class _TradersModelState {
  List<TopTraders> topTraders = AppData().topTraders;
  _TradersModelState();
}

class TradersModel extends ChangeNotifier {
  // ignore: prefer_final_fields
  var _state = _TradersModelState();
  _TradersModelState get state => _state;

  void _updateRandomTraderData() {
    final random = Random();
    final traderIndex = random.nextInt(_state.topTraders.length);
    final trader = _state.topTraders[traderIndex];
    final depositChange = random.nextInt(101) + 50;
    final profitChange = random.nextInt(101) + 50;

    trader.deposit += depositChange;
    trader.profit += profitChange;
    print('data updated ${trader.name}');

    if (_shouldSortTopTraders(trader)) {
      _sortTopTraders();
    }

    notifyListeners();
  }

  bool _shouldSortTopTraders(TopTraders trader) {
    final maxProfit = _state.topTraders.map((t) => t.profit).reduce(max);
    return trader.profit >= maxProfit;
  }

  Future<void> _sortTopTraders() async {
    _state.topTraders.sort((a, b) => b.profit.compareTo(a.profit));
    notifyListeners();
  }

  List<TopTraders> getTopTraders() {
    return _state.topTraders;
  }

  Future<void> dataUpdateTimer() async {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      _updateRandomTraderData();
    });
  }
}

class TopTradersScreen extends StatefulWidget {
  const TopTradersScreen({super.key});

  @override
  State<TopTradersScreen> createState() => _TopTradersScreenState();
}

class _TopTradersScreenState extends State<TopTradersScreen> {
  late List<TopTraders> _topTraders;
  @override
  void initState() {
    super.initState();
    _initialise();
  }

  void _initialise() {
    final tradersProvider = context.read<TradersModel>();
    _topTraders = tradersProvider.getTopTraders();
    tradersProvider.dataUpdateTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(title: 'Топ 10 Traders'),
        const SizedBox(height: 29),
        _TopTradersTable(topTraders: _topTraders),
      ],
    );
  }
}

class _TopTradersTable extends StatelessWidget {
  final List<TopTraders> topTraders;

  const _TopTradersTable({required this.topTraders});

  @override
  Widget build(BuildContext context) {
    final topTradersList = context.read<TradersModel>().state.topTraders;
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.75),
        child: Table(
          columnWidths: const {},
          border: null,
          children: [
            for (int index = 0; index < topTradersList.length + 1; index++)
              TableRow(
                decoration: BoxDecoration(
                  color:
                      index.isEven ? AppColors.blueGrey : AppColors.background,
                ),
                children: [
                  _ItemNumberTableCell(index: index),
                  _CountryTableCell(
                    index: index,
                  ),
                  _NameTableCell(
                    index: index,
                  ),
                  _DepositTableCell(
                    index: index,
                  ),
                  _ProfitTableCell(
                    index: index,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _ProfitTableCell extends StatelessWidget {
  const _ProfitTableCell({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final topTraders = context.watch<TradersModel>().state.topTraders;
    return TableCell(
      child: _TableCellContent(
        text: index == 0 ? 'Profit' : "\$${topTraders[index - 1].profit}",
        index: index,
      ),
    );
  }
}

class _DepositTableCell extends StatelessWidget {
  const _DepositTableCell({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final topTraders = context.watch<TradersModel>().state.topTraders;
    return TableCell(
      child: _TableCellContent(
        text: index == 0 ? 'Deposit' : "\$${topTraders[index - 1].deposit}",
        index: index,
      ),
    );
  }
}

class _NameTableCell extends StatelessWidget {
  const _NameTableCell({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final topTraders = context.watch<TradersModel>().state.topTraders;
    return TableCell(
      child: _TableCellContent(
        text: index == 0 ? 'Name' : topTraders[index - 1].name,
        index: index,
      ),
    );
  }
}

class _CountryTableCell extends StatelessWidget {
  const _CountryTableCell({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final topTraders = context.watch<TradersModel>().state.topTraders;
    return TableCell(
      child: SizedBox(
        height: 50,
        child: Center(
          child: index == 0
              ? Text(
                  'Country',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: AppColors.grey3,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 19.68 / 14,
                    ),
                  ),
                )
              : Image.asset(topTraders[index - 1].country),
        ),
      ),
    );
  }
}

class _ItemNumberTableCell extends StatelessWidget {
  const _ItemNumberTableCell({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: _TableCellContent(
        text: index == 0 ? '№' : '$index',
        index: index,
      ),
    );
  }
}

class _TableCellContent extends StatelessWidget {
  const _TableCellContent({
    required this.text,
    required this.index,
  });

  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: Text(text,
            style: GoogleFonts.inter(
                textStyle: TextStyle(
                    color: index == 0 ? AppColors.grey3 : AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 19.68 / 14))),
      ),
    );
  }
}
