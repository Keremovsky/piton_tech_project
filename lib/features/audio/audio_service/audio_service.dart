import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:piton_tech_project/models/music_model.dart';

final audioServiceProvider =
    StateNotifierProvider<AudioService, List<MusicModel>>((ref) => AudioService(
          audioPlayer: AudioPlayer(),
        ));

class AudioService extends StateNotifier<List<MusicModel>> {
  final AudioPlayer _audioPlayer;
  late int index;

  AudioService({required AudioPlayer audioPlayer})
      : _audioPlayer = audioPlayer,
        super([]);

  Stream<Duration?> get durationStream => _audioPlayer.durationStream;

  Stream<Duration?> get positionStream => _audioPlayer.createPositionStream();

  Stream<PlayerState> get playerStateStream => _audioPlayer.playerStateStream;

  bool get isPlaying => _audioPlayer.playing;

  bool get isFinished =>
      _audioPlayer.playerState.processingState == ProcessingState.completed;

  Duration get totalDuration => _audioPlayer.duration ?? Duration.zero;

  MusicModel get currentMusic => state[index];

  Stream<MusicModel> get currentMusicStream async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 100));
      yield state[index];
    }
  }

  Future<void> updateAudio(List<MusicModel> musics, int index) async {
    state = musics;
    this.index = index;

    await _updateCurrentAudio();

    await _audioPlayer.play();
  }

  Future<void> playAudio() async {
    await _audioPlayer.play();
  }

  Future<void> pauseAudio() async {
    await _audioPlayer.pause();
  }

  Future<void> replayAudio() async {
    await _audioPlayer.seek(Duration.zero);
    await _audioPlayer.play();
  }

  Future<void> nextAudio() async {
    // if it is not last audio, update music
    if (state.length - 1 != index) {
      index = index + 1;
      await _updateCurrentAudio();
      await _audioPlayer.play();
    }
  }

  Future<void> previousAudio() async {
    // get current duration of audio
    final currentPosition = _audioPlayer.position;

    // if it is less then 5 get previous audio, if it is not, make current duration to zero
    if (currentPosition.inSeconds >= 5) {
      await _audioPlayer.seek(Duration.zero);
    } else {
      // if it is not first audio, update music
      if (index != 0) {
        index = index - 1;
        await _updateCurrentAudio();
        await _audioPlayer.play();
      } else {
        await _audioPlayer.seek(Duration.zero);
      }
    }
  }

  Future<void> seekToDuration(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // update current audio
  Future<void> _updateCurrentAudio() async {
    await _audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [AudioSource.uri(Uri.parse(state[index].music))],
      ),
    );
  }
}
