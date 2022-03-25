import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learning_system/constants.dart';
import 'package:learning_system/models/solve_problem_model.dart';

import '../models/mcq_problem_model.dart';
import '../models/trueOrFalse_problem_model.dart';
import '../providers/problems_provider.dart';
import 'generate_random_id.dart';

void selectProblemType(BuildContext context,
    ProblemsProvider _problemsProvider) {
  // mediaquery for responsive sizes
  final _size = MediaQuery
      .of(context)
      .size;
  showDialog(
    context: context,
    builder: (ctx) =>
        AlertDialog(
          title: const Text('Select Problem type'),
          content: SizedBox(
            height: _size.height,
            width: _size.width * 0.8,
            child: ListView(
              children: [
                TextButton(
                  onPressed: () {
                    log('this is problem type : ${problemTypes.solve.name}');
                    Navigator.of(context).pop();
                    SolveProblem _newProblem = SolveProblem(generateRandomNum(),
                        'Problem #${_problemsProvider.problems.length + 1}',
                        '', problemTypes.solve.name, 1, '');
                    _problemsProvider.addSolveProblem(_newProblem);
                    // Navigator.of(context).pushNamed('/add_mcq_problem_screen',
                    //     arguments: _newProblem.id);
                  },
                  child: const Text('Solve'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    MCQProblem _newProblem = MCQProblem(
                        generateRandomNum(),
                        'Problem #${_problemsProvider.problems.length + 1}',
                        '',
                        problemTypes.mcq.name,
                        1, []);
                    _problemsProvider.addMCQProblem(_newProblem);
                    Navigator.of(context).pushNamed('/add_mcq_problem_screen',
                        arguments: _newProblem.id);
                  },
                  child: const Text('MCQ'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    TOFProblem _newProblem = TOFProblem(
                        generateRandomNum(),
                        'Problem #${_problemsProvider.problems.length + 1}',
                        '',
                        problemTypes.tof.name,
                        1,
                        false);
                    _problemsProvider.addTOFProblem(_newProblem);
                    Navigator.of(context).pushNamed('/add_tof_problem_screen',
                        arguments: _newProblem.id);
                  },
                  child: const Text('True Or False'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Answer'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel')),
          ],
        ),
  );
}
