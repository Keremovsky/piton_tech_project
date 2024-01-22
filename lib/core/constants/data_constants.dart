import 'package:piton_tech_project/core/constants/assets_constants.dart';
import 'package:piton_tech_project/models/music_model.dart';
import 'package:piton_tech_project/models/notification_model.dart';

class DataConstants {
  final categories = ["All", "Life", "Comedy", "Technology"];
  final musicData = [
    MusicModel(
      title: "The missing 96 percent of the universe",
      artist: "Claire Malone",
      image: AssetsConstants.albumPhoto0,
      music:
          "https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3",
    ),
    MusicModel(
      title: "How Dolly Parton led me to an epiphany",
      artist: "Abumenyang",
      image: AssetsConstants.albumPhoto1,
      music:
          "https://archive.org/download/igm-v8_202101/IGM%20-%20Vol.%208/15%20Pokemon%20Red%20-%20Cerulean%20City%20%28Game%20Freak%29.mp3",
    ),
    MusicModel(
      title: "The missing 96 percent of the universe",
      artist: "Tir McDohl",
      image: AssetsConstants.albumPhoto2,
      music:
          "https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3",
    ),
    MusicModel(
      title: "Ngobam with Denny Caknan",
      artist: "Denny Kulon",
      image: AssetsConstants.albumPhoto3,
      music:
          "https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3",
    ),
  ];
  final notificationData = [
    NotificationModel(
      title: "Rammstein New Album",
      description: "New Rammstein album will be released in August 2024!",
      image: AssetsConstants.rammstein,
      isSeen: false,
    ),
    NotificationModel(
      title: "Golden Requiem",
      description: "New Jojo's Bizarre Adventure song just released!",
      image: AssetsConstants.goldenRequiem,
      isSeen: false,
    ),
    NotificationModel(
      title: "Similar to Feel Good Inc.",
      description: "Rhinestone Eyes is similar to songs that you listen.",
      image: AssetsConstants.feelGood,
      isSeen: false,
    ),
  ];
}
