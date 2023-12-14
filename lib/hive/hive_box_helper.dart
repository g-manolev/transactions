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
}
