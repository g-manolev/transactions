import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 1)
enum TransactionType {
  @HiveField(0)
  replenishment,
  @HiveField(1)
  transfer,
  @HiveField(2)
  withdrawal,
}

@HiveType(typeId: 0, adapterName: 'TransactionAdapter')
class TransactionModel {
  @HiveField(0)
  String createdAt;

  @HiveField(1)
  double amount;

  @HiveField(2)
  double commission;

  @HiveField(3)
  double total;

  @HiveField(4)
  int transactionNumber;

  @HiveField(5)
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
