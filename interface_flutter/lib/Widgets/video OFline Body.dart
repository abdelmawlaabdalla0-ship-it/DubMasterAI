import 'package:dubmasterai/Cubites/pieck%20Video/pieck%20Video%20Cubite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:dubmasterai/Widgets/full screen page.dart';

class Videopickedplay extends StatefulWidget {
  @override
  State<Videopickedplay> createState() => _VideopickedplayState();
}

class _VideopickedplayState extends State<Videopickedplay> {
  late VideoPlayerController videoPlayerController;
  bool isInitialized = false;
  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    initializeVideo();
  }

  void initializeVideo() async {
    final videoFile = BlocProvider.of<pieckvideocubite>(context).image;
    if (videoFile != null) {
      videoPlayerController = VideoPlayerController.file(File(videoFile.path));
      await videoPlayerController.initialize();
      setState(() {
        isInitialized = true;
      });
    } else {
      print("No video file found.");
    }
  }

  void togglePlayPause() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
    } else {
      videoPlayerController.play();
    }
    setState(() {});
  }

  void toggleMute() {
    if (isMuted) {
      videoPlayerController.setVolume(1.0);
    } else {
      videoPlayerController.setVolume(0.0);
    }
    setState(() {
      isMuted = !isMuted;
    });
  }

  void seekForward() {
    final current = videoPlayerController.value.position;
    final duration = videoPlayerController.value.duration;
    final target = current + Duration(seconds: 10);
    videoPlayerController.seekTo(target < duration ? target : duration);
  }

  void seekBackward() {
    final current = videoPlayerController.value.position;
    final target = current - Duration(seconds: 10);
    videoPlayerController.seekTo(target > Duration.zero ? target : Duration.zero);
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Player")),
      body: Center(
        child: isInitialized
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreenVideoPage(
                      controller: videoPlayerController,
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 180,
                  width: 320,
                  child: AspectRatio(
                    aspectRatio: videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(videoPlayerController),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.fullscreen),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreenVideoPage(
                          controller: videoPlayerController,
                        ),
                      ),
                    );
                  },
                  iconSize: 40,
                ),
                IconButton(
                  icon: Icon(Icons.replay_10),
                  onPressed: seekBackward,
                  iconSize: 40,
                ),
                IconButton(
                  icon: Icon(videoPlayerController.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow),
                  onPressed: togglePlayPause,
                  iconSize: 40,
                ),
                IconButton(
                  icon: Icon(Icons.forward_10),
                  onPressed: seekForward,
                  iconSize: 40,
                ),
                IconButton(
                  icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up),
                  onPressed: toggleMute,
                  iconSize: 40,
                ),
              ],
            ),
          ],
        )
            : ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 180,
            width: 320,
            child: LoadingIndicator(
              indicatorType: Indicator.lineScale,
              colors: const [Colors.lightBlue],
              strokeWidth: 0.2,
              backgroundColor: Colors.transparent,
              pathBackgroundColor: Colors.lightBlue,
            ),
          ),
        ),
      ),
    );
  }
}
