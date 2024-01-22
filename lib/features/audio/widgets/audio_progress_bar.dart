import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:piton_tech_project/core/utils.dart';
import 'package:piton_tech_project/features/audio/audio_service/audio_service.dart';
import 'package:piton_tech_project/features/audio/widgets/audio_volume_painter.dart';

class AudioProgressBar extends ConsumerStatefulWidget {
  final double height;

  const AudioProgressBar({
    super.key,
    required this.height,
  });

  @override
  ConsumerState<AudioProgressBar> createState() => _AudioProgressBarState();
}

class _AudioProgressBarState extends ConsumerState<AudioProgressBar> {
  late final List<double> _randomNumbers;
  late final AudioService _audioService;

  @override
  void initState() {
    _randomNumbers = getRandomDoubles(500);
    _audioService = ref.read(audioServiceProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: Builder(
        builder: (context) {
          final width = MediaQuery.of(context).size.width - 40;
          final count = width / 13;
          final secondsPart = _audioService.totalDuration.inSeconds / count;

          List<Widget> volumeBars = [];
          for (var i = 0; i < count; i++) {
            volumeBars.add(
              StreamBuilder(
                  stream: _audioService.positionStream,
                  builder: (context, snapshot) {
                    final data = snapshot.data ?? Duration.zero;

                    return GestureDetector(
                      onTap: () async {
                        await _audioService.seekToDuration(
                          Duration(seconds: i * _formatPart(secondsPart)),
                        );
                      },
                      child: SizedBox(
                        height: 40,
                        width: 10,
                        child: CustomPaint(
                          painter: AudioVolumePainter(
                            volumeSize: _randomNumbers[i],
                            width: 10,
                            y: 20,
                            isReached:
                                i * _formatPart(secondsPart) < data.inSeconds,
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: volumeBars,
          );
        },
      ),
    );
  }
}

int _formatPart(double part) {
  return part.floorToDouble().toInt();
}
