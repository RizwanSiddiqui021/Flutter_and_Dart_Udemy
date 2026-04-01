import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/song.dart';

class AudioProvider extends ChangeNotifier {
  final _player = AudioPlayer();
  Song? currentSong;
  bool isPlaying = false;

  AudioPlayer get player => _player;

  Future<void> setSong(Song song) async {
    currentSong = song;
    await _player.setAsset(song.assetPath);
    play();
    notifyListeners();
  }

  void play() {
    _player.play();
    isPlaying = true;
    notifyListeners();
  }

  void pause() {
    _player.pause();
    isPlaying = false;
    notifyListeners();
  }

  void togglePlayPause() {
    if (isPlaying) {
      pause();
    } else {
      play();
    }
  }

  void disposePlayer() {
    _player.dispose();
  }
}
