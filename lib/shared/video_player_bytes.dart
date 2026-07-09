import 'dart:io';
import 'dart:typed_data';

import 'package:TalkSpace/presentation/widgets/messenger/message/video_player.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:video_player/video_player.dart' as video_player;

class VideoPlayerBytes extends StatefulWidget {
  final Uint8List videoBytes;
  final String type;

  const VideoPlayerBytes(
      {super.key, required this.type, required this.videoBytes});

  @override
  State<VideoPlayerBytes> createState() => _VideoPlayerBytesWidgetState();
}

class _VideoPlayerBytesWidgetState extends State<VideoPlayerBytes> {
  video_player.VideoPlayerController? _controller;
  File? video;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initializeVideoPlayer();
    });
  }

  @override
  void dispose() {
    video?.delete();
    super.dispose();
  }

  Future<void> _initializeVideoPlayer() async {
    video = File("${(await getTemporaryDirectory()).path}/temp.${widget.type}");
    video!.writeAsBytesSync(widget.videoBytes);

    _controller = video_player.VideoPlayerController.file(video!);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null) {
      return AspectRatio(
        aspectRatio: _controller!.value.aspectRatio,
        child: VideoPlayer(controller: _controller!),
      );
    }
    return Container();
  }
}
