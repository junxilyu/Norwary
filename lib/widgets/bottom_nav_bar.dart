import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return BottomNavigationBar(
          currentIndex: appState.selectedIndex,
          onTap: (index) {
            appState.setSelectedIndex(index);
            switch (index) {
              case 0:
                Navigator.pushReplacementNamed(context, '/home');
                break;
              case 1:
                Navigator.pushReplacementNamed(context, '/calendar');
                break;
              case 2:
                Navigator.pushReplacementNamed(context, '/stats');
                break;
              case 3:
                Navigator.pushReplacementNamed(context, '/community');
                break;
            }
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: '日历',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: '统计',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: '社区',
            ),
          ],
        );
      },
    );
  }
} 