import 'package:amazon/youtube.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Ytproduct extends StatefulWidget {
  final int ind;
  const Ytproduct({super.key, required this.ind});

  @override
  State<Ytproduct> createState() => _YtproductState();
}

class _YtproductState extends State<Ytproduct> {
  late VideoPlayerController controller;
  bool showControls = true;
  @override
  void initState() {
    super.initState();
    controller = VideoDetails.videos[widget.ind].vid!;
    if (!controller.value.isInitialized) {
      controller.initialize().then((_) {
        controller.setVolume(1.0);
        controller.play();
        setState(() {});
      });
    } else {
      controller.setVolume(1.0);
      controller.play();
    }
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          if(showControls){
            Navigator.pop(context);
          }
        }, icon: Icon(showControls?Icons.arrow_back:null)),
        iconTheme:  IconThemeData(color: showControls?Colors.white54:Colors.transparent),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: controller.value.isInitialized
                ? GestureDetector(
              onTap: () {
                setState(() {
                  controller.value.isPlaying
                      ? controller.pause()
                      : controller.play();
                });
              },
              child: controller.value.isInitialized
                  ? Center(
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
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
              )
                  :  Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            )
                :  SizedBox(
              height: 220,
              child: Center(child: CircularProgressIndicator(color: Colors.red)),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    VideoDetails.videos[widget.ind].name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:  TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   SizedBox(height: 6),

                   Text(
                    "245K views • 5 hours ago",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                   SizedBox(height: 16),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:  Row(
                            children: [
                              Icon(Icons.thumb_up_alt_outlined, size: 16),
                              SizedBox(width: 6),
                              Text("12K", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                         SizedBox(width: 8),
                        Container(
                          padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:  Row(
                            children: [
                              Icon(Icons.thumb_down_alt_outlined, size: 16),
                              SizedBox(width: 6),
                              Text("Dislike", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                         SizedBox(width: 8),

                        Container(
                          padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:  Row(
                            children: [
                              Icon(Icons.share_outlined, size: 16),
                              SizedBox(width: 6),
                              Text("Share", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                   Divider(height: 28, thickness: 1),
                  Row(
                    children: [
                       CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 16,
                        child: Icon(Icons.person, color: Colors.black54),
                      ),
                       SizedBox(width: 10),
                       Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Channel Name",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Text(
                              "1.2M subscribers",
                              style: TextStyle(color: Colors.grey, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape:  StadiumBorder(),
                          elevation: 0,
                          padding:  EdgeInsets.symmetric(horizontal: 14),
                        ),
                        child:  Text("Subscribe", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                   Divider(height: 28, thickness: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
