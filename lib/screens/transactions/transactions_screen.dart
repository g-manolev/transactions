import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transactions/blocs/transactions/transactions_bloc.dart';
import 'package:transactions/screens/transactions/widgets/transaction_list_item.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (context, state) {
        if (state is TransactionsErrorState) {
          return Center(child: Text(state.error));
        }

        if (state is TransactionsLoadedState) {
          final transactions = state.transactions;

          return transactions.isNotEmpty
              ? ListView.builder(
                  itemCount: state.transactions.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    return TransactionListItem(
                      transaction: state.transactions[index],
                    );
                  },
                )
              : const Center(child: Text('No transactions'));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
