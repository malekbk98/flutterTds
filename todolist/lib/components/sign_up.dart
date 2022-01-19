import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
              'Components SignUp',
            ),
          ],
        ),
      ),
    );
  }
}
