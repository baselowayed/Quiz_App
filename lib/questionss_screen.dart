import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuistionsScreen extends StatefulWidget {
  const QuistionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer, int pos) onSelectAnswer;

  @override
  State<QuistionsScreen> createState() {
    return _QuistionsScreenState();
  }
}

class _QuistionsScreenState extends State<QuistionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer, currentQuestionIndex);
    setState(() {
      currentQuestionIndex++; // ++ +=
    });
  }

  void previouQuestion() {
    if (currentQuestionIndex <= 0) return;
    setState(() {
      currentQuestionIndex--;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: const EdgeInsets.all(45),
      child: Center(
        // or wrap it with sized box with width: double.infinity
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 211, 161, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              // style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                // onTap: answerQuestion, we are trying to add an argment
                onTap: () {
                  //ElevatedButton expects only a 0 argument function to solve this we nest it inside
                  answerQuestion(answer);
                },
              );
            }),
            const SizedBox(
              height: 70,
            ),
            Row(children: [
              ElevatedButton.icon(
                onPressed: previouQuestion,
                style: ElevatedButton.styleFrom(
                  // alignment: const  Alignment(50, 0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                icon: const Icon(Icons.arrow_back),
                label: const Text(
                  'Previous',
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
            // AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
            // AnswerButton(answerText: currentQuestion.answers[1], onTap: () {}),
            // AnswerButton(answerText: currentQuestion.answers[2], onTap: () {}),
            // AnswerButton(answerText: currentQuestion.answers[3], onTap: () {}),
          ],
        ),
      ),
    );
  }
}
