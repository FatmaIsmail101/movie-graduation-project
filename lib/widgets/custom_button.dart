import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, required this.size});

  final String text;
  double size;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xffF6BD00),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: size, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
