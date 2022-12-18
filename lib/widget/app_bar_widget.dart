import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    required Key key,
    required this.title,
  }) : super(key: key);

  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title),
    );
  }
}
