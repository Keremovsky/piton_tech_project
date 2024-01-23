import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:piton_tech_project/core/utils.dart';
import 'package:piton_tech_project/features/audio/audio_service/audio_service.dart';
import 'package:piton_tech_project/features/audio/widgets/audio_progress_bar.dart';
import 'package:piton_tech_project/features/audio/widgets/music_box.dart';
import 'package:piton_tech_project/features/audio/widgets/player_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            await _audioService.pauseAudio();
            if (mounted) {
              context.pop();
            }
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
              // music data
              StreamBuilder(
                stream: _audioService.currentMusicStream,
                builder: (context, snapshot) {
                  final currentMusic = snapshot.data;

                  if (currentMusic == null) {
                    return const SizedBox();
                  }

                  return MusicBox(
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
                  );
                },
              ),
              const SizedBox(height: 15),
              const AudioProgressBar(height: 40), // progress bar
              const SizedBox(height: 10),
              // display duration
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
              const PlayerController(), // player controller
            ],
          ),
        ),
      ),
    );
  }
}
