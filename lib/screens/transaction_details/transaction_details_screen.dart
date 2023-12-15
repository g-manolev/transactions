import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transactions/blocs/transactions/transactions_bloc.dart';
import 'package:transactions/screens/transaction_details/widgets/transaction_details_card.dart';

import '../../models/transaction/transaction_model.dart';

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({super.key, required this.transaction});

  final TransactionModel transaction;

  void _onCancelTransaction(BuildContext context) {
    context.read<TransactionsBloc>().add(CancelTransactionEvent(
          transactionNumber: transaction.transactionNumber,
        ));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.3),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Text('№ ${transaction.transactionNumber}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TransactionDetailsCard(transaction: transaction),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _onCancelTransaction(context),
              child: const Text('Cancel transaction'),
            )
          ],
        ),
      ),
    );
  }
}
