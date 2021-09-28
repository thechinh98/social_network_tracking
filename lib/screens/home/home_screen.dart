import 'package:flutter/material.dart';
import 'package:flutter_youtube_followers/screens/instagram/instagram_screen.dart';
import 'package:flutter_youtube_followers/screens/youtube/youtube_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _listChildren = [YouTubeLoginScreen(), InstagramLoginScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Social network informations tracking"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.video_collection), label: "Youtube"),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt_outlined), label: "Instagram"),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
      body: SafeArea(
        child: IndexedStack(
          children: _listChildren,
          index: _currentIndex,
        ),
      ),
    );
  }
}
