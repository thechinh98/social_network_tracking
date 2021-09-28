import 'package:flutter/material.dart';
import 'package:flutter_youtube_followers/model/channel.dart';
import 'package:flutter_youtube_followers/screens/youtube/youtube_bloc.dart';

class YouTubeLoginScreen extends StatefulWidget {
  const YouTubeLoginScreen({Key? key}) : super(key: key);

  @override
  _YouTubeLoginScreenState createState() => _YouTubeLoginScreenState();
}

class _YouTubeLoginScreenState extends State<YouTubeLoginScreen> {
  YoutubeBloc _bloc = YoutubeBloc();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Search Youtube Channel",
            style: TextStyle(fontSize: 20),
          ),
          TextField(
            controller: _bloc.channelSearchText,
          ),
          ElevatedButton(
              onPressed: () {
                _bloc.searchButtonPressed();
              },
              child: const Text("Search")),
          StreamBuilder(stream: _bloc.channelStream,builder: (context, snapshot){
            if(snapshot.hasData){
              Channel channel = snapshot.data as Channel;
              return Center(
                child: ChannelWidget(channel: channel,),
              );
            }
            return Center(child: const Text("Search results will display there"));
          })
        ],
      ),
    );
  }
}

class ChannelWidget extends StatelessWidget {
  const ChannelWidget({
    Key? key,
    required this.channel,
  }) : super(key: key);
  final Channel channel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Image.network(channel.profilePictureUrl, fit: BoxFit.cover,),
        ),
        title: Text(channel.title),
        subtitle: Text('${channel.subscriberCount} subscribers'),
      ),
    );
  }
}
