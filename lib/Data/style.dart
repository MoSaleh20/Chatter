import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  const PrimaryText({
    required this.text,
    this.color = Colors.black,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.overflow = TextOverflow.fade,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: 'Quicksand',
        fontWeight: fontWeight,
        decoration: TextDecoration.none,
      ),
    );
  }
}

class ThemeBackground extends StatelessWidget {
  var appTheme;
  ThemeBackground(this.appTheme, {super.key});
  @override
  Widget build(BuildContext context) {
    AssetImage darkImage = AssetImage('images/darkBackground.jpg');
    AssetImage lightImage = AssetImage('images/lightBackground.jpg');

    return SizedBox(
      width: double.infinity,
      child: Image(
        fit: BoxFit.cover,
        image: appTheme.currentTheme == ThemeMode.dark ? darkImage : lightImage,
      ),
    );
  }
}

class SecondaryText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  const SecondaryText({
    required this.text,
    this.color = const Color.fromARGB(255, 130, 129, 129),
    this.fontSize = 12,
    this.fontWeight = FontWeight.w300,
    this.overflow = TextOverflow.fade,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: 'Quicksand',
        fontWeight: fontWeight,
        decoration: TextDecoration.none,
      ),
    );
  }
}

class CurvedBackGround extends StatelessWidget {
  var child;
  var color;
  CurvedBackGround({this.child, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: child,
    );
  }
}
