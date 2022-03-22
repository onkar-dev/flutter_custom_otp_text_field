import 'package:flutter/material.dart';

class OtpText extends StatelessWidget {
  const OtpText({
    Key? key,
    required this.text,
    this.style,
    this.elevation = 2.0,
    this.color,
    this.shape,
  }) : super(key: key);
  final String text;
  final TextStyle? style;
  final double elevation;
  final Color? color;
  final RoundedRectangleBorder? shape;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Card(
        margin: const EdgeInsets.only(right: 8.0),
        elevation: elevation,
        color: color,
        shape: shape,
        child: Center(
          child: Text(
            text,
            style: style,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
