import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:learning_system/models/problem_model.dart';

class ProblemsProvider extends ChangeNotifier {
  // all problems we have
  final List<Problem> _problems = [];

  UnmodifiableListView get problems => UnmodifiableListView(_problems);

  // List<Problem> getProblems() => _problems;

  void addProblem(Problem problem) {
    _problems.add(problem);
    notifyListeners();
  }

  void editName(String id, String name) {
    Problem _thisProblem = _problems.firstWhere((element) => element.id == id);
    int _index = _problems.indexOf(_thisProblem);
    _problems[_index].name = name;
    notifyListeners();
  }

  void editHead(String id, String head) {
    Problem _thisProblem = _problems.firstWhere((element) => element.id == id);
    int _index = _problems.indexOf(_thisProblem);
    _problems[_index].head = head;
    notifyListeners();
  }

  Problem getProblemById(String id) {
    Problem getProblem = _problems.firstWhere((element) => element.id == id);
    return getProblem;
  }
}
