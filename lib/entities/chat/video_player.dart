import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/message_date.dart';
import 'package:video_player/video_player.dart' as video_player;

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key, required this.video});

  final File video;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late video_player.VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = video_player.VideoPlayerController.file(widget.video)
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.addListener(() {
      if (!_controller.value.isPlaying) {
        show = true;
      }
      setState(() {});
    });
    _controller.setLooping(false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool show = true;

  @override
  Widget build(BuildContext context) {
    var videoPositionSeconds = _controller.value.position.inSeconds;
    var videoSeconds = _controller.value.duration.inSeconds;

    return _controller.value.isInitialized
        ? GestureDetector(
            onTap: () {
              setState(() {
                show = !show;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.scale(
                  scale: 2,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: video_player.VideoPlayer(_controller)),
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: show ? 1 : 0,
                  child: SizedBox(
                      height: 36,
                      width: 36,
                      child: Positioned.fill(
                        child: IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: Colors.black26),
                            iconSize: 18,
                            onPressed: () {
                              if (_controller.value.isPlaying) {
                                _controller.pause();
                                setState(() {
                                  show = true;
                                });
                                return;
                              }
                              setState(() {
                                show = false;
                              });
                              _controller.play();
                            },
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? CupertinoIcons.pause_solid
                                  : CupertinoIcons.play_arrow_solid,
                              color: Colors.white,
                            )),
                      )),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: show ? 1 : 0,
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                          child: Slider(
                              inactiveColor: Colors.black38,
                              activeColor: Colors.white,
                              value: videoPositionSeconds.toDouble(),
                              max: _controller.value.duration.inSeconds
                                  .toDouble(),
                              onChanged: (v) {
                                _controller
                                    .seekTo(Duration(seconds: v.toInt()));
                                setState(() {});
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    right: 10,
                    bottom: 25,
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: show ? 1 : 0,
                        child: Text(
                          "${videoPositionSeconds ~/ 60}:${MessageDate().addZero(videoPositionSeconds % 60)} / ${videoSeconds ~/ 60}:${MessageDate().addZero(videoSeconds % 60)}",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )))
              ],
            ),
          )
        : const Center(
            child: SizedBox(
                height: 35,
                width: 35,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                )),
          );
  }
}
