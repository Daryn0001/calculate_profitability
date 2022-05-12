import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;

  const Button({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width:  MediaQuery.of(context).size.width * 0.4,
        height:  MediaQuery.of(context).size.width * 0.12,
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          margin: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue,
          ),
          child: Text(text,
              style: const TextStyle(
                fontSize: 18,
                  color: Color(0xFFf4f4f4), fontWeight: FontWeight.w600))),
    );
  }
}