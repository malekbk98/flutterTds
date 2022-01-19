import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Components SignIn',
            ),
          ],
        ),
      ),
    );
  }
}
