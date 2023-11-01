import 'package:flutter/material.dart';

class _CoinsProviderState {
  String coinsPair = 'GBP/USD';
  _CoinsProviderState();
}

class CoinsProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  var _state = _CoinsProviderState();

  // ignore: library_private_types_in_public_api
  _CoinsProviderState get state => _state;

  void setCoinsPair(String coins) {
    _state.coinsPair = coins;
    notifyListeners();
  }
}
