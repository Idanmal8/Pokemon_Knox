import 'package:flutter/material.dart';

class ErrorMessege extends StatelessWidget {
  final String errorMessege;

  const ErrorMessege({
    required this.errorMessege,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 150,
        height: 150,
        child: Text(errorMessege));
  }
}
