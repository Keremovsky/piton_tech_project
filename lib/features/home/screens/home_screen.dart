import 'package:flutter/material.dart';
import 'package:piton_tech_project/core/constants/theme_constants.dart';
import 'package:piton_tech_project/core/custom_icons_icons.dart';
import 'package:piton_tech_project/core/utils/custom_button.dart';
import 'package:piton_tech_project/features/home/widgets/custom_drawer.dart';
import 'package:piton_tech_project/themes/palette.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();
  final OutlineInputBorder _textFieldBorder = ThemeConstants().textFieldBorder;
  final List<String> _categories = ["All", "Life", "Comedy", "Technology"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        title: Text(
          "Podkes",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CustomIcons.notify_no),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: ThemeConstants.screenPadding,
          child: Column(
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
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
