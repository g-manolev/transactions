part of 'transactions_bloc.dart';

abstract class TransactionsState extends Equatable {}

class TransactionsInitialState extends TransactionsState {
  @override
  List<Object?> get props => [];
}

class TransactionsLoadingState extends TransactionsState {
  @override
  List<Object?> get props => [];
}

class TransactionsLoadedState extends TransactionsState {
  final List<TransactionModel> transactions;

  TransactionsLoadedState({required this.transactions});

  @override
  List<Object?> get props => [transactions];
}

class TransactionsErrorState extends TransactionsState {
  final String error;

  TransactionsErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
