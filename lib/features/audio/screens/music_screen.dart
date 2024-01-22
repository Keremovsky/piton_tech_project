import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:piton_tech_project/core/utils.dart';
import 'package:piton_tech_project/core/utils/custom_button.dart';
import 'package:piton_tech_project/features/audio/audio_service/audio_service.dart';
import 'package:piton_tech_project/features/audio/widgets/audio_progress_bar.dart';
import 'package:piton_tech_project/features/audio/widgets/music_box.dart';
import 'package:piton_tech_project/themes/palette.dart';

class MusicScreen extends ConsumerStatefulWidget {
  const MusicScreen({super.key});

  @override
  ConsumerState<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends ConsumerState<MusicScreen> {
  late final AudioService _audioService;

  @override
  void initState() {
    _audioService = ref.read(audioServiceProvider.notifier);
    super.initState();
  }

  Icon _playIcon(PlayerState playerState) {
    final processingState = playerState.processingState;

    if (processingState == ProcessingState.completed) {
      return const Icon(Icons.replay, color: Palette.fullWhite);
    } else if (_audioService.isPlaying == true) {
      return const Icon(Icons.pause, color: Palette.fullWhite);
    } else {
      return const Icon(Icons.play_arrow, color: Palette.fullWhite);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentMusic = _audioService.currentMusic;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Now Playing",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            children: [
              MusicBox(
                image: Image.asset(currentMusic.image),
                titleText: currentMusic.title,
                titleStyle: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.normal),
                descriptionText: currentMusic.artist,
                descriptionStyle: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Palette.textGrey),
              ),
              const AudioProgressBar(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StreamBuilder(
                    stream: _audioService.positionStream,
                    builder: (context, snapshot) {
                      final dur = snapshot.data;
                      if (dur == null) {
                        return Text(
                          formatMusicDuration(Duration.zero),
                          style: Theme.of(context).textTheme.displayMedium,
                        );
                      }
                      return Text(
                        formatMusicDuration(snapshot.data!),
                        style: Theme.of(context).textTheme.displayMedium,
                      );
                    },
                  ),
                  StreamBuilder(
                    stream: _audioService.durationStream,
                    builder: (context, snapshot) {
                      final dur = snapshot.data;
                      if (dur == null) {
                        return Text(
                          formatMusicDuration(Duration.zero),
                          style: Theme.of(context).textTheme.displayMedium,
                        );
                      }
                      return Text(
                        formatMusicDuration(snapshot.data),
                        style: Theme.of(context).textTheme.displayMedium,
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onTap: () {
                      _audioService.previousAudio();
                      setState(() {});
                    },
                    backgroundColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                    innerPadding: const EdgeInsets.all(4),
                    child: const Icon(
                      Icons.skip_previous,
                      color: Palette.fullWhite,
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
                        innerPadding: const EdgeInsets.all(8),
                        child: playerState == null
                            ? const Icon(
                                Icons.play_arrow,
                                color: Palette.fullWhite,
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
                    innerPadding: const EdgeInsets.all(4),
                    child: const Icon(
                      Icons.skip_next,
                      color: Palette.fullWhite,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
