import 'package:TalkSpace/presentation/widgets/messenger/message/files_picker/tab_file_picker_enum.dart';
import 'package:flutter/material.dart';

class FileGalleryType extends StatefulWidget {
  const FileGalleryType({super.key, required this.action});

  final Function(TabFilePickerEnum) action;

  @override
  State<FileGalleryType> createState() => _FileGalleryTypeState();
}

class _FileGalleryTypeState extends State<FileGalleryType> {
  final Map<TabFilePickerEnum, Types> types = {
    TabFilePickerEnum.gallery: const Types(
        color: Colors.blueAccent,
        icon: Icons.image,
        text: "Галерея"
    ),
    TabFilePickerEnum.fileStorage: Types(
      color: Colors.greenAccent.shade400,
      icon: Icons.insert_drive_file,
      text: "Файлы",
    ),
    TabFilePickerEnum.music: const Types(
      color: Colors.pinkAccent,
      icon: Icons.play_arrow_rounded,
      text: "Музыка",
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (var key in types.keys)
            GestureDetector(
              onTap: () => widget.action(key),
              child: Column(
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        color: types[key]!.color),
                    child: Center(
                        child: Icon(types[key]!.icon, color: Colors.white)),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(types[key]!.text,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: types[key]!.color)),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class Types {
  const Types({
    required this.color,
    required this.icon,
    required this.text
  });

  final Color color;
  final String text;
  final IconData icon;
}
