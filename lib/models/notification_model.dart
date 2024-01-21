// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NotificationModel {
  final String title;
  final String description;
  final String image;
  final bool isSeen;

  NotificationModel({
    required this.title,
    required this.description,
    required this.image,
    required this.isSeen,
  });

  NotificationModel copyWith({
    String? title,
    String? description,
    String? image,
    bool? isSeen,
  }) {
    return NotificationModel(
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      isSeen: isSeen ?? this.isSeen,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
      'isSeen': isSeen,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      isSeen: map['isSeen'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NotificationModel(title: $title, description: $description, image: $image, isSeen: $isSeen)';
  }

  @override
  bool operator ==(covariant NotificationModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.image == image &&
        other.isSeen == isSeen;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        image.hashCode ^
        isSeen.hashCode;
  }
}
