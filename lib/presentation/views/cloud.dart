import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/features/file/bottom_sheeet_file.dart';
import 'package:TalkSpace/components/default_scaffold.dart';
import 'package:TalkSpace/cubit/content_bloc.dart';
import 'package:TalkSpace/cubit/current_page_bloc.dart';
import 'package:TalkSpace/data/repository/files_grpc.dart';
import 'package:TalkSpace/gen/dart/file/file.pbgrpc.dart';
import 'package:TalkSpace/widget/file/search_file.dart';
import 'package:TalkSpace/widget/folder/folder_builder.dart';
import 'package:TalkSpace/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CloudArgs {
  int? id = 0;
  String? title;
  CloudArgs(this.id, this.title);
}

class Cloud extends StatefulWidget with RouteAware {
  final String title;

  const Cloud({super.key, required this.title});

  @override
  State<Cloud> createState() => _CloudState();
}

class _CloudState extends State<Cloud> with RouteAware {
  var mainContext =
      NavigationService.navigatorKey.currentContext as BuildContext;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute<dynamic>);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() async {
    if (ModalRoute.of(context)!.settings.name == AppRouter.CLOUD) {
      final args = ModalRoute.of(context)!.settings.arguments as CloudArgs?;
      var response = await FilesGrpc().findFile(FindFileRequest(
          folderId: args?.id, search: "", findEveryWhere: false));
      context
          .read<ContentBloc>()
          .add(ContentInit(files: response.files, folders: response.folders));
    }
  }

  @override
  void didPush() async {
    if (ModalRoute.of(context)!.settings.name == AppRouter.CLOUD) {
      final args = ModalRoute.of(context)!.settings.arguments as CloudArgs?;
      var response = await FilesGrpc().findFile(FindFileRequest(
          folderId: args?.id, search: "", findEveryWhere: false));
      context
          .read<ContentBloc>()
          .add(ContentInit(files: response.files, folders: response.folders));
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<CurrentPageBloc>().add(const ChangePage(1));
  }

  bool searchSaw = false;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CloudArgs?;
    return BlocBuilder<ContentBloc, ContentState>(builder: (context, state) {
      return DefaultScaffold(
          showBottomNavigation: true,
          searchAction: () {
            setState(() {
              searchSaw = true;
            });
          },
          title: (args?.title.runtimeType == String)
              ? (args as CloudArgs).title.toString()
              : widget.title,
          body: Column(children: [
            searchSaw
                ? SearchFile(
                    key: const Key("123"),
                    folderId: args?.id,
                    fn: () {
                      setState(() {
                        searchSaw = false;
                      });
                    },
                  )
                : const SizedBox(
                    height: 0,
                    key: Key("0"),
                  ),
            Expanded(
              child: FolderBuilder(
                folderId: args?.id,
              ),
            ),
          ]),
          floatButton: BottomSheetFile(
            id: args?.id,
            state: state,
            context: context,
          ));
    });
  }
}
