// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MusicModel {
  final String title;
  final String artist;
  final String image;
  final String music;

  MusicModel({
    required this.title,
    required this.artist,
    required this.image,
    required this.music,
  });

  MusicModel copyWith({
    String? title,
    String? artist,
    String? image,
    String? music,
  }) {
    return MusicModel(
      title: title ?? this.title,
      artist: artist ?? this.artist,
      image: image ?? this.image,
      music: music ?? this.music,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'artist': artist,
      'image': image,
      'music': music,
    };
  }

  factory MusicModel.fromMap(Map<String, dynamic> map) {
    return MusicModel(
      title: map['title'] as String,
      artist: map['artist'] as String,
      image: map['image'] as String,
      music: map['music'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MusicModel.fromJson(String source) =>
      MusicModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MusicModel(title: $title, artist: $artist, image: $image, music: $music)';
  }

  @override
  bool operator ==(covariant MusicModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.artist == artist &&
        other.image == image &&
        other.music == music;
  }

  @override
  int get hashCode {
    return title.hashCode ^ artist.hashCode ^ image.hashCode ^ music.hashCode;
  }
}
