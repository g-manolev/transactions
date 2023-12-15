import 'package:hive/hive.dart';
import 'package:transactions/mocks/mock_transactions_list.dart';
import 'package:transactions/models/models.dart';

abstract class HiveKeys {
  static const transactionsBox = 'transactions_box';
  static const transactionsList = 'transactions_list';
}

class HiveBoxHelper {
  static Future<void> init() async {
    final transactionsBox = await Hive.openBox(HiveKeys.transactionsBox);
    await transactionsBox.put(
      HiveKeys.transactionsList,
      mockTransactionsList,
    );
  }

  static List<TransactionModel> getTransactions() {
    final transactionsBox = Hive.box(HiveKeys.transactionsBox);

    return transactionsBox.get(HiveKeys.transactionsList);
  }

  static Future<void> cancelTransaction(
    int transactionNumber,
  ) async {
    final transactionsBox = Hive.box(HiveKeys.transactionsBox);

    final List<TransactionModel> transactionsList =
        transactionsBox.get(HiveKeys.transactionsList);

    transactionsList.removeWhere(
        (transaction) => transaction.transactionNumber == transactionNumber);

    await transactionsBox.put(HiveKeys.transactionsBox, transactionsList);
  }
}
