import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:transactions/common/navigation/app_route_names.dart';
import 'package:transactions/common/theme/app_theme.dart';
import 'package:transactions/hive/hive_box_helper.dart';
import 'package:transactions/models/models.dart';

import 'blocs/transactions/transactions_bloc.dart';
import 'common/navigation/app_navigation.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  Hive.registerAdapter(TransactionTypeAdapter());
  await HiveBoxHelper.init();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final appNavigation = AppNavigation();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionsBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        routes: appNavigation.routes,
        initialRoute: AppRouteNames.auth,
      ),
    );
  }
}
