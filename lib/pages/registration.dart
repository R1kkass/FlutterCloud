import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
import 'package:flutter_application_2/components/my_input.dart';
import 'package:flutter_application_2/shared/toast.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_application_2/components/dialog_loading.dart';
import 'package:flutter_application_2/grpc/auth_grpc.dart';
import 'package:flutter_application_2/grpc/keys_grpc.dart';
import 'package:flutter_application_2/proto/auth/auth.pb.dart';
import 'package:flutter_application_2/proto/keys/keys.pb.dart';
import 'package:flutter_application_2/services/encrypt_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_application_2/cubit/token_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Registration extends StatefulWidget {
  final String title;
  const Registration({super.key, required this.title});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> sigUpController = {
    'email': TextEditingController(),
    'name': TextEditingController(),
    'password': TextEditingController(),
    'repeat_password': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: widget.title,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 48.0, right: 48.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              const Text(
                'Регистрация',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 25,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyInput(
                        icon: Icons.face,
                        controller: sigUpController["name"],
                        title: "Введите имя",
                        error: "Пожалуйста, заполните поле имя"),
                    const SizedBox(
                      height: 10,
                    ),
                    MyInput(
                        icon: Icons.mail,
                        controller: sigUpController["email"],
                        title: "Введите E-Mail",
                        error: "Пожалуйста, заполните поле E-Mail"),
                    const SizedBox(
                      height: 10,
                    ),
                    MyInput(
                        icon: Icons.key,
                        controller: sigUpController["password"],
                        title: "Введите пароль",
                        obscureText: true,
                        error: "Пожалуйста, заполните поле пароль"),
                    const SizedBox(
                      height: 10,
                    ),
                    MyInput(
                        icon: Icons.key,
                        obscureText: true,
                        controller: sigUpController["repeat_password"],
                        title: "Повторите пароль",
                        error: "Пожалуйста, заполните поле пароль"),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: WidgetStateProperty.all(5.0),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            ))),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _registration(
                                    RegistrationRequest(
                                        email: sigUpController["email"]?.text,
                                        password:
                                            sigUpController["password"]?.text,
                                        name: sigUpController["name"]?.text),
                                    context)
                                .then((e) async {
                              if (e != null) {
                                context
                                    .read<TokenCubit>()
                                    .updateToken(e.accessToken);
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/', (r) => false);
                              }
                            });
                            return;
                          }
                        },
                        child: const Text('Подтвердить'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<RegistrationResponse?> _registration(
    RegistrationRequest request, BuildContext context) async {
  try {
    showLoaderDialog(context);
    var authGprc = AuthGrpc();

    DHConnectResponse keys = await authGprc.dHConnect(DHConnectRequest());

    var A = await generatePubKeyAuth(keys.p, keys.g.toInt());
    var secretKey = await generateSecretKeyAuth(keys.b, keys.p, A.a);
    await authGprc.dHSecondConnect(DHSecondConnectRequest(a: A.A.toString()));
    secretKey = secretKey.substring(0, 32);
    String password = encrypt(request.password, secretKey);
    String email = encrypt(request.email, secretKey);
    String name = encrypt(request.name, secretKey);

    var loginResp = await authGprc.registration(
        RegistrationRequest(email: email, password: password, name: name));
    var token = decrypt(loginResp.accessToken, secretKey);
    KeysGrpc().uploadFile(KeysUploadRequest());

    var box = Hive.box('token');
    var boxTokens = Hive.box('list_token');

    await box.put('access_token', token);
    await boxTokens.put(request.email, token);

    List<int> bytes = utf8.encode(request.password);
    String hash = sha256.convert(bytes).toString();
    await box.put('password', hash.substring(0, 32));
    return RegistrationResponse(accessToken: token);
  } catch (e) {
    showToast(context, "Ошибка при регистрации");
    return null;
  } finally {
    Navigator.pop(context);
  }
}
