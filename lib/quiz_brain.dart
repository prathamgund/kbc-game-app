import 'questions.dart';

class QuizBrain {
   int _currentQuestionNumber = 0;

  final List<Questions> _questionBank = [
    Questions(
      question: "The International 'Literacy Day' is observed on ?",
      option1: "Sep 8",
      option2: "Nov 28",
      option3: "May 2",
      option4: "Sep 22",
      answer: "A", 
    ),
    Questions(
      question: "'September 27' is celebrated every year as ?",
      option1: "Teachers' Day",
      option2: "National Integration Day",
      option3: "World Tourism Day",
      option4: "International Literacy Day",
      answer: "C", 
    ),
    Questions(
      question: "Which of the following is observed as 'Sports Day' every year ?",
      option1: "22nd April",
      option2: "26th  july",
      option3: "29th August",
      option4: "2nd October",
      answer: "C", 
    ),
    Questions(
      question: "'World Health Day' is observed on ?",
      option1: "Apr 7",
      option2: "Mar 6",
      option3: "May 15",
      option4: "Apr 28",
      answer: "A", 
    ),
    Questions(
      question: "'Pongal' is a popular festival of which state ?",
      option1: "Karnataka",
      option2: "Kerala",
      option3: "Tamil Nadu",
      option4: "Andhra Pradesh",
      answer: "C", 
    ),
    Questions(
      question: "'Ghototkach in Mahabharat' was the son of ?",
      option1: "Duryodhana",
      option2: "Arjuna",
      option3: "Yudhishthir",
      option4: "Bhima",
      answer: "D", 
    ),
    Questions(
      question: "The first month of the 'Indian national calendar' is ?",
      option1: "Magha",
      option2: "Chaitra",
      option3: "Ashadha",
      option4: "Vaishakha",
      answer: "B", 
    ),
    Questions(
      question: "Which of the following is not a dance from 'Kerala' ?",
      option1: "Kathakali",
      option2: "Mohiniattam",
      option3: "Ottan Thullal",
      option4: "Yaksha Gana",
      answer: "D", 
    ),
    Questions(
      question: "'Rath Yatra' is famous festival at ?",
      option1: "Ayodhya",
      option2: "Mathura",
      option3: "Dwaraka",
      option4: "Puri",
      answer: "D", 
    ),
    Questions(
      question: "'Meenakshi Temple' is in ?",
      option1: "Puri",
      option2: "Trivandrum",
      option3: "Chennai",
      option4: "Madurai",
      answer: "D", 
    ),
  ];

  List<String> optionNumbers = ['A', 'B', 'C', 'D'];

  Map<String, String> options = {};

  Map<String, String> getAllOptions() {
    Questions currentQuestion = _questionBank[_currentQuestionNumber];
    options[optionNumbers[0]] = currentQuestion.option1;
    options[optionNumbers[1]] = currentQuestion.option2;
    options[optionNumbers[2]] = currentQuestion.option3;
    options[optionNumbers[3]] = currentQuestion.option4;
    return options;
  }

  bool isFinished() {
    if (_currentQuestionNumber >= _questionBank.length -1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _currentQuestionNumber = 0;
  }

  void nextQuestion() {
    if (_currentQuestionNumber < _questionBank.length -1) {
      _currentQuestionNumber++;
    }
  }

  int getListLength() {
    return _questionBank.length;
  }

  String getQuestionText() {
    return _questionBank[_currentQuestionNumber].question;
  }

  String getCorrectAnswer() {
    return _questionBank[_currentQuestionNumber].answer;
  }
}