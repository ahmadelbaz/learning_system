import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_system/functions/generate_random_id.dart';
import 'package:learning_system/models/problem_model.dart';
import 'package:learning_system/providers/problems_provider.dart';

import '../constants.dart';

// riverpod initiation
final problemsChangeNotifierProvider =
    ChangeNotifierProvider<ProblemsProvider>((ref) => ProblemsProvider());

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // mediaquery for responsive sizes
    final _size = MediaQuery.of(context).size;
    // watching the providers
    final _problemsProvider = ref.watch(problemsChangeNotifierProvider);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: _problemsProvider.problems.isEmpty
          ? const Center(
              child: Text('No Problems Found, Add one'),
            )
          : ListView.builder(
              itemCount: _problemsProvider.problems.length,
              itemBuilder: (BuildContext context, int index) => ListTile(
                title: Text(_problemsProvider.problems[index].name),
                subtitle: Text(_problemsProvider.problems[index].id),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Text('+'),
        tooltip: 'Add Problem',
        onPressed: () {
          Problem _newProblem = Problem(generateRandomNum(), '');
          _problemsProvider.addProblem(_newProblem);
          Navigator.of(context)
              .pushNamed('/add_problem_screen', arguments: _newProblem.id);
        },
      ),
    );
  }
}
