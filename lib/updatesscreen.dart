import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// video item
class VideoItem {
  final String title;
  final String videoId;
  final String channel;

  VideoItem({required this.title, required this.videoId, required this.channel});

  factory VideoItem.fromJson(Map<String, dynamic> json) {
    final id = json['id']['videoId'];
    final snippet = json['snippet'];
    return VideoItem(
      title: snippet['title'],
      videoId: id,
      channel: snippet['channelTitle'],
    );
  }
}

// YouTube API service
class YouTubeService {
  static const String _apiKey = 'AIzaSyBdcVzFIVoC-51BjJtpg686q5CZnjMvrfU'; // Youtube API key
  static const String _baseUrl = 'https://www.googleapis.com/youtube/v3/search';

  static Future<List<VideoItem>> fetchVideos(String query) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl?part=snippet&maxResults=10&q=$query&type=video&key=$_apiKey'));

    if (response.statusCode == 200) {
      final List items = json.decode(response.body)['items'];
      return items.map((item) => VideoItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load videos');
    }
  }
}

// Main news screen
class TechNewsScreen extends StatefulWidget {
  @override
  _TechNewsScreenState createState() => _TechNewsScreenState();
}

class _TechNewsScreenState extends State<TechNewsScreen> {
  List<VideoItem> _videos = [];
  bool _loading = true;
  String _query = 'tech innovation';

  @override
  void initState() {
    super.initState();
    _fetchVideos();
  }

  Future<void> _fetchVideos() async {
    setState(() => _loading = true);
    try {
      _videos = await YouTubeService.fetchVideos(_query);
    } catch (e) {
      print(e);
    } finally {
      setState(() => _loading = false);
    }
  }

  void _onSearch(String query) {
    _query = query;
    _fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _loading
          ? Center(child: CircularProgressIndicator(color: Colors.red))
          : Column(
              children: [
                _buildSearchBar(),
                Expanded(
                  child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _videos.length,
                    itemBuilder: (context, index) {
                      final video = _videos[index];
                      final controller = YoutubePlayerController(
                        initialVideoId: video.videoId,
                        flags: YoutubePlayerFlags(autoPlay: true, mute: false),
                      );
                      return YoutubePlayerBuilder(
                        player: YoutubePlayer(controller: controller),
                        builder: (context, player) {
                          return Stack(
                            children: [
                              Center(child: player),
                              Positioned(
                                bottom: 80,
                                left: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      video.title,
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    ),
                                    Text(
                                      video.channel,
                                      style: TextStyle(color: Colors.white70, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 16,
                                bottom: 100,
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(FontAwesomeIcons.heart, color: Colors.white),
                                      onPressed: () {},
                                    ),
                                    SizedBox(height: 12),
                                    IconButton(
                                      icon: Icon(FontAwesomeIcons.comment, color: Colors.white),
                                      onPressed: () {},
                                    ),
                                    SizedBox(height: 12),
                                    IconButton(
                                      icon: Icon(FontAwesomeIcons.share, color: Colors.white),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildSearchBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          onSubmitted: _onSearch,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search tech topics...',
            hintStyle: TextStyle(color: Colors.white54),
            fillColor: Colors.white12,
            filled: true,
            prefixIcon: Icon(Icons.search, color: Colors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
