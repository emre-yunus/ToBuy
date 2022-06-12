import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Recipe extends StatefulWidget {
  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  VideoPlayerController videoController =
      VideoPlayerController.asset("assets/video/cupcake.mp4");

  void initState() {
    videoController.setLooping(true);
    videoController.initialize();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFCFFF3C8),
      padding: const EdgeInsets.all(10),
      child: ListView(children: <Widget>[
        AspectRatio(
            aspectRatio: 640 / 360, // breedte gedeeld door hoogte
            child: VideoPlayer(videoController)),
        Container(
          margin: const EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 0.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff6e3945),
            ),
            onPressed: () {
              setState(() {
                videoController.value.isPlaying
                    ? videoController.pause()
                    : videoController.play();
              });
            },
            child: videoController.value.isPlaying
                ? const Icon(
                    Icons.pause,
                    size: 60,
                    color: Color(0xFCFFF3C8),
                  )
                : const Icon(
                    Icons.play_arrow,
                    size: 60,
                    color: Color(0xFCFFF3C8),
                  ),
          ),
        ),
      ]),
    );
  }
}
