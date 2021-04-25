import 'package:devquiz/challenge/nextbutton/next_button_widget.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String title;

  ResultPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text('Parabéns!', style: AppTextStyles.heading40),
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                    TextSpan(
                        text: "Você concluiu",
                        style: AppTextStyles.body,
                        children: [
                          TextSpan(
                              text: '\n$title', style: AppTextStyles.bodyBold),
                          TextSpan(text: '\ncom 6 de 10 acertos.'),
                        ]),
                    textAlign: TextAlign.center),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purple(
                          label: 'Compartilhar',
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 26,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.white(
                          label: 'Voltar ao Início',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
