// class Question {
//   late List<String> questionText = [];
//   late List<bool> questionAnswer = [];

//   Question(List<String> q, List<bool> a) {
//     questionText = q;
//     questionAnswer = a;
//   }
// }

class Question {
  late String questionText;
  late bool questionAnswer;

  Question(this.questionText, this.questionAnswer);
  // the code below is equal to 'this' keyword syntax line of code above
  // Question(String q, bool a) {
  // questionText = q;
  // questionAnswer = a;
  // }
}
