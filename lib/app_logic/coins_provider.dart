import 'package:flutter/material.dart';

class _CoinsProviderState {
  String coinsPair = 'GBP/USD';
  _CoinsProviderState();
}

class CoinsProvider with ChangeNotifier {
  var _state = _CoinsProviderState();

  _CoinsProviderState get state => _state;

  void setCoinsPair(String coins) {
    _state.coinsPair = coins;
    notifyListeners();
  }
}
