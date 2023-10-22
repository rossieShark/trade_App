import 'dart:math';

import 'package:intl/intl.dart';
import 'package:trade/models/buy_sell_model.dart';

class BuySellService {
  var _model = BuySellModel(investment: 1000, balance: 10000);
  BuySellModel get model => _model;

  void onIncrementButtonPressed() {
    _model = model.copyWith(investment: model.investment + 1);
  }

  void onDecrementButtonPressed() {
    _model = model.copyWith(investment: max(model.investment - 1, 0));
  }

  void addToBalance() {
    _model = model.copyWith(balance: model.balance + model.investment);
  }

  void minusBalance() {
    _model = model.copyWith(balance: model.balance - model.investment);
  }

  void onValueChanged(String value) {
    _model = model.copyWith(investment: int.parse(value));
  }

  String formatNumber() {
    final formatter = NumberFormat('#,###');
    return formatter.format(model.investment);
    // Return the original input if it's not a valid number.
  }

  String formatBalance() {
    final formatter = NumberFormat('###,###');
    return formatter.format(model.balance);
  }
}