import 'package:flutter/cupertino.dart';
import 'package:flutter_youtube_followers/model/channel.dart';
import 'package:flutter_youtube_followers/services/google_service.dart';
import 'package:rxdart/rxdart.dart';

class YoutubeBloc {
  final GoogleAPIService _googleAPIService = GoogleAPIService.instance;
  TextEditingController channelSearchText = TextEditingController();
  bool isSearch = false;
  var _channelSubject = PublishSubject<Channel>();
  Stream<Channel> get channelStream => _channelSubject.stream;

  void searchButtonPressed() async {
    String channelName = channelSearchText.text;
    String channelId =
        await _googleAPIService.searchChannel(channelName: channelName);
    Channel channel =
        await _googleAPIService.fetchChannel(channelId: channelId);
    _channelSubject.add(channel);
  }
}
