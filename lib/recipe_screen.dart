import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Recipe extends StatefulWidget {
  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  VideoPlayerController videoController = VideoPlayerController.asset("assets/video/cupcake.mp4");

  void initState() {
    videoController.setLooping(true);
    videoController.initialize();
    super.initState();
  }

  Widget build(BuildContext context) {
    return ListView(
        children: <Widget>[
          AspectRatio(
              aspectRatio: 640 / 360,  // breedte gedeeld door hoogte
              child: VideoPlayer(videoController)
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                videoController.value.isPlaying ? videoController.pause() : videoController.play();
              });
            },
            child: videoController.value.isPlaying ? Icon(Icons.pause, size: 60) : Icon(Icons.play_arrow, size: 60),
          ),
        ]
    );
  }
}