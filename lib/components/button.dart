import 'package:flutter/material.dart';

import '../utils/config.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      required this.width,
      required this.title,
      required this.disable,
      required this.onpressed})
      : super(key: key);

  final double width;
  final String title;
  final bool disable;
  final Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Config.primaryColor,
          foregroundColor: Colors.white,
        ),
          onPressed: disable ? null : onpressed,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}