import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyStyledBody extends StatelessWidget {
  const MyStyledBody(this.text, {super.key,
  this.italicStyle = false,});

  final bool italicStyle;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.shantellSans(
          fontStyle: italicStyle ? FontStyle.italic : FontStyle.normal,
          textStyle: Theme.of(context).textTheme.bodyMedium,
        ));
  }
}

class MyStyledHeadline extends StatelessWidget {
  const MyStyledHeadline(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.shantellSans(
        textStyle: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

class MyStyledTitle extends StatelessWidget {
  const MyStyledTitle(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.shantellSans(
        textStyle: Theme.of(context).textTheme.titleMedium,
      ),
      maxLines: 9,
      overflow: TextOverflow.ellipsis,
    );
  }
}

