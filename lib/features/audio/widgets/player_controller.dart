import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:piton_tech_project/core/utils/custom_button.dart';
import 'package:piton_tech_project/features/audio/audio_service/audio_service.dart';
import 'package:piton_tech_project/themes/palette.dart';

class PlayerController extends ConsumerStatefulWidget {
  const PlayerController({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PlayerControllerState();
}

class _PlayerControllerState extends ConsumerState<PlayerController> {
  late final AudioService _audioService;
  final double _iconSize = 36;

  Icon _playIcon(PlayerState playerState) {
    final processingState = playerState.processingState;

    if (processingState == ProcessingState.completed) {
      return Icon(
        Icons.replay,
        size: _iconSize,
      );
    } else if (_audioService.isPlaying == true) {
      return Icon(
        Icons.pause,
        size: _iconSize,
      );
    } else {
      return Icon(
        Icons.play_arrow,
        size: _iconSize,
      );
    }
  }

  @override
  void initState() {
    _audioService = ref.read(audioServiceProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          onTap: () {
            _audioService.previousAudio();
            setState(() {});
          },
          backgroundColor: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          innerPadding: const EdgeInsets.all(6),
          child: Icon(
            Icons.skip_previous,
            size: _iconSize,
          ),
        ),
        StreamBuilder(
          stream: _audioService.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;

            return CustomButton(
              onTap: () async {
                if (_audioService.isFinished) {
                  await _audioService.replayAudio();
                } else if (_audioService.isPlaying) {
                  await _audioService.pauseAudio();
                } else {
                  await _audioService.playAudio();
                }
              },
              backgroundColor: Palette.button,
              borderRadius: BorderRadius.circular(100),
              innerPadding: const EdgeInsets.all(10),
              child: playerState == null
                  ? const Icon(
                      Icons.play_arrow,
                    )
                  : _playIcon(playerState),
            );
          },
        ),
        CustomButton(
          onTap: () {
            _audioService.nextAudio();
            setState(() {});
          },
          backgroundColor: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          innerPadding: const EdgeInsets.all(6),
          child: Icon(
            Icons.skip_next,
            size: _iconSize,
          ),
        ),
      ],
    );
  }
}
