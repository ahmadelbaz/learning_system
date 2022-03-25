import 'package:learning_system/models/problem_model.dart';

class SolveProblem extends Problem {
  String answer;

  SolveProblem(String id, String name, String head, String type,
      int noOfGeneratedProblems, this.answer)
      : super(id, name, head, type, noOfGeneratedProblems);
}
