import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_router.dart';
import 'package:flutter_application_2/components/default_scaffold.dart';
import 'package:flutter_application_2/components/dialog_loading.dart';
import 'package:flutter_application_2/components/my_input.dart';
import 'package:flutter_application_2/shared/toast.dart';
import 'package:flutter_application_2/grpc/auth_grpc.dart';
import 'package:flutter_application_2/grpc/keys_grpc.dart';
import 'package:flutter_application_2/proto/auth/auth.pb.dart';
import 'package:flutter_application_2/proto/keys/keys.pb.dart';
import 'package:flutter_application_2/services/encrypt_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_application_2/cubit/token_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Authorization extends StatefulWidget {
  final String title;
  const Authorization({super.key, required this.title});

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class LoginFields {
  final String email;
  final String password;

  const LoginFields({required this.email, required this.password});
}

class _AuthorizationState extends State<Authorization> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> sigUpController = {
    'email': TextEditingController(),
    'password': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: widget.title,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              const Text(
                'Авторизация',
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
                            _login(
                                    LoginFields(
                                      email: sigUpController["email"]?.text
                                          as String,
                                      password: sigUpController["password"]
                                          ?.text as String,
                                    ),
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
                    Center(
                        child: TextButton(
                      child: const Text("Регистрация"),
                      onPressed: () async {
                        Navigator.pushNamed(context, AppRouter.REGISTRATION);
                      },
                    ))
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

Future<LoginResponse?> _login(LoginFields request, BuildContext context) async {
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

    var loginResp =
        await authGprc.login(LoginRequest(email: email, password: password));
    var token = decrypt(loginResp.accessToken, secretKey);
    KeysGrpc().uploadFile(KeysUploadRequest());

    var box = Hive.box('token');
    var boxTokens = Hive.box('list_token');

    box.put('access_token', token);
    boxTokens.put(request.email, token);

    List<int> bytes = utf8.encode(request.password);
    String hash = sha256.convert(bytes).toString();
    box.put('password', hash.substring(0, 32));
    return LoginResponse(accessToken: token);
  } catch (e) {
    showToast(context, "Неверный логин или пароль");
    return null;
  } finally {
    Navigator.pop(context);
  }
}
