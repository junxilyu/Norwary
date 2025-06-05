import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/stats_screen.dart';
import 'screens/community_screen.dart';
import 'screens/challenge_detail_screen.dart';
import 'screens/project_detail_screen.dart';
import 'providers/app_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const NorwaryApp(),
    ),
  );
}

class NorwaryApp extends StatelessWidget {
  const NorwaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Norwary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/calendar': (context) => const CalendarScreen(),
        '/stats': (context) => const StatsScreen(),
        '/community': (context) => const CommunityScreen(),
        '/challenge-detail': (context) => const ChallengeDetailScreen(),
        '/project-detail': (context) => const ProjectDetailScreen(),
      },
    );
  }
} 