import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  int _selectedIndex = 0;
  bool _isDarkMode = false;

  int get selectedIndex => _selectedIndex;
  bool get isDarkMode => _isDarkMode;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
} 