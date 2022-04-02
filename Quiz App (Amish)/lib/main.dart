import 'dart:async';
import 'package:final_quiz_app/welcome.dart';
import 'package:flutter/material.dart';
import 'package:final_quiz_app/retry.dart';
import 'quiz_brain.dart';
import 'dart:ui';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
void main() => runApp(SplashScreen());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: SafeArea(child: QuizPage()

            // Padding(
            //   // padding: EdgeInsets.symmetric(horizontal: 10.0),
            //   child: QuizPage(),
            // ),
            ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // DateTime alert;

  // @override
  // void initState() {
  //   super.initState();
  //   alert = DateTime.now().add(Duration(seconds: 10));
  // }
  QuizBrain quizBrain = QuizBrain();
  String timer = '';
  List<Widget> scoreKeeper = [];
  int correct = 0;
  int wrong = 0;
  // bool change=false;
  // int next_que=-1;
  // int working=0;
  List<int> wrong_answers = [];
  List<int> wrong_answers2 = [];
  List<int> wrong_selected_answers = [];
  List<int> correct_answers = [];
  List<int> selected_answers = [];
  int count = 0;
  List<Widget> _getList(BuildContext context) {
    List<String> options = quizBrain.getoptions();
    // print(options.length);
    List<Widget> temp = [];
    int _value = -1;
    for (var q = 1; q <= options.length; q++) {
      temp.add(ListTile(
              title: Text(
                options[q - 1],
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              leading: Transform.scale(
                scale: 2.0,
                child: Radio(
                  hoverColor: Colors.amberAccent,
                  value: q,
                  groupValue: _value,
                  onChanged: (int value) {
                    checkAnswer(q, context);
                    setState(() {
                      _value = value;
                      selected_answers.add(value);
                      // print()
                      count += 1;
                    });
                  },
                ),
              ))
          // new Container(
          //     padding: EdgeInsets.symmetric(horizontal: 25),
          //     decoration: BoxDecoration(
          //       // shape:  BoxShape.circle,
          //       borderRadius: BorderRadius.circular(80.0),
          //     ),
          //     width: double.infinity,
          //     height: 80,
          //     child:FlatButton(
          //       color: Color(0xFF00E676),
          //       textColor: Colors.white,
          //       child: new Text(options[q-1],style: TextStyle(fontSize: 25),),
          //       onPressed: () {
          //         checkAnswer(q,context);
          //       },
          //     )
          // )

          );
    }
    return temp;
  }

  buttonFunction(id) async {
    var d = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                QuizApp2(id, quizBrain, selected_answers[id])));
    // print(d);
    if (d[0]) {
      setState(() {
        scoreKeeper[d[1]] = Icon(
          Icons.check,
          color: Colors.green,
        );
      });
      correct += 1;
      wrong -= 1;
      print(wrong_answers);
      correct_answers.add(selected_answers[id]);
      int index = wrong_answers.indexWhere(
          (i) => i.toString().contains(wrong_answers2[id].toString()));
      if (index > -1) {
        wrong_answers.removeAt(index);
      }

      // wrong_answers[]
    }
  }

  void checkAnswer(int userPickedAnswer, BuildContext context) {
    int correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        // Alert.alert(context, title: "Hello", content: "this is a alert")
        //     .then((_) => Alert.toast(context, "You just click ok"));
        // Alert(
        //   context: this.context,
        //   title: 'Finshed',
        //   desc: 'You\'ve reached the end of the quiz.\nTrue Answer: $correct \n Wrong Answer: $wrong',
        // ).show();
        if (userPickedAnswer == correctAnswer) {
          correct_answers.add(quizBrain.get_number());
          correct += 1;
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          wrong_answers.add(quizBrain.get_number());
          wrong_selected_answers.add(userPickedAnswer);
          wrong += 1;
          scoreKeeper.add(IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.red,
            ),
            onPressed: () {
              // var data = Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => QuizApp2(count,quizBrain,selected_answers[count])));

              // print("Wrong");
              // setState(() {
              //   quizBrain.change_question(quizBrain.get_number());
              //   print(quizBrain.get_number());
              //   _volume += 10;
              // });
            },
          ));
        }
        // print(wrong);
        // print(correct);
        // quizBrain.reset();
        // quizBrain.shuffle();
        // scoreKeeper = [];
        // showAlert(context);
        timer = 'complete';
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SecondRoute(quizBrain, correct, wrong,
                    correct_answers, wrong_answers, timer)));
      } else {
        wrong_answers2.add(quizBrain.get_number());
        if (userPickedAnswer == correctAnswer) {
          correct_answers.add(quizBrain.get_number());
          correct += 1;
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          wrong_answers.add(quizBrain.get_number());

          scoreKeeper.add(
              // score_wrong(count)
              new FAB(
            id: count,
            onPressed: buttonFunction,
          ));
          wrong += 1;
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // quizBrain.shuffle();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/back3.png"),
          fit: BoxFit.cover,
        ),
      ),
      child:Column(

        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TweenAnimationBuilder<Duration>(
              duration: Duration(minutes: 1),
              tween: Tween(begin: Duration(minutes: 1), end: Duration.zero),
              onEnd: () {
                // print('Timer ended');
                // quizBrain.reset();
                // quizBrain.shuffle();
                // scoreKeeper = [];
                timer = 'time';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondRoute(quizBrain, correct,
                            wrong, correct_answers, wrong_answers, timer)));
              },
              builder: (BuildContext context, Duration value, Widget child) {
                var minutes = value.inMinutes;
                var seconds = value.inSeconds % 60;
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.alarm,
                          color: Colors.red,
                          size: 50,
                        ),
                        Text('$minutes:$seconds',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 50))
                      ],
                    ));
              }),
          Container(
            height: 50,
            width: 150,
            child: AnimatedButton(
              height: 70,
              width: 200,
              text: 'Stop',
              isReverse: true,
              selectedTextColor: Colors.black,
              transitionType: TransitionType.LEFT_TOP_ROUNDER,
              textStyle: GoogleFonts.nunito(
                  fontSize: 28,
                  letterSpacing: 5,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
              onPress: () {

                timer = 'stop';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondRoute(quizBrain, correct,
                            wrong, correct_answers, wrong_answers, timer)));
              },
            ),


          ),

          // RaisedButton(
          //   onPressed: () {},
          //   textColor: Colors.white,
          //   padding: const EdgeInsets.all(0.0),
          //   child: Container(
          //
          //     decoration: const BoxDecoration(
          //       gradient: LinearGradient(
          //         colors: <Color>[
          //           Color(0xFF0D47A1),
          //           Color(0xFF1976D2),
          //           Color(0xFF42A5F5),
          //         ],
          //       ),
          //     ),
          //     padding: const EdgeInsets.all(10.0),
          //     child:
          //     const Text('Stop Quiz', style: TextStyle(fontSize: 20)),
          //   ),
          // ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: PlayAnimation<double>(
                    tween: Tween(begin: 0.0, end: 200.0),
                    duration: const Duration(seconds: 4),
                    curve: Curves.easeOut,
                    builder: (context, child, value)
                    {
                      return Container(

                        color:  Colors.amber.withOpacity(0.8),
                        height: 100,
                        width: 550,
                        child: Center(
                          child: Text(

                            quizBrain.getQuestionText(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              fontSize: 25.0,
                              color: Colors.black,

                            ),

                          ),
                        ),

                      );
                    }
                ),
              ),
            ),
          ),

          Column(
            children: _getList(context),
          ),

          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}

