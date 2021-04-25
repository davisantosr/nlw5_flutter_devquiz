import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/result/result_page.dart';
import 'package:flutter/material.dart';

import 'package:devquiz/challenge/nextbutton/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  ChallengePage({
    required this.questions,
    required this.title,
  });

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
      setState(() {});
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
      );
  }

  void onSelected(bool value) {
    if (value) {
      controller.correctAnswers++;
    }
    nextPage();
  }

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
                ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                    currentPage: controller.currentPage,
                    length: widget.questions.length,
                  ),
                )
                // BackButton(), <== Short cut to add a back arrow
              ],
            )),
      ),
      body: PageView(
        physics:
            NeverScrollableScrollPhysics(), //Not allowed to change page with gesture
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                  onSelected: onSelected,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        minimum: EdgeInsets.only(bottom: 30),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (value < widget.questions.length)
                        Expanded(
                            child: NextButtonWidget.white(
                          label: 'Pular',
                          onTap: nextPage,
                        )),
                      if (value == widget.questions.length)
                        Expanded(
                            child: NextButtonWidget.green(
                          label: 'Confirmar',
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                    result: controller.correctAnswers,
                                    title: widget.title,
                                    questionsLength: widget.questions.length,
                                  ),
                                ));
                          },
                        )),
                    ],
                  )),
        ),
      ),
    );
  }
}
