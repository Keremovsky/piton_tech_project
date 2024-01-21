import 'package:flutter/material.dart';
import 'package:piton_tech_project/core/constants/data_constants.dart';
import 'package:piton_tech_project/core/utils/custom_button.dart';
import 'package:piton_tech_project/features/home/widgets/music_box.dart';
import 'package:piton_tech_project/models/music_model.dart';
import 'package:piton_tech_project/themes/palette.dart';
import 'package:piton_tech_project/themes/theme_constants.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverView> {
  final TextEditingController _controller = TextEditingController();
  final OutlineInputBorder _textFieldBorder = ThemeConstants().textFieldBorder;

  final List<String> _categories = DataConstants().categories;
  final List<MusicModel> _musics = DataConstants().musicData;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
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
                onTap: () {},
                backgroundColor: Palette.button,
                innerPadding: const EdgeInsets.symmetric(horizontal: 20),
                borderRadius: BorderRadius.circular(36),
                child: Text(
                  _categories[index],
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 5),
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
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1 / 1.4,
            ),
            itemCount: _musics.length,
            itemBuilder: (BuildContext context, int index) {
              return MusicBox(
                onTap: () {},
                image: Image.asset(
                  _musics[index].image,
                  fit: BoxFit.cover,
                ),
                titleText: _musics[index].title,
                descriptionText: _musics[index].artist,
              );
            },
          ),
        ),
      ],
    );
  }
}
