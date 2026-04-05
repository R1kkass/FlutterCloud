import 'package:TalkSpace/features/chat/chat_accept.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/data/repository/chat_grpc.dart';
import 'package:TalkSpace/data/repository/keys_grpc.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart';
import 'package:TalkSpace/services/dh_algoritm.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';

class ChatAcceptButton extends ChatAcceptImpl {
  const ChatAcceptButton(
      {super.key, required super.chat, required super.setChats});

  @override
  State<ChatAcceptButton> createState() => _ChatAcceptButtonState();
}

class _ChatAcceptButtonState extends State<ChatAcceptButton> {
  var isLoading = false;
  final _chatGrpc = ChatGrpc();
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          if (!isLoading) {
            await _accept();
          }
        },
        child: isLoading
            ? SizedBox(
                width: 10,
                height: 10,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : const Icon(Icons.done));
  }

  Future _accept() async {
    try {
      await _acceptChat();
    } catch (e) {
      showUnsuccessToast("Не удалось подтвердить");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  var secretBox = HiveBoxes.chatsSecretKey;

  Future _acceptChat() async {
    setState(() {
      isLoading = true;
    });
    var chat = widget.chat;
    await _createSecretChatKey(chat);
    await _uploadNewChatKeys(chat);
  }

  Future _createSecretChatKey(Chat chat) async {
    var email = jwtDecode().email;
    var box = HiveBoxes.pubKey;

    var key = chat.id.toString() + email;
    if (secretBox.get(key) == null) {
      if (box.get(key) == null) {
        GetPublicKeyResponse keys = await _chatGrpc
            .getPublicKey(GetPublicKeyRequest(chatId: chat.id));
        var key = await DHAlgorithm.generatePubKey(keys.p, keys.g.toInt(), chat.id);
        await _chatGrpc.createSecondaryKey(
            CreateSecondaryKeyRequest(chatId: chat.id, key: key.toString()));
      }
      var keys = await _chatGrpc
          .getSecondaryKey(GetSecondaryKeyRequest(chatId: chat.id));
      await DHAlgorithm.generateSecretKey(keys.key, keys.p, chat.id);
    }
  }

  Future _uploadNewChatKeys(Chat chat) async {
    await KeysGrpc().uploadNewKeys();
    await _chatGrpc.acceptChat(AcceptChatRequest(chatId: chat.id));
    widget.setChats((await _chatGrpc.getUnSuccessChats()).chats);
  }
}
