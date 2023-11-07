import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({super.key, required this.choseQuizMode});

  final void Function() choseQuizMode;

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose Mode:',
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: choseQuizMode,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Text(
                  'Quiz Mode',
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Text(
                  'Practice Mode',
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
