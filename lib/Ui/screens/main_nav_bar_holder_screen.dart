import 'package:flutter/material.dart';
import 'package:task_manager/Ui/screens/canceled_task_list_screen.dart';
import 'package:task_manager/Ui/screens/completed_task_list_screen.dart';
import 'package:task_manager/Ui/screens/new_task_list_screen.dart';
import 'package:task_manager/Ui/screens/progress_task_list_screen.dart';

import '../widgets/tm_app_bar.dart';

class MainNavBarHolderScreen extends StatefulWidget {
  const MainNavBarHolderScreen({super.key});
  static const String name = '/main-nav-bar';

  @override
  State<MainNavBarHolderScreen> createState() => _MainNavBarHolderScreenState();
}

class _MainNavBarHolderScreenState extends State<MainNavBarHolderScreen> {
  List<Widget> _screens = [
    NewTaskListScreen(),
    CompletedTaskListScreen(),
    CanceledTaskListScreen(),
    ProgressTaskListScreen()
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),

      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          _selectedIndex = index;
          setState(() {});
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.task), label: 'New task'),
          NavigationDestination(icon: Icon(Icons.done), label: 'Completed'),
          NavigationDestination(icon: Icon(Icons.cancel), label: 'Canceled'),
          NavigationDestination(
            icon: Icon(Icons.replay_circle_filled_outlined),
            label: 'Progress',
          ),
        ],
      ),
    );
  }
}
