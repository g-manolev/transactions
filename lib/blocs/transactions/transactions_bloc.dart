import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../hive/hive_box_helper.dart';
import '../../models/transaction/transaction_model.dart';

part 'transactions_event.dart';

part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc() : super(TransactionsInitialState()) {
    on<TransactionsLoadEvent>(_getTransactionsList);
  }

  _getTransactionsList(
    TransactionsLoadEvent event,
    Emitter<TransactionsState> emit,
  ) async {
    try {
      emit(TransactionsLoadingState());

      // api request simulation
      await Future.delayed(const Duration(seconds: 1));

      final transactions = HiveBoxHelper.getTransactions();

      emit(TransactionsLoadedState(transactions));
    } catch (e) {
      emit(TransactionsErrorState(e.toString()));
    }
  }
}
