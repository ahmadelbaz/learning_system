class Problem {
  String id = '';
  String name = '';
  String head = '';
  List<String> choices = [];
  List<String> images = [];

  Problem(this.id, this.name,
      {this.head = '', this.choices = const [], this.images = const []});
}
