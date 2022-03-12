import 'package:learning_system/models/problem_model.dart';

class TOFProblem extends Problem {
  bool isTrue = false;
  TOFProblem(String id, String name, String head, String type,
      int noOfGeneratedProblems, this.isTrue)
      : super(id, name, head, type, noOfGeneratedProblems);
}
