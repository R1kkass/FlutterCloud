import 'package:TalkSpace/domain/model/entities/folder.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/cloud_page_view_model.dart';
import 'package:TalkSpace/presentation/widgets/cloud/cloud_list.dart';
import 'package:TalkSpace/presentation/widgets/cloud/search_cloud.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/app/app_router.dart';
import 'package:TalkSpace/presentation/widgets/cloud/bottom_sheeet_file.dart';
import 'package:TalkSpace/presentation/widgets/scaffold/default_scaffold.dart';
import 'package:TalkSpace/main.dart';
import 'package:provider/provider.dart';

class CloudArgs {
  Folder? folder;
  CloudArgs(this.folder);
}

class Cloud extends StatefulWidget with RouteAware {
  final String title;

  Cloud({super.key, required this.title});

  @override
  State<Cloud> createState() => _CloudState();
}

class _CloudState extends State<Cloud> with RouteAware {

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
      updateCloudData();
    }
  }

  @override
  void didPush() async {
    if (ModalRoute.of(context)!.settings.name == AppRouter.CLOUD) {
      updateCloudData();
    }
  }

  void updateCloudData() async {
    final args = ModalRoute.of(context)!.settings.arguments as CloudArgs;
    final viewModel = Provider.of<CloudPageViewModel>(context);
    await viewModel.commonCloudData.set(folderId: args.folder?.id);
  }

  @override
  void initState() {
    super.initState();
  }

  bool searchSaw = false;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CloudArgs;
    return DefaultScaffold(
      showBottomNavigation: true,
      searchAction: () {
        setState(() {
          searchSaw = true;
        });
      },
      title: args.folder?.nameFolder ?? widget.title,
      body: Column(children: [
        searchSaw
            ? SearchCloud(
                key: const Key("123"),
                folder: args.folder,
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
          child: CloudList(
            folder: args.folder,
          ),
        ),
      ]),
      floatButton: BottomSheetFile(
        folder: args.folder,
    ));
  }
}
