import 'package:flutter/material.dart';

import 'model.dart';


class MyQuiz extends StatelessWidget {
  const MyQuiz({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primaryColor: Colors.blue.shade400,
      ),
      home: const QuestionsWidget(),
    );
  }
}

class QuestionsWidget extends StatefulWidget {
  const QuestionsWidget({ Key? key }) : super(key: key);

  @override
  State<QuestionsWidget> createState() => _QuestionsWidgetState();
}

class _QuestionsWidgetState extends State<QuestionsWidget> {
  late PageController _controller;
  int _questionNumber = 1;
  int _score = 0;
  bool _isLocked = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 32.0),
            Text('Question $_questionNumber/${questions.length}'),
            const Divider(thickness: 1, color: Colors.grey,),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: questions.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final question = questions [index];
                  return buildQuestion(question);
                },
              )
            ),
            _isLocked ? buildElevatedButton() : const SizedBox.shrink(),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        if (_questionNumber < questions.length) {
          _controller.nextPage(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInExpo,
          );
          setState(() {
            _questionNumber++;
            // _isLocked not type no problem fatch.
            _isLocked = false;
          });
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ResultPage(score: _score))
          );
        }
      },
      child: Text(
        _questionNumber < questions.length ? 'Next Page' : 'See the Result'
      ),
    );
  }

  Column buildQuestion (Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32.0),
        Text(question.text, style: const TextStyle(fontSize: 25.0),),
        const SizedBox(height: 32.0),
        Expanded(child: OptionWidget(question: question, onClickedOption: (option) {
          if (question.isLocked) {
            return ;
          } else {
            setState(() {
              question.isLocked = true;
              question.selectedOption = option;
            });
            _isLocked = question.isLocked;
            if (question.selectedOption!.isCorrect) {
              _score++;
            }
          }
        },))
      ],
    );
  }
}

class OptionWidget extends StatelessWidget {
  final Question question;
  final ValueChanged <Option> onClickedOption;

  const OptionWidget({
    Key? key,
    required this.question,
    required this.onClickedOption
    }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: question.Options
        .map((option) => buildOption(context, option))
        .toList()
    ),
  );

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, question);
    
    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(option.text, style: const TextStyle(fontSize: 20),),
            getIconForOption(option, question)
          ],
        ),
      ),
    );
  }

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;

    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? Colors.green : Colors.red;
      } else if (option.isCorrect) {
        return Colors.green;
      }
    }
    return Colors.grey.shade300;
  }

  Widget getIconForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? const Icon(Icons.check_circle, color: Colors.green,)
        : const Icon(Icons.cancel, color: Colors.red);
      } else if (option.isCorrect) {
        return const Icon(Icons.check_circle, color: Colors.green,);
      }
    }
    return const SizedBox.shrink();
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({ Key? key, required this.score }) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('You got $score/${questions.length}'
        ),
      ),
    );
  }
}