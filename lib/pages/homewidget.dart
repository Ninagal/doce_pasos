import "package:flutter/material.dart";
import 'home_page.dart';

class MiCasa extends StatelessWidget {
  const MiCasa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.home,
      ),
      tooltip: 'Menu Principal',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
    );
  }
}
