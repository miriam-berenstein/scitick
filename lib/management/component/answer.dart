import 'package:flutter/material.dart';
import '../../components/true_false_button.dart';
import '../../models/answer.dart';
import '../../models/random_options.dart';
import 'steps_input.dart';
import 'text_filed.dart';

class AnswerSelect extends StatefulWidget {
  final List<Answer> initialAnswers;
  final ValueChanged<List<Answer>> onAnswersChanged;

  const AnswerSelect({super.key, required this.initialAnswers, required this.onAnswersChanged});

  @override
  _AnswerSelectState createState() => _AnswerSelectState();
}

class _AnswerSelectState extends State<AnswerSelect> {
  late List<TextEditingController> _controllers;
  late List<TextEditingController> _classificationControllers;
  late List<Answer> _answers;

  @override
  void initState() {
    super.initState();
    _answers = widget.initialAnswers;
    _controllers = _answers
        .map((answer) => TextEditingController(text: answer.answer))
        .toList();
    _classificationControllers =
        _answers.map((answer) => TextEditingController()).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var controller in _classificationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addAnswer() {
    setState(() {
      if (_answers.length < 5) {
        _answers.add(Answer(
          answer: '',
          classification: false,
          step: StratEnd(start: 0, end: 0),
          qeyWord: '',
        ));
        _controllers.add(TextEditingController());
        _classificationControllers.add(TextEditingController());
        _notifyAnswersChanged();
      }
    });
  }

  void _removeAnswer(int index) {
    setState(() {
      if (_answers.length > 1) {
        _answers.removeAt(index);
        _controllers[index].dispose();
        _controllers.removeAt(index);
        _classificationControllers[index].dispose();
        _classificationControllers.removeAt(index);
        _notifyAnswersChanged();
      }
    });
  }

  void _notifyAnswersChanged() {
    widget.onAnswersChanged(_answers);
  }

  Widget _answerWidget(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        key: ValueKey(index),
        children: [
          IconButton(
            icon: const Icon(Icons.remove_circle, color: Colors.red),
            onPressed: () => _removeAnswer(index),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GenericTextInput(
                  hintText: "תוכן התשובה",
                  controller: _controllers[index],
                ),
                SizedBox(
                  height: 20,
                ),
                TrueOrFalseButton(
                  isTrue: true,
                  onTap: () {
                    SetState(value) =>
                        _classificationControllers[index] = value;
                  },
                ),
                StepsInput(
                  onStartNumberChanged: (int value) {
                    setState(() {
                      _answers[index] = Answer(
                        answer: _answers[index].answer,
                        classification: _answers[index].classification,
                        step: StratEnd(
                            start: value, end: _answers[index].step.end),
                        qeyWord: '',
                      );
                      _notifyAnswersChanged();
                    });
                  },
                  onEndNumberChanged: (int value) {
                    setState(() {
                      _answers[index] = Answer(
                        answer: _answers[index].answer,
                        classification: _answers[index].classification,
                        step: StratEnd(
                            start: _answers[index].step.start, end: value),
                        qeyWord: '',
                      );
                      _notifyAnswersChanged();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: _answers.length,
          itemBuilder: (context, index) {
            return _answerWidget(index);
          },
        ),
        ElevatedButton(
          onPressed: _addAnswer,
          child: const Text("הוסף תשובה"),
        ),
      ],
    );
  }
}