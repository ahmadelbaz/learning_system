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

  final List<MCQProblem> _generatedMcqProblems = [];
  UnmodifiableListView get generatedMcqProblems =>
      UnmodifiableListView(_generatedMcqProblems);

  final List<Problem> _problems = [];
  UnmodifiableListView get problems => UnmodifiableListView(_problems);

  final List<TOFProblem> _tofProblem = [];
  UnmodifiableListView get tofProblems => UnmodifiableListView(_tofProblem);

  void addMCQProblem(MCQProblem problem) {
    _mcqProblems.add(problem);
    _problems.add(problem);
    notifyListeners();
  }

  void addTOFProblem(TOFProblem problem) {
    _tofProblem.add(problem);
    _problems.add(problem);
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

  void editNoOfGeneratedProblems(String id, int number) {
    MCQProblem _thisProblem =
        _mcqProblems.firstWhere((element) => element.id == id);
    int _index = _mcqProblems.indexOf(_thisProblem);
    _mcqProblems[_index].noOfGeneratedProblems = number;
    log('this is numbre = $number');
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
    log(_mcqProblems[_index].choices[0].values.first.toString());
    notifyListeners();
  }

  MCQProblem getProblemById(String id) {
    MCQProblem getProblem =
        _mcqProblems.firstWhere((element) => element.id == id);
    return getProblem;
  }

  void generateMCQProblems(String id) {
    MCQProblem _thisProblem =
        _mcqProblems.firstWhere((element) => element.id == id);
    int _index = _mcqProblems.indexOf(_thisProblem);
    for (int n = 0; n < _mcqProblems[_index].noOfGeneratedProblems; n++) {
      _generatedMcqProblems.add(_thisProblem);
    }
    notifyListeners();
  }

  void shuffleList(String id) {
    MCQProblem _thisProblem =
        _mcqProblems.firstWhere((element) => element.id == id);
    int _index = _mcqProblems.indexOf(_thisProblem);
    _mcqProblems[_index].choices.shuffle();
    // notifyListeners();
  }

  List<Map<dynamic, bool>> shuffledChoice(String id) {
    MCQProblem _thisProblem =
        _mcqProblems.firstWhere((element) => element.id == id);
    int _index = _mcqProblems.indexOf(_thisProblem);
    List<Map<dynamic, bool>> newList = _mcqProblems[_index].choices;
    newList.shuffle();
    return newList;
  }
}
