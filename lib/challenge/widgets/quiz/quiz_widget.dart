import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          AnswerWidget(
            isRight: true,
            isSelected: true,
            title:
                "Possibilita a criação de aplicativos compilados nativamente.",
          ),
          AnswerWidget(
            isRight: true,
            isSelected: false,
            title:
                "Possibilita a criação de aplicativos compilados nativamente.",
          ),
          AnswerWidget(
            isRight: true,
            isSelected: false,
            title:
                "Possibilita a criação de aplicativos compilados nativamente.",
          ),
          AnswerWidget(
            isRight: true,
            isSelected: false,
            title:
                "Possibilita a criação de aplicativos compilados nativamente.",
          ),
        ],
      ),
    );
  }
}
