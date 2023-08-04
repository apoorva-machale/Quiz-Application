import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if(resultScore <= 8){
      resultText = 'You are awesome and innocent!';
    }else if(resultScore <= 12){
          resultText = 'Pretty Likeable!';
    }else if(resultScore <= 12){
          resultText = 'Your are.. Strange?!';
    }else{
      resultText = 'You are too different!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Text(
          resultPhrase, 
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: resetHandler, 
            child: Text('Restart Quiz!')
            )
      ],
    ),
    );
  }
}