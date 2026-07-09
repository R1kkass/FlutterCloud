import 'package:TalkSpace/presentation/widgets/messenger/message/files_picker/file_gallery_files.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/files_picker/file_gallery_images.dart';
import 'package:TalkSpace/presentation/widgets/messenger/message/files_picker/tab_file_picker_enum.dart';
import 'package:flutter/cupertino.dart';

class TabsTypeFilePicker extends StatelessWidget {
  final TabFilePickerEnum selectedTabFilePicker;

  const TabsTypeFilePicker({
    super.key,
    required this.selectedTabFilePicker,
  });

  @override
  Widget build(BuildContext context) {
    Map<TabFilePickerEnum, Widget> children = {
      TabFilePickerEnum.gallery: FileGalleryImages(),
      TabFilePickerEnum.fileStorage: FileGalleryFiles()
    };

    return Builder(builder: (context) {
      return Expanded(
        child: children[selectedTabFilePicker] ?? const SizedBox(),
      );
    });
  }
}