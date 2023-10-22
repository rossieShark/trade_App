import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class _BuySellProviderState {
  int investment = 1000;
  int balance = 10000;
  _BuySellProviderState();
}

class BuySellProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  var _state = _BuySellProviderState();
  // ignore: library_private_types_in_public_api
  _BuySellProviderState get state => _state;

  Future<void> onIncrementButtonPressed() async {
    _state.investment += 1000;
    notifyListeners();
  }

  Future<void> onDecrementButtonPressed() async {
    _state.investment -= 1000;
    notifyListeners();
  }

  void addToBalance() {
    _state.balance += _state.investment;
    notifyListeners();
  }

  void minusBalance() {
    _state.balance -= _state.investment;
    notifyListeners();
  }

  Future<void> onValueChanged(String value) async {
    final investment = int.parse(value);
    _state.investment = investment;
    notifyListeners();
  }

  String formatNumber() {
    final formatter = NumberFormat('#,###');
    return formatter.format(_state.investment);
    // Return the original input if it's not a valid number.
  }

  String formatBalance() {
    final formatter = NumberFormat('###,###');
    return formatter.format(_state.balance);
  }
}
