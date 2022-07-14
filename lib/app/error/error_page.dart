// package imports
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final Object e;
  final StackTrace? trace;
  const ErrorPage(
      this.e,
      this.trace,
      {Key? key}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(e.toString()),
          Text(trace.toString())
        ],
      )
    );
  }
}
