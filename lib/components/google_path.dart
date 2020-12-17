import 'package:flutter/material.dart';

class GooglePath extends StatelessWidget {
  final flatButtonText;
  final Function onPressed;
  GooglePath({@required this.flatButtonText, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        flatButtonText,
      ),
    );
  }
}