// /*
// question1: 'You can lead a cow down stairs but not up stairs.', false,
// question2: 'Approximately one quarter of human bones are in the feet.', true,
// question3: 'A slug\'s blood is green.', true,
// */
class SecondRoute extends StatelessWidget {
  QuizBrain quizBrain;
  int correct;
  int wrong;
  String timer;
  List<int> wrong_answers;
  List<int> correct_answers;

  // final List<int> selected_answer;
  SecondRoute(this.quizBrain, this.correct, this.wrong, this.correct_answers,
      this.wrong_answers, this.timer,
      {Key key})
      : super(key: key);
  Widget check_timer(bool check) {
    if (timer == 'time' && check == true) {
      return Container(
        child: Text(
          'Time Over',
          style: GoogleFonts.nunito(
              fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      );
    } else if (timer == 'stop' && check == true) {
      return Container(
        child: Text(
          'Quiz Stopped',
          style: GoogleFonts.nunito(
              fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      );
    } else if (timer == 'complete' && check == true) {
      return Container(
        child: Center(
          child: TextLiquidFill(
            text: 'Quiz Complete',
            waveDuration: Duration(seconds: 5),
            waveColor: Colors.amber,
            boxBackgroundColor: Colors.black,
            textStyle: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // child: Text(
        //   'Quiz Completed',
        //   style: GoogleFonts.nunito(
        //       fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        // ),
      );
    } else if (!check && timer != 'complete') {
      return Container(
          child: Column(
        children: <Widget>[
          Text(
            '${10 - (correct + wrong)}',
            style: GoogleFonts.nunito(fontSize: 30, color: Colors.white),
          ),
          Text(
            'Unattempt Question',
            style: GoogleFonts.nunito(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ));
    } else {
      return SizedBox(
        height: 0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("Results"),
        backgroundColor: Colors.yellow.shade700,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => welcome()));
            }),
      ),
      body: Center(

          child: SingleChildScrollView(
              child: Column(
        children: <Widget>[
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                check_timer(true),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '${correct}',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Container(
                      child: Text('${wrong}',
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Text("True  Answers",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      child: Text("Wrong Answers",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                check_timer(false),
                // Container(
                //   child:Text("True  Answers",style: TextStyle(fontSize: 20,color: Colors.white)),
                // ),
                // Container(
                //   child:Text("Unattempt Questions",style: TextStyle(fontSize: 20,color: Colors.white)),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // SingleChildScrollView(
          Column(
            children: quizBrain.getallquestion(wrong_answers, 0),
          ),
          // ),
          // SingleChildScrollView(
          Column(
            children: quizBrain.getallquestion(correct_answers, 1),
          )
          // )
        ],
      ))),
    );
  }
}
// class score_wrong extends StatefulWidget {
//   int counter;//if you have multiple values add here
//   // final List<int> selected_answer;
//   score_wrong(this.counter, {Key key}): super(key: key);
//   @override
//   _PlayButtonState createState() => _PlayButtonState();
// }
// class _PlayButtonState extends State<score_wrong> {
//   IconData icon;
//
//   @override
//   void initState() {
//     icon = Icons.close;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: FlatButton(
//         child: Icon(icon,color: Colors.red,),
//         onPressed: () {
//           print(quizBrain.getQuestionText_index(widget.counter));
//           Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => QuizApp2()));
//         },
//       ),
//     );
//   }
// }

class FAB extends StatelessWidget {
  final int id;
  final Function(int) onPressed;
  // final String buttonText;

  const FAB({this.id, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.red,
        ),
        onPressed: () {
          onPressed(this.id);
        },
      ),
    );
    //   IconButton(
    //
    //   icon: Icon(
    //     Icons.close,
    //     color: Colors.red,
    //
    //   ),
    //   onPressed: () {onPressed(this.id);},
    // );
  }
}
