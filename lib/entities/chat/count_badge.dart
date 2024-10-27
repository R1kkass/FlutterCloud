import 'package:flutter/material.dart';
import 'package:flutter_application_2/grpc/chat_grpc.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:grpc/grpc.dart';

class CountBadge extends StatefulWidget {
  const CountBadge({super.key});

  @override
  State<CountBadge> createState() => _CountBadgeState();
}

class _CountBadgeState extends State<CountBadge> {
  var count = 0;
  ResponseStream<StreamGetMessagesGeneralResponse>? stream;
  void setCount(StreamGetMessagesGeneralResponse e) {
    setState(() {
      count = e.count;
    });
  }

  @override
  void initState() {
    super.initState();
    stream = ChatGrpc().streamGetMessagesGeneral();
    stream?.listen((e) {
      setCount(e);
    });
  }

  @override
  void dispose() {
    super.dispose();
    stream?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (count == 0) {
      return const Icon(Icons.message);
    }
    return Badge(
      label: Text('$count'),
      backgroundColor: Colors.blueAccent,
      child: const Icon(Icons.message),
    );
  }
}
