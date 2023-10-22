class TextModifierService {
  String removeForwardSlash(String currencyPair) {
    return currencyPair.replaceAll('/', '');
  }
}
