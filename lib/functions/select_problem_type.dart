import 'package:flutter/material.dart';

import '../models/mcq_problem_model.dart';
import '../models/trueOrFalse_problem_model.dart';
import '../providers/problems_provider.dart';
import 'generate_random_id.dart';

void selectProblemType(
    BuildContext context, ProblemsProvider _problemsProvider) {
  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: const Text('Select Problem type'),
            content: ListView(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    MCQProblem _newProblem = MCQProblem(
                        generateRandomNum(),
                        'Problem #${_problemsProvider.problems.length + 1}',
                        '',
                        'MCQ', []);
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
                        'TOF',
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
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
            ],
          ));
}