import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/question_identifier.dart';

/*
 * this Item is responsiible on a single raw in the result screen,
 *  including the question Identifier and the question text 
 * and user answer and the correct answer
 */
class SummaryItem extends StatelessWidget {
  const SummaryItem(this.summaryItem, {super.key});

  final Map<String, Object> summaryItem;

  @override
  Widget build(context) {
    final isCorrectAnswer =
        summaryItem['user_answer'] == summaryItem['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            isCorrectAnswer, summaryItem['question_index'] as int),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                summaryItem['question'] as String,
                style: GoogleFonts.lato(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                summaryItem['correct_answer'] as String,
                style: GoogleFonts.lato(
                    fontSize: 18, color: Color.fromARGB(255, 124, 255, 200)),
              ),
              // const SizedBox(height: 5,),
              Text(
                summaryItem['user_answer'] as String,
                style: GoogleFonts.lato(
                    fontSize: 18, color: Color.fromARGB(255, 255, 97, 103)),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
