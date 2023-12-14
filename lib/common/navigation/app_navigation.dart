import 'package:flutter/material.dart';

import '../../screens/screens.dart';
import 'app_route_names.dart';

class AppNavigation {
  final routes = {
    AppRouteNames.auth: (_) => const AuthScreen(),
    AppRouteNames.main: (_) => const MainScreen(),
    AppRouteNames.transactionDetails: (context) {
      final args = ModalRoute.of(context)!.settings.arguments
          as TransactionDetailsScreenArguments;
      return TransactionDetailsScreen(transaction: args.transaction);
    },
  };
}
