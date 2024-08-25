import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/drawer.dart';

class DefaultScaffold extends StatefulWidget {
  final String title;
  final Widget body;
  final Widget? floatButton;

  const DefaultScaffold(
      {super.key, this.floatButton, required this.title, required this.body});

  @override
  State<DefaultScaffold> createState() => _DefaultScaffoldState();
}

class _DefaultScaffoldState extends State<DefaultScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.canPop(context) ||
                ModalRoute.of(context)!.settings.name != "/"
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.canPop(context)
                      ? Navigator.pop(context, true)
                      : ModalRoute.of(context)!.settings.name != "/"
                          ? Navigator.pushNamedAndRemoveUntil(
                              context, "/", (r) => false)
                          : null;
                })
            : null,
        iconTheme: IconThemeData(
          color:
              Theme.of(context).colorScheme.onPrimary, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange.shade400,
        titleTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary, fontSize: 24),
        title: Text(
          widget.title,
        ),
        foregroundColor: Colors.deepOrange.shade400,
        actionsIconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Builder(builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              iconSize: 40,
              icon: const Icon(Icons.person),
              tooltip: 'Пользователь',
            );
          })
        ],
      ),
      endDrawer: const MyDrawer(),
      body: widget.body,
      floatingActionButton: widget.floatButton,
    );
  }
}
