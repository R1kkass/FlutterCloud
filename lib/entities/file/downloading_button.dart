import 'package:flutter/material.dart';
import 'package:flutter_application_2/shared/progress_bar.dart';

class DownloadingButton extends StatefulWidget {
  final double value;
  final void Function() fn;

  const DownloadingButton({super.key, required this.value, required this.fn});

  @override
  State<DownloadingButton> createState() => _DownloadingButtonState();
}

class _DownloadingButtonState extends State<DownloadingButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 12, right: 5),
        child: Row(
          children: [
            ProgresIndicator(
              value: widget.value,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              "Скачивание...",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepOrange.shade800,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            SizedBox(
                child: TextButton(
                    onPressed: () {
                      widget.fn();
                    },
                    child: const Text("Отменить")))
          ],
        ),
      );
  }
}