import 'package:flutter_youtube_followers/model/statistics.dart';

class Channel {

  final String id;
  final String title;
  final String profilePictureUrl;
  final String subscriberCount;
  final String videoCount;

  Channel({
    this.id = "",
    this.title = "",
    this.profilePictureUrl = "",
    this.subscriberCount = "",
    this.videoCount = "",
  });

  factory Channel.fromMap(Map<String, dynamic> map) {
    return Channel(
      id: map['id'],
      title: map['snippet']['title'],
      profilePictureUrl: map['snippet']['thumbnails']['default']['url'],
      subscriberCount: map['statistics']['subscriberCount'],
      videoCount: map['statistics']['videoCount'],
    );
  }

}