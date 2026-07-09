import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/domain/model/entities/session.dart';
import 'package:TalkSpace/presentation/viewmodels/user/change_user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/presentation/widgets/scaffold/default_scaffold.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:provider/provider.dart';

class ChangeUser extends StatefulWidget {
  final String title;
  const ChangeUser({super.key, required this.title});

  @override
  State<ChangeUser> createState() => _ChangeUserState();
}

class _ChangeUserState extends State<ChangeUser> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChangeUserViewModel>(builder: (context, viewModel, child) {
      viewModel.getSessions();
      void changeToken(Session session) {
        viewModel.changeUser(session);
        Navigator.pushNamedAndRemoveUntil(context, AppRouter.SPLASH, (r) => false);
        showToast('Аккаунт сменен на: ${session.email}');
      }

      return DefaultScaffold(
        title: widget.title,
        body: ListView.builder(
          itemCount: viewModel.sessions.length,
          itemBuilder: (context, index) {
            if (viewModel.commonToken.accessToken != null && viewModel.sessions[index].email != Jwt.parseJwt(viewModel.commonToken.accessToken!)['email']) {
              return TextButton(
                  onPressed: () {
                    changeToken(viewModel.sessions[index]);
                  },
                  child: Text(viewModel.sessions[index].email)
              );
            }
            return null;
          }),
      );
    });
  }
}
