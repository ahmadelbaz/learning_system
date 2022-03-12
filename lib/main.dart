import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_system/screens/add_mcq_problem_screen.dart';
import 'package:learning_system/screens/add_tof_problem_screen.dart';
import 'package:learning_system/screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learning System',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.teal,
        primarySwatch: Colors.teal,
      ),
      themeMode: ThemeMode.dark,
      routes: {
        '/': (ctx) => const HomeScreen(),
        '/add_mcq_problem_screen': (ctx) => const AddMCQProblemScreen(),
        '/add_tof_problem_screen': (ctx) => const AddTOFProblemScreen(),
      },
    );
  }
}
