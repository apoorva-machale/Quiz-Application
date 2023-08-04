import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  final _questions = const [
      {'questionText':'What\'s your favourite colour?', 
      'answers': [
        {'text':'Black', 'score': 10},
        {'text':'Red', 'score': 5},
        {'text':'Green', 'score': 3},
        {'text':'White', 'score': 1}],
      },
      {'questionText':'What\'s your favourite animal?', 
      'answers': [
        {'text':'Rabbit', 'score': 10},
        {'text':'Cat', 'score': 5},
        {'text':'Dog', 'score': 3},
        {'text':'Lion', 'score': 1}],
      },
      {'questionText':'What\'s your favourite instructor?', 
      'answers': [
        {'text':'Max', 'score': 1},
        {'text':'Max', 'score': 1},
        {'text':'Max', 'score': 1},
        {'text':'Max', 'score': 1}
      ],
      },
    ];
      
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
    
  }

  void _answerQuestion(int score){
    _totalScore += score;
    if(_questionIndex < _questions.length){
      print('We have more questions!');
    }else{
      print('No more questions!');
    }

    setState(() {
      _questionIndex = _questionIndex + 1;
      print(_questionIndex);
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: _questionIndex < _questions.length ? 
      Quiz(
        answerQuestion: _answerQuestion, 
        questionIndex: _questionIndex,
        questions: _questions,
        ) : Result(_totalScore, _resetQuiz),
    ),
    );
  }
}