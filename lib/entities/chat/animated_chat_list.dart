import 'package:flutter/material.dart';
import 'package:flutter_application_2/cubit/upload_file_bloc.dart';
import 'package:flutter_application_2/features/chat/message.dart';
import 'package:flutter_application_2/features/chat/message_upload_file.dart';
import 'package:flutter_application_2/proto/chat/chat.pb.dart';
import 'package:flutter_application_2/services/encrypt_message.dart';
import 'package:flutter_application_2/services/jwt_decode.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedChatList extends StatefulWidget {
  const AnimatedChatList(
      {super.key,
      required this.data,
      required this.keyChat,
      required this.readCallback,
      required this.controller,
      required this.globalKey});

  final List<Message> data;
  final void Function(int) readCallback;
  final String keyChat;
  final ScrollController controller;
  final GlobalKey globalKey;

  @override
  State<AnimatedChatList> createState() => _AnimatedChatListState();
}

class _AnimatedChatListState extends State<AnimatedChatList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadFileBloc, UploadFileState>(
      builder: (context, state) {
        List<dynamic> data = [...widget.data];
        var uploadFiles = context.read<UploadFileBloc>().state.chatUploadFiles;
        for (var key in uploadFiles.keys) {
          data.insert(0, uploadFiles[key]);
        }
        Map<int, DateTime> dataWithDate = {};
        DateTime? time;
        int? newMessage;

        for (var item in data.reversed) {
          var timeParse = DateTime.parse(item.createdAt).toLocal();
          if ("${time?.day}${time?.month}${time?.year}" !=
              "${timeParse.day}${timeParse.month}${timeParse.year}") {
            time = timeParse;
            dataWithDate[item.id] = timeParse;
          }
          if (item.runtimeType == Message &&
              item.unReadedMessage &&
              newMessage == null &&
              item.user.email != jwtDecode().email) {
            newMessage = item.id;
          }
        }

        return AnimatedList(
            controller: widget.controller,
            key: widget.globalKey,
            initialItemCount: data.length,
            reverse: true,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index, animation) {
              if (data[index].runtimeType == Message) {
                var message = (data[index] as Message);
                var id = message.id;
                return VisibilityDetector(
                  key: Key("$id"),
                  onVisibilityChanged: (visibilityInfo) {
                    if (message.unReadedMessage &&
                        message.user.email != jwtDecode().email) {
                      widget.readCallback(id);
                    }
                  },
                  child: FadeTransition(
                    key: ValueKey<int>(id),
                    opacity: animation,
                    child: SizeTransition(
                      key: UniqueKey(),
                      sizeFactor: animation,
                      child: MessageComponent(
                        secretKey: widget.keyChat,
                        chatFiles: message.chatFiles,
                        newMessage: newMessage == id,
                        controller: widget.controller,
                        statusRead: message.statusRead,
                        dateChange: dataWithDate[id],
                        createdAt: message.createdAt,
                        name: message.user.name,
                        status: jwtDecode().email == message.user.email,
                        text: message.text != ""
                            ? EncryptMessage()
                                .decrypt(message.text, widget.keyChat)
                            : "",
                      ),
                    ),
                  ),
                );
              }
              var message = (data[index] as AddUploadFile);
              var id = message.id;
              return FadeTransition(
                key: ValueKey<int>(id),
                opacity: animation,
                child: SizeTransition(
                  key: UniqueKey(),
                  sizeFactor: animation,
                  child: MessageUploadFileComponent(
                    messageId: message.id,
                    secretKey: widget.keyChat,
                    chatFiles: message.chatFiles,
                    controller: widget.controller,
                    dateChange: dataWithDate[id],
                    createdAt: message.createdAt,
                    name: message.user.name,
                    text: message.text != ""
                        ? EncryptMessage().decrypt(message.text, widget.keyChat)
                        : "",
                  ),
                ),
              );
            });
      },
    );
  }
}
