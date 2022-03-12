import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_system/functions/select_problem_type.dart';
import 'package:learning_system/providers/problems_provider.dart';

// riverpod initiation
final problemsChangeNotifierProvider =
    ChangeNotifierProvider<ProblemsProvider>((ref) => ProblemsProvider());

final normalModeStateProvider = StateProvider<bool>((ref) => true);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // mediaquery for responsive sizes
    final _size = MediaQuery.of(context).size;
    // watching the providers
    final _problemsProvider = ref.watch(problemsChangeNotifierProvider);
    var _normalModeProvider = ref.watch(normalModeStateProvider.state);
    return Scaffold(
      // backgroundColor: kBackgroundColor,
      appBar: AppBar(
        // backgroundColor: kBackgroundColor,
        elevation: 0.0,
        title: const Text('Problems'),
        actions: [
          IconButton(
            onPressed: () {
              _normalModeProvider.state = !_normalModeProvider.state;
              log('${_normalModeProvider.state}');
            },
            icon: Icon(
                _normalModeProvider.state ? Icons.card_travel : Icons.list),
          ),
        ],
      ),
      body: _problemsProvider.problems.isEmpty
          ? const Center(
              child: Text('No Problems Found, Add one'),
            )
          : _normalModeProvider.state
              ? ListView.builder(
                  itemCount: _problemsProvider.problems.length,
                  itemBuilder: (BuildContext context, int index) => ListTile(
                    onTap: () {
                      log('${_problemsProvider.problems[index].type}');
                      if (_problemsProvider.problems[index].type == 'MCQ') {
                        Navigator.of(context).pushNamed(
                            '/add_mcq_problem_screen',
                            arguments: _problemsProvider.problems[index].id);
                      }
                    },
                    title: Text(_problemsProvider.problems[index].name),
                    subtitle: Text(_problemsProvider.problems[index].type),
                  ),
                )
              : ListView.builder(
                  itemCount: _problemsProvider.generatedMcqProblems.length,
                  itemBuilder: (BuildContext context, int index1) {
                    _problemsProvider.shuffleList(
                        _problemsProvider.generatedMcqProblems[index1].id);
                    return ListTile(
                      title: Text(
                          _problemsProvider.generatedMcqProblems[index1].head),
                      subtitle: SizedBox(
                        width: _size.width,
                        height: _size.height * 0.1,
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: _problemsProvider
                              .generatedMcqProblems[index1].choices.length,
                          itemBuilder: (context, index2) {
                            return SizedBox(
                              width: _size.width * 0.4,
                              child: RadioListTile(
                                title: FittedBox(
                                  child: Text(
                                    _problemsProvider
                                        .generatedMcqProblems[index1]
                                        .choices[index2]
                                        .keys
                                        .first,
                                    style: const TextStyle(fontSize: 22),
                                  ),
                                ),
                                value: false,
                                groupValue: true,
                                onChanged: (value) {},
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        child: const Text('+'),
        tooltip: 'Add Problem',
        onPressed: () {
          selectProblemType(context, _problemsProvider);
        },
      ),
    );
  }
}
