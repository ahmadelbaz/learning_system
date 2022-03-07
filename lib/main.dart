import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_system/screens/add_problem_screen.dart';
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
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
        '/': (ctx) => const HomeScreen(),
        '/add_problem_screen': (ctx) => const AddProblemScreen(),
      },
    );
  }
}
