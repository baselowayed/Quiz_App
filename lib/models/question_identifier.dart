import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
 * this Item is responsiible on a single question Identifier 
 * and its syle decoration
 */
class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(this.isCorrect, this.questionIdx, {super.key});

  final bool isCorrect;
  final int questionIdx;

  @override
  Widget build(context) {
    final questionNumber = questionIdx + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isCorrect ? Colors.green : Colors.red,
      ),
      child: Text(
        '$questionNumber',
        style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 7, 0, 14),
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
    );
  }
}
