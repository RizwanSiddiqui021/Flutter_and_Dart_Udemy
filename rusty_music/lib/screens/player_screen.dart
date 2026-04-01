import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/song.dart';
import '../providers/audio_provider.dart';

class PlayerScreen extends StatefulWidget {
  final Song song;

  const PlayerScreen({super.key, required this.song});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  void initState() {
    super.initState();

    /// Load the song as soon as PlayerScreen is opened
    Future.microtask(() {
      Provider.of<AudioProvider>(context, listen: false).setSong(widget.song);
    });
  }

  @override
  Widget build(BuildContext context) {
    final audio = Provider.of<AudioProvider>(context);
    final player = audio.player;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Top Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_down, size: 32),
                  onPressed: () => Navigator.pop(context),
                ),
                IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
              ],
            ),

            const SizedBox(height: 20),

            // Album Art
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.song.cover,
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 30),

            // Title & Artist
            Text(
              widget.song.title,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              widget.song.artist,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // --- SEEK BAR (Fully functional!) ---
            StreamBuilder<Duration>(
              stream: player.positionStream,
              builder: (context, posSnapshot) {
                final position = posSnapshot.data ?? Duration.zero;

                return StreamBuilder<Duration?>(
                  stream: player.durationStream,
                  builder: (context, durSnapshot) {
                    final duration = durSnapshot.data ?? Duration.zero;

                    return Column(
                      children: [
                        Slider(
                          min: 0,
                          max: duration.inSeconds.toDouble(),
                          value: position.inSeconds
                              .clamp(0, duration.inSeconds)
                              .toDouble(),
                          onChanged: (value) {
                            player.seek(Duration(seconds: value.toInt()));
                          },
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                formatTime(position),
                                style: const TextStyle(color: Colors.grey),
                              ),
                              Text(
                                formatTime(duration),
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 30),

            // --- Controls ---
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.skip_previous, size: 45),
                const SizedBox(width: 30),

                // PLAY / PAUSE button
                GestureDetector(
                  onTap: () => audio.togglePlayPause(),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.black,
                    child: Icon(
                      audio.isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),
                ),

                const SizedBox(width: 30),
                const Icon(Icons.skip_next, size: 45),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper to format mm:ss
  String formatTime(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
