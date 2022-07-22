import 'package:flutter/material.dart';

class Substance extends StatelessWidget {
  const Substance({
    Key? key,
    required this.height,
    required this.fillingDegree,
    required this.color,
  }) : super(key: key);

  final double height;
  final double fillingDegree;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: EdgeInsets.only(
        top: height * (1 - fillingDegree),
      ),
      duration: const Duration(
        milliseconds: 500,
      ),
      curve: Curves.easeInOut,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(135.0),
            bottomRight: Radius.circular(135.0),
          ),
          color: color,
        ),
      ),
    );
  }
}
