import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  final String text;
  const LinkText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
            decoration: TextDecoration.underline),
      ),
    );
  }
}
