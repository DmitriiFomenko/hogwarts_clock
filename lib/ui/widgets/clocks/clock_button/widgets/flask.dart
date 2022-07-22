import 'package:flutter/material.dart';
import 'package:hogwarts_clock/ui/widgets/clocks/clock_button/widgets/substance.dart';
import 'package:hogwarts_clock/utils/constants/clock_colors.dart';

class Flask extends StatelessWidget {
  const Flask({
    Key? key,
    required this.height,
    required this.width,
    required this.substance,
  }) : super(key: key);

  final double height;
  final double width;
  final Substance? substance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(135.0),
          bottomRight: Radius.circular(135.0),
        ),
        color: ClockColors.grey,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Opacity(
          opacity: 0.6,
          child: substance,
        ),
      ),
    );
  }
}
