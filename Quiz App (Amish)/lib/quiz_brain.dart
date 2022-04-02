import 'package:flutter/cupertino.dart';
import 'package:final_quiz_app/question.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Code written on Flutter requires Javascript Interpreter',
        ["True", "False"], 2),
    Question("Flutter doesn't support 60fps animations",
        ["True", "False"], 2),
    Question('Flutter is an app development library',
        ["True", "False"], 2),
    Question('Flutter is developed by Facebook',
        ["True", "False"], 2),
    Question('Flutter uses one code base', ["True", "False"], 1),
    Question('Flutter’s engine, written primarily in C++, provides low-level rendering support using Google’s Skia graphics library.',
        ["True", "False"], 1),
    Question('A notable feature of the Dart platform is its support for hot reload',
        ["True", "False"], 1),
    Question(
        'Flutter supports cross platform development',
        ["True", "False"],
        1),
    Question('Flutter is only supported on Windows.',
        ["True", "False"], 2),
    Question('Flutter is Free',
        ["True", "False"], 1)
    // Question('You can lead a cow down stairs but not up stairs.', false),
    // Question('Approximately one quarter of human bones are in the feet.', true),
    // Question('A slug\'s blood is green.', true),
    // Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    // Question('It is illegal to pee in the Ocean in Portugal.', true),
    // Question(
    //     'No piece of square dry paper can be folded in half more than 7 times.',
    //     false),
    // Question(
    //     'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
    //     true),
    // Question(
    //     'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
    //     false),
    // Question(
    //     'The total surface area of two human lungs is approximately 70 square metres.',
    //     true),
    // Question('Google was originally called \"Backrub\".', true),
    // Question(
    //     'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
    //     true),
    // Question(
    //     'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
    //     true),
  ]..shuffle();

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }
  // void initialize_number()

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getQuestionText_index(int index) {
    return _questionBank[index].questionText;
  }

  int get_number() {
    return _questionNumber;
  }

  int getCorrectAnswer() {
    return _questionBank[_questionNumber].index;
  }

  int getCorrectAnswer_index(int index) {
    return _questionBank[index].index;
  }

  List<String> getoptions() {
    return _questionBank[_questionNumber].data;
  }

  List<String> getoptions_index(int index) {
    return _questionBank[index].data;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  List<Widget> getallquestion(List<int> wrongans, int type) {
    List<Widget> temp = [];
    for (int i = 0; i < wrongans.length; i++) {
      int t = wrongans[i];
      if (t != -10) {
        if (i == 0 && type == 0) {
          temp.add(Text(
            "Wrong Answers",
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          ));
        } else if (i == 0 && type == 1) {
          temp.add(Text(
            "Correct Answers",
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          ));
        }
        temp.add(Container(
                color: Colors.amberAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      _questionBank[t].questionText,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Answer: ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _questionBank[t].data[_questionBank[t].index - 1],
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      child: Divider(
                        color: Colors.black,
                        height: 2,
                      ),
                    )
                  ],
                ))
            // new Text(+": "+_questionBank[t].data[_questionBank[t].index-1],style: TextStyle(fontSize: 20,backgroundColor: Colors.black38,color: Colors.white),)

            );
      }
    }
    return temp;
  }

  void reset() {
    _questionNumber = 0;
  }
}

//  void nextQuestion() {
//    if (_questionNumber < _questionBank.length - 1) {
//      _questionNumber++;
//    }
//  }
//
//  String getQuestionText() {
//    return _questionBank[_questionNumber].questionText;
//  }
//
//  bool getCorrectAnswer() {
//    return _questionBank[_questionNumber].questionAnswer;
//  }

//TODO: Step 3 Part A - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.

//TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

//TODO: Step 4 Part B - Create a reset() method here that sets the questionNumber back to 0.
//}
