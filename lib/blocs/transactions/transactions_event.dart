part of 'transactions_bloc.dart';

abstract class TransactionsEvent extends Equatable {}

class TransactionsLoadEvent extends TransactionsEvent {
  @override
  List<Object?> get props => [];
}
