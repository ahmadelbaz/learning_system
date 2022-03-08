import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learning_system/models/mcq_problem_model.dart';
import 'package:learning_system/models/problem_model.dart';
import 'package:learning_system/models/trueOrFalse_problem_model.dart';

class ProblemsProvider extends ChangeNotifier {
  // all problems we have
  final List<MCQProblem> _mcqProblems = [];
  UnmodifiableListView get mcqProblems => UnmodifiableListView(_mcqProblems);

  final List<Problem> _problems = [];
  UnmodifiableListView get problems => UnmodifiableListView(_problems);

  final List<TOFProblem> _tofProblem = [];
  UnmodifiableListView get tofProblems => UnmodifiableListView(_tofProblem);

  void addMCQProblem(MCQProblem problem) {
    _mcqProblems.add(problem);
    _problems.add(problem);
    log('${_problems.length}');
    notifyListeners();
  }

  void addTOFProblem(TOFProblem problem) {
    _tofProblem.add(problem);
    _problems.add(problem);
    log('${_problems.length}');
    notifyListeners();
  }

  void editName(String id, String name) {
    MCQProblem _thisProblem =
        _mcqProblems.firstWhere((element) => element.id == id);
    int _index = _mcqProblems.indexOf(_thisProblem);
    _mcqProblems[_index].name = name;
    notifyListeners();
  }

  void editHead(String id, String head) {
    MCQProblem _thisProblem =
        _mcqProblems.firstWhere((element) => element.id == id);
    int _index = _mcqProblems.indexOf(_thisProblem);
    _mcqProblems[_index].head = head;
    notifyListeners();
  }

  void addChoice(String id, String choice, bool isTrue) {
    MCQProblem _thisProblem =
        _mcqProblems.firstWhere((element) => element.id == id);
    int _index = _mcqProblems.indexOf(_thisProblem);
    List<Map<dynamic, bool>> newChoices = [];
    newChoices.addAll(_mcqProblems[_index].choices);
    // Map<dynamic, bool> newChoice = {choice, isTrue};
    newChoices.add({choice: isTrue});
    _mcqProblems[_index].choices = newChoices;
    log(_mcqProblems[_index].choices[0].keys.first);
    notifyListeners();
  }

  MCQProblem getProblemById(String id) {
    MCQProblem getProblem =
        _mcqProblems.firstWhere((element) => element.id == id);
    return getProblem;
  }
}
