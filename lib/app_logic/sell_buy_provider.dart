// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:trade/services/services_index.dart';

class _BuySellProviderState {
  int investment;
  int balance;
  _BuySellProviderState({
    required this.investment,
    required this.balance,
  });
}

class BuySellProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  var _state = _BuySellProviderState(investment: 1000, balance: 10000);
  // ignore: library_private_types_in_public_api
  _BuySellProviderState get state => _state;
  final _buySellService = BuySellService();

  Future<void> onIncrementButtonPressed() async {
    _buySellService.onIncrementButtonPressed();
    _updateState();
  }

  Future<void> onDecrementButtonPressed() async {
    _buySellService.onDecrementButtonPressed();
    _updateState();
  }

  void addToBalance() {
    _buySellService.addToBalance();
    _updateState();
  }

  void minusBalance() {
    _buySellService.minusBalance();
    _updateState();
  }

  Future<void> onValueChanged(String value) async {
    _buySellService.onValueChanged(value);
    _updateState();
  }

  String formatNumber() {
    return _buySellService.formatNumber();
  }

  String formatBalance() {
    return _buySellService.formatBalance();
  }

  void _updateState() {
    final model = _buySellService.model;
    _state = _BuySellProviderState(
      investment: model.investment,
      balance: model.balance,
    );
    notifyListeners();
  }
}
