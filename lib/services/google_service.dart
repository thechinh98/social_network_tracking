import 'dart:convert';
import 'dart:io';
import 'package:flutter_youtube_followers/model/channel.dart';
import 'package:flutter_youtube_followers/utilities/keys.dart';
import 'package:http/http.dart' as http;

class GoogleAPIService{
  GoogleAPIService._instantiate();
  static final GoogleAPIService instance = GoogleAPIService._instantiate();
  final String _baseUrl = "www.googleapis.com";
  Future<Channel> fetchChannel({required String channelId}) async {
    Map<String, String> parameters = {
      'part': 'snippet, contentDetails, statistics',
      'id': channelId,
      'key': API_KEY,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    // Get Channel
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body)['items'][0];
      Channel channel = Channel.fromMap(data);
      return channel;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }
  Future<String> searchChannel({required String channelName})async{
    Map<String,String> parameters = {
      'part': 'snippet',
      'key': API_KEY,
      'type': 'channel',
      'maxResult': "1",
      'q': channelName,
    };
    Uri uri = Uri.https(_baseUrl, "/youtube/v3/search",parameters);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    var response = await http.get(uri, headers: headers);

    if(response.statusCode == 200){
      String data = json.decode(response.body)['items'][0]['id']['channelId'];
      return data;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }
}