import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transactions/blocs/transactions/transactions_bloc.dart';

import '../../screens/screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTabIndex = 0;

  static const _screens = [
    TransactionsScreen(),
    ChartScreen(),
  ];

  void _onSelectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<TransactionsBloc>().add(TransactionsLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _screens[_selectedTabIndex],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedTabIndex,
      onTap: _onSelectTab,
      items: const [
        BottomNavigationBarItem(
          label: 'Transactions',
          icon: Icon(Icons.list_rounded),
        ),
        BottomNavigationBarItem(
          label: 'Chart',
          icon: Icon(Icons.pie_chart),
        ),
      ],
    );
  }
}
