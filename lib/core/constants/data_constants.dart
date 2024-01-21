import 'package:piton_tech_project/core/constants/assets_constants.dart';
import 'package:piton_tech_project/models/music_model.dart';

class DataConstants {
  final categories = ["All", "Life", "Comedy", "Technology"];
  final musicData = [
    MusicModel(
      title: "The missing 96 percent of the universe",
      artist: "Claire Malone",
      image: AssetsConstants.albumPhoto0,
      music: "",
    ),
    MusicModel(
      title: "How Dolly Parton led me to an epiphany",
      artist: "Abumenyang",
      image: AssetsConstants.albumPhoto1,
      music: "",
    ),
    MusicModel(
      title: "The missing 96 percent of the universe",
      artist: "Tir McDohl",
      image: AssetsConstants.albumPhoto2,
      music: "",
    ),
    MusicModel(
      title: "Ngobam with Denny Caknan",
      artist: "Denny Kulon",
      image: AssetsConstants.albumPhoto3,
      music: "",
    ),
  ];
}
