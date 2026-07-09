import 'package:flutter/material.dart';
import 'package:TalkSpace/presentation/widgets/scaffold/default_scaffold.dart';

class FormLayout extends StatefulWidget {
  const FormLayout({super.key, required this.child, required this.title});

  final Widget child;
  final String title;

  @override
  State<FormLayout> createState() => _FormLayoutState();
}

class _FormLayoutState extends State<FormLayout> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: widget.title,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 48.0, right: 48.0),
          child: ListView(shrinkWrap: true, children: <Widget>[
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 25,
            ),
            widget.child
          ]),
        ),
      ),
    );
  }
}
