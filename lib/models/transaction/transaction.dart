enum TransactionType {
  replenishment,
  transfer,
  withdrawal,
}

class TransactionModel {
  String createdAt;
  double amount;
  double commission;
  double total;
  int transactionNumber;
  TransactionType type;

  TransactionModel({
    required this.createdAt,
    required this.amount,
    required this.commission,
    required this.total,
    required this.transactionNumber,
    required this.type,
  });
}
