import 'package:flutter/material.dart';
import 'package:runningman_app/models/table.dart';
import 'package:runningman_app/models/description.dart';
import 'package:runningman_app/models/sentence.dart';
import 'package:runningman_app/models/grammar_example_sentences.dart';
import 'package:runningman_app/models/conversation.dart';

class Grammar5 extends StatelessWidget {    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('時間')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
            LatexStyleTable(tableData: '''
            시간 & 時間 //
            시간 & 時間 
            '''),
        ]),
      ),
    );
  }
}