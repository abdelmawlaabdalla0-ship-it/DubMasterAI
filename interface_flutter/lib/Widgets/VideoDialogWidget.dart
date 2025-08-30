import 'package:dubmasterai/Widgets/full%20screen%20page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDialogWidget extends StatefulWidget {
  final String videoUrl;

  const VideoDialogWidget({super.key, required this.videoUrl});

  @override
  State<VideoDialogWidget> createState() => _VideoDialogWidgetState();
}

class _VideoDialogWidgetState extends State<VideoDialogWidget> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isMuted = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0.0 : 1.0);
    });
  }

  void _seekForward() {
    final current = _controller.value.position;
    final duration = _controller.value.duration;
    final target = current + const Duration(seconds: 10);
    _controller.seekTo(target < duration ? target : duration);
  }

  void _seekBackward() {
    final current = _controller.value.position;
    final target = current - const Duration(seconds: 10);
    _controller.seekTo(target > Duration.zero ? target : Duration.zero);
  }

  void _goToFullScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenVideoPage(controller: _controller),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final isSmallScreen = media.width < 400;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: media.width * 0.9,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(16),
        ),
        child: _isInitialized
            ? Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: VideoPlayer(_controller),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              children: [
                IconButton(
                  icon: const Icon(Icons.fullscreen, color: Colors.white),
                  onPressed: _goToFullScreen,
                  iconSize: isSmallScreen ? 24 : 30,
                ),
                IconButton(
                  icon: const Icon(Icons.replay_10, color: Colors.white),
                  onPressed: _seekBackward,
                  iconSize: isSmallScreen ? 24 : 30,
                ),
                IconButton(
                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  onPressed: _togglePlayPause,
                  iconSize: isSmallScreen ? 24 : 30,
                ),
                IconButton(
                  icon:
                  const Icon(Icons.forward_10, color: Colors.white),
                  onPressed: _seekForward,
                  iconSize: isSmallScreen ? 24 : 30,
                ),
                IconButton(
                  icon: Icon(
                    _isMuted ? Icons.volume_off : Icons.volume_up,
                    color: Colors.white,
                  ),
                  onPressed: _toggleMute,
                  iconSize: isSmallScreen ? 24 : 30,
                ),
                IconButton(
                  icon: const Icon(Icons.close,
                      color: Colors.redAccent),
                  onPressed: () => Navigator.pop(context),
                  iconSize: isSmallScreen ? 24 : 30,
                ),
              ],
            )
          ],
        )
            : SizedBox(
          height: media.height * 0.25,
          child: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
