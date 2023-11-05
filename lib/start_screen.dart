import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScre, {super.key});

  final void Function() switchScre;

  @override
  Widget build(context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 320,
          color: const Color.fromARGB(126, 255, 255, 255),
        ),
        // Opacity(
        //     opacity: 0.5,
        //     child: Image.asset('assets/images/quiz-logo.png', width: 320)),
        const SizedBox(
          height: 40,
        ),
        Text(
          'Learn Flutter the fun way!',
          // style: TextStyle(color: Colors.white, fontSize: 28),
          style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 211, 161, 255), fontSize: 24),
        ),
        const SizedBox(height: 30),
        // OutlinedButton(
        //     onPressed: () {},
        //     style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
        //     child: const Text('Start Quiz'))
        OutlinedButton.icon(
            onPressed: switchScre,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'))
      ]),
    );
  }
}
