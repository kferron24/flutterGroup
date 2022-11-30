class Answer {
  dynamic? value;
  int? questionId;

  Answer(dynamic val, int qID) {
    value = val;
    questionId = qID;
  }

  @override
  String toString() {
    // TODO: implement toString
    return '{$value,$questionId}';
  }
}
