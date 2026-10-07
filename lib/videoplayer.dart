import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Videoplayer extends StatefulWidget {
  const Videoplayer({super.key});
  @override
  State<Videoplayer> createState() => _VideoplayerState();
}

class _VideoplayerState extends State<Videoplayer> {
  late VideoPlayerController controller;
  bool showControls = true;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.networkUrl(
      Uri.parse(
        "https://storage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
      ),
    );

    controller.initialize().then((_) {
      if (mounted) {
        setState(() {});
      }
    });

    controller.addListener(() {
      if (!mounted) return;
      final isFinished =
          controller.value.position >= controller.value.duration;
      if (isFinished) {
        controller.pause();
        controller.seekTo(Duration.zero);
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Video Player"),
      ),
      body: controller.value.isInitialized
          ? Center(
        child: Padding(
          padding:  EdgeInsets.all(16.0),
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: VideoPlayer(controller),
                  ),

                  Positioned.fill(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() {
                          showControls = !showControls;
                        });
                      },
                      child: Container(
                        color: showControls?Colors.black.withOpacity(0.3):Colors.transparent,
                      ),
                    ),
                  ),
                  if (showControls)
                    Center(
                      child: IconButton(
                        iconSize: 50,
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            controller.value.isPlaying
                                ? controller.pause()
                                : controller.play();
                          });
                        },
                        icon: Icon(
                          controller.value.isPlaying
                              ? Icons.pause_circle
                              : Icons.play_circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      )
          :  Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
