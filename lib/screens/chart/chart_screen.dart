import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/transactions/transactions_bloc.dart';
import 'widgets/chart_transactions.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (context, state) {
        if (state is TransactionsErrorState) {
          return Center(child: Text(state.error));
        }

        if (state is TransactionsLoadedState) {
          return state.transactions.isNotEmpty
              ? ChartTransactions(transactions: state.transactions)
              : const Center(child: Text('No transactions'));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
