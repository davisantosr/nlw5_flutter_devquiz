import 'package:flutter/material.dart';

import 'package:devquiz/challenge/nextbutton/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  ChallengePage({
    required this.questions,
  });

  @override
  _ChallengePageState createState() => _ChallengePageState(questions);
}

class _ChallengePageState extends State<ChallengePage> {
  final List<QuestionModel> questions;

  _ChallengePageState(this.questions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                // BackButton(), <== Short cut to add a back arrow
                QuestionIndicatorWidget(),
              ],
            )),
      ),
      body: QuizWidget(
        question: questions[0],
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: NextButtonWidget.white(
                label: 'Pular',
                onTap: () {},
              )),
              SizedBox(
                width: 7,
              ),
              Expanded(
                  child: NextButtonWidget.green(
                label: 'Confirmar',
                onTap: () {},
              )),
            ],
          ),
        ),
      ),
    );
  }
}
