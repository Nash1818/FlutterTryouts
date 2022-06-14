import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int _maxQuestions = 10;
  final String difficultylevel;
  List? questions;
  int _currentQuestionCount = 0;
  int _correctCount = 0;

  BuildContext context;
  GamePageProvider({required this.context, required this.difficultylevel}) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php';
    _getQuestions();
    //print("hello");
  }

  Future<void> _getQuestions() async {
    //print(difficultylevel);
    var _response = await _dio.get(
      '',
      queryParameters: {
        'amount': 10,
        'type': 'boolean',
        'difficulty': difficultylevel
      },
    );
    var _data = jsonDecode(
      _response.toString(),
    );
    //print(_data);
    questions = _data["results"];
    notifyListeners();
  }

  String getCurrentText() {
    return questions![_currentQuestionCount]["question"];
  }

  void answerQuestion(String _answer) async {
    bool isCorrect =
        questions![_currentQuestionCount]["correct_answer"] == _answer;
    _correctCount += isCorrect ? 1 : 0;
    _currentQuestionCount++;
    //print(isCorrect ? "Correct" : "Incorrect");
    showDialog(
      context: context,
      builder: (BuildContext _context) {
        return AlertDialog(
          backgroundColor: isCorrect ? Colors.green : Colors.red,
          title: Icon(isCorrect ? Icons.check_circle : Icons.cancel_sharp),
        );
      },
    );
    //after certain time make the icon disappear...
    await Future.delayed(
      const Duration(seconds: 1),
    );
    Navigator.pop(context);
    if (_currentQuestionCount == _maxQuestions) {
      endgame();
    } else {
      notifyListeners();
    }
  }

  Future<void> endgame() async {
    showDialog(
      context: context,
      builder: (BuildContext _context) {
        return AlertDialog(
          backgroundColor: Colors.blue,
          title: Text(
            "Endgame",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          content: Text("Score: $_correctCount/$_maxQuestions"),
        );
      },
    );
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pop(context);
    Navigator.pop(context);
    //_currentQuestionCount = 0;
  }
}
