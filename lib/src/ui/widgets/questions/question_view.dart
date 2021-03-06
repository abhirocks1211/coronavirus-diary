import 'package:flutter/material.dart';

import 'package:coronavirus_diary/src/data/models/questions.dart';
import 'question_item.dart';

class QuestionView extends StatefulWidget {
  final List<Question> questions;
  final Color color;
  final EdgeInsetsGeometry padding;
  final Function(Question question, dynamic value) onChange;

  const QuestionView({
    @required this.questions,
    this.color,
    this.padding,
    this.onChange,
  });

  @override
  _QuestionViewState createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  List<Widget> _getQuestions() {
    return widget.questions
        .map((Question question) => QuestionItem(
              question: question,
              onChange: (dynamic value) => widget.onChange(question, value),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: Colors.white),
      child: Container(
        padding: widget.padding,
        color: widget.color ?? Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _getQuestions(),
          ),
        ),
      ),
    );
  }
}
