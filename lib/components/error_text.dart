import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildErrorWidget();
  }

  Widget buildErrorWidget() {
    return const Center(
      child: Text(
        'Something went wrong. Please restart app.',
        style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 45,
        ),
      ),
    );
  }
}
