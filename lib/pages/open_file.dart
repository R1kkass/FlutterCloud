import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/file_api.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
import 'package:flutter_application_2/proto/users/users.pb.dart';
import 'package:flutter_application_2/services/encrypt_auth.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

interface class OpenFileArgs {
  final File file;
  OpenFileArgs({required this.file});
}

class Openfile extends StatefulWidget {
  const Openfile({super.key, required this.title});

  final String title;
  @override
  State<Openfile> createState() => _OpenfileState();
}

class _OpenfileState extends State<Openfile> {
  String title = "";
  String key = Hive.box('token').get("password");
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  Widget chilren = const CircularProgressIndicator();

  _asyncMethod() async {
    final args = ModalRoute.of(context)!.settings.arguments as OpenFileArgs?;

    setState(() {
      title = args?.file.fileName ?? widget.title;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as OpenFileArgs?;

    return DefaultScaffold(
        title: title,
        body: Center(
          child: FutureBuilder<Response>(
              future: getFile(args?.file.id.toString(),
                  context), // a previously-obtained Future<String> or null
              builder:
                  (BuildContext context, AsyncSnapshot<Response> snapshot) {
                Widget children = const CircularProgressIndicator();

                String? type = args?.file.fileName.split(".").last;
                var exp = RegExp("txt|jpg");
                var expText = RegExp("txt|js|ts");
                var expImage = RegExp("png|jpg|jpeg");

                if (type.runtimeType == String &&
                    exp.hasMatch(type as String) &&
                    snapshot.data?.statusCode == 200) {
                  if (expText.hasMatch(type)) {
                    children = Text(utf8
                        .decode(crypt(false, snapshot.data!.bodyBytes, key)));
                  } else if (expImage.hasMatch(type) && key != "") {
                    children = Image.memory(
                        crypt(false, snapshot.data!.bodyBytes, key));
                  }
                } else {
                  children = const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.sentiment_dissatisfied, size: 100),
                      Text(
                        "Не возможно открыть файл",
                        style:
                            TextStyle(fontSize: 24, color: Colors.deepOrange),
                      ),
                    ],
                  );
                }

                return children;
              }),
        ));
  }
}
