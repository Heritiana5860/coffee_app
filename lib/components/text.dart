import 'package:flutter/cupertino.dart';

class MyText extends StatelessWidget {
  const MyText( this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        letterSpacing: 2,
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
