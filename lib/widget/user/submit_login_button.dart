import 'dart:convert';

import 'package:TalkSpace/components/dialog_loading.dart';
import 'package:TalkSpace/cubit/token_cubit.dart';
import 'package:TalkSpace/grpc/auth_grpc.dart';
import 'package:TalkSpace/grpc/keys_grpc.dart';
import 'package:TalkSpace/proto/auth/auth.pb.dart';
import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class SubmitLoginButton extends StatefulWidget {
  const SubmitLoginButton({super.key, required this.formKey, required this.sigUpController});

  final GlobalKey<FormState> formKey;
  final Map<String, TextEditingController> sigUpController;
  @override
  State<SubmitLoginButton> createState() => _SubmitLoginButtonState();
}

class _SubmitLoginButtonState extends State<SubmitLoginButton> {
  @override
  Widget build(BuildContext context) {
    return      SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: WidgetStateProperty.all(5.0),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ))),
                  onPressed: () async {
                    if (widget.formKey.currentState!.validate()) {
                      await _login();
                    }
                  },
                  child: const Text('Подтвердить'),
                ),
              );
  }

  
  Future _login() async {
    try {
      _loginForm();
    } catch (e) {
      showToast(context, "Неверный логин или пароль");
      Navigator.pop(context);
    } finally {}
    return null;
  }

  Future _loginForm() async {
    showLoaderDialog(context);
    var authGprc = AuthGrpc();
    var email = widget.sigUpController["email"]!.text;
    var password = widget.sigUpController["password"]!.text;
    DHConnectResponse keys = await authGprc.dHConnect(DHConnectRequest());

    var A = await generatePubKeyAuth(keys.p, keys.g.toInt());
    var secretKey = await generateSecretKeyAuth(keys.b, keys.p, A.a);
    await authGprc.dHSecondConnect(DHSecondConnectRequest(a: A.A.toString()));
    secretKey = secretKey.substring(0, 32);
    password = encrypt(password, secretKey);
    email = encrypt(email, secretKey);

    var loginResp =
        await authGprc.login(LoginRequest(email: email, password: password));
    var accessToken = decrypt(loginResp.accessToken, secretKey);

    var box = Hive.box('token');
    var boxTokens = Hive.box('list_token');

    await box.put('access_token', accessToken);
    await boxTokens.put(email, accessToken);

    List<int> bytes = utf8.encode(password);
    String hash = sha256.convert(bytes).toString();
    await box.put('password', hash.substring(0, 32));
    context.read<TokenCubit>().updateToken(accessToken);
    await KeysGrpc().getKeys(() {});
    Navigator.pop(context);
    Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
  }
}