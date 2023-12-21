import 'package:flutter/material.dart';

class MyCardButton extends StatelessWidget {
  final Function()? onTap;
  final IconData icon;
  final Color color;
  const MyCardButton({super.key, required this.onTap, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Icon(icon)

        ),
      ),
    );
  }
}