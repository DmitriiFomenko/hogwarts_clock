import 'package:flutter/material.dart';
import 'package:hogwarts_clock/ui/widgets/clocks/clock_button/widgets/flask.dart';
import 'package:hogwarts_clock/ui/widgets/clocks/clock_button/widgets/substance.dart';

class ClockButton extends StatelessWidget {
  const ClockButton({
    Key? key,
    required this.fillingDegree,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  final double fillingDegree;
  final Color color;
  final VoidCallback onPressed;
  final double height = 300;
  final double width = 50;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Flask(
        height: height,
        width: width,
        substance: Substance(
          height: height,
          fillingDegree: fillingDegree,
          color: color,
        ),
      ),
    );
  }
}
