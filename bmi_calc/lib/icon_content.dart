import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCardContent extends StatelessWidget {
  ReusableCardContent({required this.customIcon, required this.label});

  final String label;
  final IconData customIcon;
  // Icon? customIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          customIcon,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label.toUpperCase(),
          style: labelTextStyle,
        ),
      ],
    );
  }
}
