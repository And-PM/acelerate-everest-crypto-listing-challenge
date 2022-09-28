import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultSubtitle extends StatelessWidget {
  final String message;
  final int strong;

  const DefaultSubtitle(
    this.message, {
    this.strong = 400,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: GoogleFonts.montserrat(
        fontSize: 17,
        color: const Color.fromRGBO(117, 118, 128, 1),
        fontWeight: strong == 600 ? FontWeight.w600 : FontWeight.w400,
      ),
    );
  }
}
