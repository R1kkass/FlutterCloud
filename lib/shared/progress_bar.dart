import 'package:flutter/material.dart';

class ProgresIndicator extends StatefulWidget {
  final double value;

  const ProgresIndicator({super.key, required this.value});

  @override
  State<ProgresIndicator> createState() => _ProgresIndicatorState();
}

class _ProgresIndicatorState extends State<ProgresIndicator>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 5),
        value: widget.value / 100)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.value = widget.value / 100;
    return Padding(
      padding: const EdgeInsets.only(left: 3.0, right: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 23,
            width: 23,
            child: CircularProgressIndicator(
                strokeWidth: 2, value: controller.value),
          ),
        ],
      ),
    );
  }
}
