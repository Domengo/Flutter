import 'package:flutter/material.dart';

class StarButton extends StatelessWidget {
  const StarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.star),
      onPressed: () {
        // Handle the button's onPressed event here
        print('Star button pressed');
      },
    );
  }
}