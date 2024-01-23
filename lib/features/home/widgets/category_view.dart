import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:piton_tech_project/core/constants/router_constants.dart';
import 'package:piton_tech_project/core/utils/image_demonstrator.dart';
import 'package:piton_tech_project/features/audio/audio_service/audio_service.dart';
import 'package:piton_tech_project/features/audio/widgets/music_box.dart';
import 'package:piton_tech_project/models/music_model.dart';
import 'package:responsive_grid/responsive_grid.dart';

class CategoryView extends ConsumerStatefulWidget {
  final List<MusicModel> musics;

  const CategoryView({super.key, required this.musics});

  @override
  ConsumerState<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends ConsumerState<CategoryView> {
  final List<MusicBox> _musicBoxes = [];

  void _createMusicBoxes() {
    for (var i = 0; i < widget.musics.length; i++) {
      _musicBoxes.add(
        MusicBox(
          onTap: () async {
            await ref.read(audioServiceProvider.notifier).updateAudio(
                  widget.musics,
                  i,
                );
            if (mounted) {
              context.pushNamed(RouterConstants.musicScreenName);
            }
          },
          padding: i % 2 == 0
              ? const EdgeInsets.only(right: 5, bottom: 10)
              : const EdgeInsets.only(left: 5, bottom: 10),
          titleText: widget.musics[i].title,
          descriptionText: widget.musics[i].artist,
          image: ImageDemonstrator(
            imageProvider: AssetImage(widget.musics[i].image),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    _createMusicBoxes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Row(
          children: [
            Text(
              "Trending",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 5),
        Expanded(
          child: ResponsiveGridList(
            desiredItemWidth: width / 3,
            children: _musicBoxes,
          ),
        ),
      ],
    );
  }
}
