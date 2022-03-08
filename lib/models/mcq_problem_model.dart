import 'package:learning_system/models/problem_model.dart';

class MCQProblem extends Problem {
  List<Map<dynamic, bool>> choices = [];

  MCQProblem(String id, String name, String head, String type, this.choices)
      : super(id, name, head, type);
}
