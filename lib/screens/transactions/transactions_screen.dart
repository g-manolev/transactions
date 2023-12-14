import 'package:flutter/material.dart';
import 'package:transactions/screens/transactions/widgets/transaction_list_item.dart';

import '../../models/transaction/transaction.dart';

List<TransactionModel> transactions = [
  TransactionModel(
    createdAt: '2023-12-10 10:22:04Z',
    amount: 1000,
    commission: 5,
    total: 1005,
    transactionNumber: 1822039393,
    type: TransactionType.transfer,
  ),
  TransactionModel(
    createdAt: '2023-12-10 15:49:00Z',
    amount: 470,
    commission: 3,
    total: 473,
    transactionNumber: 1822039459,
    type: TransactionType.withdrawal,
  ),
  TransactionModel(
    createdAt: '2023-12-12 06:30:00Z',
    amount: 800,
    commission: 4,
    total: 804,
    transactionNumber: 1822039643,
    type: TransactionType.replenishment,
  ),
  TransactionModel(
    createdAt: '2023-12-12 10:22:04Z',
    amount: 2750,
    commission: 15,
    total: 2765,
    transactionNumber: 1822039794,
    type: TransactionType.transfer,
  ),
  TransactionModel(
    createdAt: '2023-12-12 15:49:00Z',
    amount: 888,
    commission: 4,
    total: 892,
    transactionNumber: 1822039855,
    type: TransactionType.withdrawal,
  ),
  TransactionModel(
    createdAt: '2023-12-13 06:30:00Z',
    amount: 79,
    commission: 1.3,
    total: 80.3,
    transactionNumber: 1822039878,
    type: TransactionType.replenishment,
  ),
  TransactionModel(
    createdAt: '2023-12-13 10:22:04Z',
    amount: 150,
    commission: 4.5,
    total: 154.5,
    transactionNumber: 1822039901,
    type: TransactionType.transfer,
  ),
  TransactionModel(
    createdAt: '2023-12-13 15:49:00Z',
    amount: 13,
    commission: 0.6,
    total: 13.6,
    transactionNumber: 1822039936,
    type: TransactionType.withdrawal,
  ),
  TransactionModel(
    createdAt: '2023-12-14 06:30:00Z',
    amount: 999,
    commission: 6,
    total: 1005,
    transactionNumber: 1822039999,
    type: TransactionType.replenishment,
  ),
];

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return TransactionListItem(transaction: transactions[index]);
      },
    );
  }
}
