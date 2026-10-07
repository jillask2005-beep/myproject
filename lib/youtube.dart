
import 'package:amazon/srchyt.dart';
import 'package:amazon/ytproduct.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Youtube extends StatefulWidget {
  const Youtube({super.key});
  @override
  State<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (var video in VideoDetails.videos) {
      video.vid!.initialize();
      video.vid!.setLooping(true);
      video.vid!.setVolume(0);
    }
  }
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        body: Container(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: false,
                backgroundColor: Colors.transparent,
                title: Image(image: AssetImage("assets/yt.png",),height: 25,),
                actions: [
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Srchyt()));
                  }, icon: Icon(Icons.search)),
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: VideoDetails.videos.length,
                      (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>Ytproduct(ind: index,)
                            )).then((_) => setState(() {}));
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 220,
                            child: MouseRegion(
                              onEnter: (_) {
                                setState(() {
                                  VideoDetails.videos[index].vid!.play();
                                });
                              },
                              onExit: (_) {
                                setState(() {
                                  VideoDetails.videos[index].vid!.pause();
                                  VideoDetails.videos[index].vid!.seekTo(Duration.zero);
                                });
                              },
                              child: SizedBox(
                                width: double.infinity,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: SizedBox(
                                    width: VideoDetails.videos[index].vid!.value.size.width,
                                    height: VideoDetails.videos[index].vid!.value.size.height,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: VideoPlayer(
                                        VideoDetails.videos[index].vid!,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 30),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                  AssetImage("assets/uk.jpeg"),
                                ),

                                SizedBox(width: 12),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                    children: [

                                      Text(
                                        VideoDetails.videos[index].name!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      SizedBox(height: 6),

                                      Text(
                                        "FlipTube • 1.2M views • 2 days ago",
                                      ),
                                    ],
                                  ),
                                ),

                                Icon(Icons.more_vert),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Video{
  String? name;
  VideoPlayerController? vid;

  Video({this.name, this.vid});

}

class VideoDetails{
  static List<Video> videos=[
    Video(
      name:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
      vid: VideoPlayerController.networkUrl(
  Uri.parse(
  "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  ),
      ),
    ),
    Video(
      name: "Etiam sit amet erat sed turpis elementum malesuada a et tellus. Suspendisse neque orci, sodales et posuere vel, congue at.",
      vid: VideoPlayerController.networkUrl(
        Uri.parse(
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
        ),
      ),
    ),
    Video(
      name: "Duis vel nibh sit amet est imperdiet congue. Suspendisse potenti. Curabitur tincidunt nisi eros, id congue ex molestie id. Sed.",
      vid: VideoPlayerController.networkUrl(
        Uri.parse(
          "https://samplelib.com/lib/preview/mp4/sample-5s.mp4",
        ),
      ),
    ),
    Video(
      name:  "Vivamus pellentesque mi nec tortor luctus, in mollis tellus vestibulum. Proin dignissim libero ac viverra porttitor. Nunc vitae venenatis lectus.",
      vid: VideoPlayerController.networkUrl(
        Uri.parse(
          "https://samplelib.com/lib/preview/mp4/sample-10s.mp4",
        ),
      ),
    ),
    Video(
      name: "Aliquam laoreet nisi eget ante tempus, at tempor felis efficitur. Quisque nec augue gravida libero placerat tristique eget at arcu.",
      vid: VideoPlayerController.networkUrl(
        Uri.parse(
          "https://samplelib.com/lib/preview/mp4/sample-15s.mp4",
        ),
      ),
    ),
    Video(
      name: "Sed ligula ante, euismod sed condimentum in, varius a lectus. Vestibulum eget ex vitae magna auctor viverra et id massa.",
      vid: VideoPlayerController.networkUrl(
        Uri.parse(
          "https://samplelib.com/lib/preview/mp4/sample-20s.mp4",
        ),
      ),
    ),
    Video(
      name: "Etiam mollis pharetra porta. Fusce posuere tellus in arcu posuere, elementum pharetra arcu posuere. Quisque sit amet viverra quam, et.Park",
      vid: VideoPlayerController.networkUrl(
        Uri.parse(
          "https://samplelib.com/lib/preview/mp4/sample-30s.mp4",
        ),
      ),
    ),
    Video(
      name: "Pellentesque dolor ipsum, porta vitae fringilla at, fringilla eget ex. Proin laoreet felis eget justo aliquet varius. Integer egestas, lacus.",
      vid: VideoPlayerController.asset(
        "assets/video1.mp4",
      ),
    ),

    Video(
      name: "Morbi accumsan diam eget nisl scelerisque finibus. Integer congue arcu eu elit tristique consequat. In vel ante est. Nulla pellentesque.",
      vid: VideoPlayerController.asset(
        "assets/video2.mp4",
      ),
    ),

    Video(
      name: "Quisque et interdum risus. Ut et erat ac dui iaculis vehicula sed nec ipsum. Vestibulum accumsan massa laoreet pretium vestibulum.",
      vid: VideoPlayerController.asset(
        "assets/video3.mp4",
      ),
    ),
  ];
}
