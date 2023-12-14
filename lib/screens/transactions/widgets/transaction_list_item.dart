import 'package:flutter/material.dart';
import 'package:transactions/models/models.dart';

import '../../../common/navigation/app_route_names.dart';
import '../../transaction_details/transaction_details_screen_args.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    super.key,
    required this.transaction,
  });

  final TransactionModel transaction;

  void _onNavigateToTransactionDetails(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRouteNames.transactionDetails,
      arguments: TransactionDetailsScreenArguments(transaction: transaction),
    );
  }

  @override
  Widget build(BuildContext context) {
    final transactionType = transaction.type.name;
    final formattedTransactionType = transactionType.replaceFirst(
      transactionType[0],
      transactionType[0].toUpperCase(),
    );

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => _onNavigateToTransactionDetails(context),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text('№ ${transaction.transactionNumber}'),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formattedTransactionType),
                  Text(
                    '${transaction.amount}\$',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
