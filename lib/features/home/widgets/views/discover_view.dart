import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:piton_tech_project/core/constants/data_constants.dart';
import 'package:piton_tech_project/core/utils/custom_button.dart';
import 'package:piton_tech_project/features/home/widgets/category_view.dart';
import 'package:piton_tech_project/models/music_model.dart';
import 'package:piton_tech_project/themes/palette.dart';
import 'package:piton_tech_project/themes/theme_constants.dart';

class DiscoverView extends ConsumerStatefulWidget {
  const DiscoverView({super.key});

  @override
  ConsumerState<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends ConsumerState<DiscoverView>
    with AutomaticKeepAliveClientMixin<DiscoverView> {
  late final TextEditingController _textController;
  late final PageController _pageController;
  int _currentIndex = 0;

  final OutlineInputBorder _textFieldBorder = ThemeConstants().textFieldBorder;

  final List<String> _categories = DataConstants().categories;
  final List<MusicModel> _musicData = DataConstants().musicData;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _textController = TextEditingController();
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToScreen(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      children: [
        TextField(
          controller: _textController,
          style: Theme.of(context).textTheme.displayMedium,
          decoration: InputDecoration(
            filled: true,
            fillColor: Palette.bottomBar,
            hintText: "Search",
            hintStyle: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Palette.textGrey),
            contentPadding: const EdgeInsets.all(15),
            suffixIcon: const Icon(
              Icons.search,
              size: 28,
              color: Palette.iconGrey,
            ),
            enabledBorder: _textFieldBorder,
            focusedBorder: _textFieldBorder,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 36,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomButton(
                onTap: () {
                  _navigateToScreen(index);
                },
                backgroundColor: Palette.button,
                innerPadding: const EdgeInsets.symmetric(horizontal: 20),
                borderRadius: BorderRadius.circular(36),
                isState: index == _currentIndex,
                stateChild: Text(
                  _categories[index],
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Palette.textGrey),
                ),
                child: Text(
                  _categories[index],
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              CategoryView(musics: _musicData),
              CategoryView(musics: _musicData.sublist(1)),
              CategoryView(musics: _musicData.sublist(2)),
              CategoryView(musics: _musicData.sublist(3)),
            ],
          ),
        ),
      ],
    );
  }
}
