import 'package:flutter/material.dart';

class FileGalleryType extends StatefulWidget {
  const FileGalleryType({super.key});

  @override
  State<FileGalleryType> createState() => _FileGalleryTypeState();
}

class _FileGalleryTypeState extends State<FileGalleryType> {
  final Map<String, Types> types = {
    "Галерея": const Types(color: Colors.blueAccent, icon: Icons.image),
    "Файл": Types(
      color: Colors.greenAccent.shade400,
      icon: Icons.insert_drive_file,
    ),
    "Музыка": const Types(
      color: Colors.pinkAccent,
      icon: Icons.play_arrow,
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
            Column(
              children: [
                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      color: types[key]?.color),
                  child: Icon(types[key]?.icon, color: Colors.white),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(key,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: types[key]?.color)),
                )
              ],
            ),
        ],
      ),
    );
  }
}

class Types {
  const Types({required this.color, required this.icon});

  final Color color;
  final IconData icon;
}
