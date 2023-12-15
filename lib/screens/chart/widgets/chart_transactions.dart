import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:transactions/models/models.dart';

const Color transfersColor = Colors.red;
const Color replenishmentsColor = Colors.green;
const Color withdrawalsColor = Colors.blue;

class ChartTransactions extends StatelessWidget {
  const ChartTransactions({super.key, required this.transactions});

  final List<TransactionModel> transactions;

  @override
  Widget build(BuildContext context) {
    final transfers =
        transactions.where((item) => item.type == TransactionType.transfer);

    final replenishments = transactions
        .where((item) => item.type == TransactionType.replenishment);

    final withdrawals =
        transactions.where((item) => item.type == TransactionType.withdrawal);

    final List<PieChartSectionData> chartData = [
      PieChartSectionData(
        value: transfers.length.toDouble(),
        color: transfersColor,
        title: '${transfers.length}',
      ),
      PieChartSectionData(
        value: replenishments.length.toDouble(),
        color: replenishmentsColor,
        title: '${replenishments.length}',
      ),
      PieChartSectionData(
        value: withdrawals.length.toDouble(),
        color: withdrawalsColor,
        title: '${withdrawals.length}',
      ),
    ];

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width - 32,
            child: PieChart(PieChartData(sections: chartData)),
          ),
          const SizedBox(height: 16),
          _transactionType(
            title: TransactionType.transfer.name,
            color: transfersColor,
          ),
          _transactionType(
            title: TransactionType.withdrawal.name,
            color: withdrawalsColor,
          ),
          _transactionType(
            title: TransactionType.replenishment.name,
            color: replenishmentsColor,
          ),
        ],
      ),
    );
  }

  Widget _transactionType({required String title, required Color color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        children: [
          ColoredBox(
            color: color,
            child: const SizedBox(width: 20, height: 20),
          ),
          const SizedBox(width: 4),
          Text(title),
        ],
      ),
    );
  }
}
