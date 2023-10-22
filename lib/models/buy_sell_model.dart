class BuySellModel {
  final int investment;
  final int balance;

  BuySellModel({required this.investment, required this.balance});

  BuySellModel copyWith({
    int? investment,
    int? balance
  }) {
    return BuySellModel(
      investment: investment ?? this.investment,
      balance: balance ?? this.balance,
    );
  }
}
