import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;
  final String title;

  const AudioPlayerWidget({
    Key? key,
    required this.audioUrl,
    required this.title,
  }) : super(key: key);

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() => totalDuration = duration);
    });

    _audioPlayer.onPositionChanged.listen((position) {
      setState(() => currentPosition = position);
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        currentPosition = Duration.zero;
      });
    });
  }

  void _togglePlayback() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(UrlSource(widget.audioUrl));
    }
    setState(() => isPlaying = !isPlaying);
  }

  void _seekForward() async {
    final newPos = currentPosition + Duration(seconds: 10);
    if (newPos < totalDuration) {
      await _audioPlayer.seek(newPos);
    }
  }

  void _seekBackward() async {
    final newPos = currentPosition - Duration(seconds: 10);
    if (newPos > Duration.zero) {
      await _audioPlayer.seek(newPos);
    } else {
      await _audioPlayer.seek(Duration.zero);
    }
  }

  void _restart() async {
    await _audioPlayer.seek(Duration.zero);
  }

  void _download() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Download started!")),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}";
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 400),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.music_note, color: Colors.white, size: 36),
              SizedBox(height: 12),
              Text(
                widget.title,
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Slider(
                activeColor: Colors.blueAccent,
                inactiveColor: Colors.white24,
                min: 0,
                max: totalDuration.inSeconds.toDouble(),
                value: currentPosition.inSeconds.toDouble().clamp(
                    0.0, totalDuration.inSeconds.toDouble()),
                onChanged: (value) async {
                  await _audioPlayer.seek(Duration(seconds: value.toInt()));
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatDuration(currentPosition),
                      style: TextStyle(color: Colors.white70)),
                  Text(formatDuration(totalDuration),
                      style: TextStyle(color: Colors.white70)),
                ],
              ),
              SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildControlButton(Icons.replay_10, _seekBackward),
                  _buildControlButton(Icons.restart_alt, _restart),
                  _buildPlayPauseButton(),
                  _buildControlButton(Icons.forward_10, _seekForward),
                  _buildControlButton(Icons.download, _download),
                ],
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Close", style: TextStyle(color: Colors.white38)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayPauseButton() {
    return GestureDetector(
      onTap: _togglePlayback,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Widget _buildControlButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon, color: Colors.white),
      onPressed: onPressed,
      iconSize: 28,
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
    );
  }
}

