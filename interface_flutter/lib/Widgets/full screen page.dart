import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPage extends StatefulWidget {
  final VideoPlayerController controller;

  FullScreenVideoPage({required this.controller});

  @override
  _FullScreenVideoPageState createState() => _FullScreenVideoPageState();
}

class _FullScreenVideoPageState extends State<FullScreenVideoPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.play();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.contain,
                child: SizedBox(
                  width: widget.controller.value.size.width,
                  height: widget.controller.value.size.height,
                  child: VideoPlayer(widget.controller),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
