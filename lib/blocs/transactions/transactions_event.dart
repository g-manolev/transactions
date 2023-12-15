part of 'transactions_bloc.dart';

abstract class TransactionsEvent extends Equatable {}

class TransactionsLoadEvent extends TransactionsEvent {
  @override
  List<Object?> get props => [];
}

class CancelTransactionEvent extends TransactionsEvent {
  final int transactionNumber;

  CancelTransactionEvent({required this.transactionNumber});

  @override
  List<Object?> get props => [transactionNumber];
}
