import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/presentation/viewmodels/user/logout_button_view_model.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key});

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    return
      Consumer<LogoutButtonViewModel>(builder: (context, viewModel, child) {
        return TextButton(
          onPressed: () async {
            try {
              await viewModel.logout();
              Navigator.pushNamedAndRemoveUntil(context, AppRouter.AUTH, (_) => false);
            } catch (e) {
              showUnsuccessToast("Не удалось завершить сессию");
            }
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.exit_to_app_outlined),
              SizedBox(
                width: 5,
              ),
              Text(
                "Выход",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ));
      });
  }
}
