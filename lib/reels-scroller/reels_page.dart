// ignore_for_file: invalid_use_of_protected_member

import 'package:demo/comments/comment_controller.dart';
import 'package:demo/comments/comment_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';

CommentsController commentsList = Get.put(CommentsController());

Rx<bool> _isLoading = false.obs;

class videoController extends GetxController {
  RxList<bool> isInit = [false, false, false].obs;

  RxList<VideoPlayerController> listcontroller = [
    //1
    VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
      videoPlayerOptions: VideoPlayerOptions(
        allowBackgroundPlayback: true,
      ),
    ),
    //2
    VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
      videoPlayerOptions: VideoPlayerOptions(
        allowBackgroundPlayback: true,
      ),
    ),
    //3
    VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
      videoPlayerOptions: VideoPlayerOptions(
        allowBackgroundPlayback: true,
      ),
    )
  ].obs;

  //Initializing videos
  void listInitialize() async {
    try {
      _isLoading.value = true;
      for (var i = 0; i < 3; i++) {
        listcontroller.value[i].initialize().then(
          (value) {
            isInit.value[i] = true;
          },
        );
        print("The ITERATOR IS ON THE INDEX =====> $i");
        isInit.value[i] = true;
      }
      print("COMPLETED");
      _isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }
}

videoController vidcontroller = videoController();

class ReelsScreen extends StatefulWidget {
  ReelsScreen({Key? key}) : super(key: key);

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    vidcontroller.listInitialize();
    return Scaffold(
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        padEnds: false,
        onPageChanged: (i) {
          print(i);
          vidcontroller.listcontroller.value[i].play();
        },
        children: const [
          SinglePage(i: 0),
          SinglePage(i: 1),
          SinglePage(i: 2),
        ],
      ),
    );
  }
}

class SinglePage extends StatelessWidget {
  const SinglePage({
    Key? key,
    required this.i,
  }) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    vidcontroller.listcontroller.value[i].play();

    return Obx(() {
      return Stack(children: [
        Obx(
          () => (vidcontroller.isInit[i] == true)
              ? GestureDetector(
                  child: Container(
                    color: Colors.black,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: vidcontroller
                            .listcontroller.value[i].value.aspectRatio,
                        child:
                            VideoPlayer(vidcontroller.listcontroller.value[i]),
                      ),
                    ),
                  ),
                  onTap: () {
                    vidcontroller.listcontroller.value[i].value.isPlaying
                        ? vidcontroller.listcontroller.value[i].pause()
                        : vidcontroller.listcontroller.value[i].play();
                  },
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 8,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/user.jpg"),
                            radius: 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            commentsList.comments[0].user,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const Text(
                        "This is the very long description of the videos which has many lines This is the very long description of the videos which has many lines This is the very long description of the videos which has many lines This is the very long description of the videos which has many lines",
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 2,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const Flexible(flex: 1, child: Buttons())
              ],
            ),
          ),
        ),
      ]);
    });
  }
}

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite,
            color: Colors.white,
          ),
        ),
        IconButton(
            onPressed: () {
              showBottomSheets(context);
            },
            icon: const Icon(
              Icons.message_outlined,
              color: Colors.white,
            )),
        IconButton(
          onPressed: () {
            Share.share(
              'Check out this amazing reel only on JANTA24 Application right now!! Share it with your friends and relatives',
              subject: 'Look what I made!',
            );
          },
          icon: const Icon(
            Icons.share,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}


/*
import 'package:demo/comments/comment_controller.dart';
import 'package:demo/comments/comment_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';

CommentsController commentsList = Get.put(CommentsController());

class videoController extends GetxController {
  Rx<bool> isInit = false.obs;
  Rx<VideoPlayerController> controller = VideoPlayerController.networkUrl(
    Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
    videoPlayerOptions: VideoPlayerOptions(
      allowBackgroundPlayback: true,
    ),
  ).obs;

  RxList<VideoPlayerController> listcontroller = [
    VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
      videoPlayerOptions: VideoPlayerOptions(
        allowBackgroundPlayback: true,
      ),
    ),
    VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
      videoPlayerOptions: VideoPlayerOptions(
        allowBackgroundPlayback: true,
      ),
    ),
    VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
      videoPlayerOptions: VideoPlayerOptions(
        allowBackgroundPlayback: true,
      ),
    )
  ].obs;

  void initialize() async {
    try {
      controller.value = VideoPlayerController.networkUrl(
        Uri.parse(
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
        videoPlayerOptions: VideoPlayerOptions(
          allowBackgroundPlayback: true,
        ),
      )..initialize().then(
          (value) {
            print(controller.value.value.isInitialized);
            isInit.value = true;
            controller.value.play();
          },
        );
    } catch (e) {
      print(e);
    }
  }

  void listInitialize() async {
    try {
      for (var i = 0; i < listcontroller.length; i++) {
        // ignore: invalid_use_of_protected_member
        listcontroller.value[i].initialize().then(
          (value) {
            print(i);
            print(controller.value.value.isInitialized);
            isInit.value = true;
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }
}

videoController vidcontroller = videoController();

class ReelsScreen extends StatefulWidget {
  ReelsScreen({Key? key}) : super(key: key);

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    vidcontroller.listInitialize();
    return Scaffold(
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        padEnds: false,
        children: [
          SinglePage(),
          SinglePage(),
          SinglePage(),
          SinglePage(),
          SinglePage(),
        ],
      ),
    );
  }
}

class SinglePage extends StatelessWidget {
  const SinglePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // vidcontroller.initialize();
    print(vidcontroller.controller.value.value.isInitialized);
    vidcontroller.listcontroller.value[0].play();

    return Obx(() {
      return Stack(children: [
        // (vidcontroller.isInit == true)
        //     ? GestureDetector(
        //         child: Container(
        //           color: Colors.black,
        //           height: MediaQuery.of(context).size.height,
        //           width: MediaQuery.of(context).size.width,
        //           child: Center(
        //             child: AspectRatio(
        //               aspectRatio:
        //                   vidcontroller.controller.value.value.aspectRatio,
        //               child: VideoPlayer(vidcontroller.controller.value),
        //             ),
        //           ),
        //         ),
        //         onTap: () {
        //           vidcontroller.controller.value.value.isPlaying
        //               ? vidcontroller.controller.value.pause()
        //               : vidcontroller.controller.value.play();
        //         },
        //       )
        //     : Container(
        //         height: MediaQuery.of(context).size.height,
        //         width: MediaQuery.of(context).size.width,
        //         color: Colors.black,
        //         child: const Center(
        //           child: CircularProgressIndicator(),
        //         ),
        //       ),
        GestureDetector(
          child: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: AspectRatio(
                aspectRatio:
                    vidcontroller.listcontroller.value[0].value.aspectRatio,
                child: VideoPlayer(vidcontroller.listcontroller.value[0]),
              ),
            ),
          ),
          onTap: () {
            vidcontroller.listcontroller.value[0].value.isPlaying
                ? vidcontroller.listcontroller.value[0].pause()
                : vidcontroller.listcontroller.value[0].play();
          },
        ),

        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 8,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/user.jpg"),
                            radius: 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            commentsList.comments[0].user,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const Text(
                        "This is the very long description of the videos which has many lines This is the very long description of the videos which has many lines This is the very long description of the videos which has many lines This is the very long description of the videos which has many lines",
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 2,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const Flexible(flex: 1, child: Buttons())
              ],
            ),
          ),
        ),
      ]);
    });
  }
}

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite,
            color: Colors.white,
          ),
        ),
        IconButton(
            onPressed: () {
              showBottomSheets(context);
            },
            icon: const Icon(
              Icons.message_outlined,
              color: Colors.white,
            )),
        IconButton(
          onPressed: () {
            Share.share(
              'Check out this amazing reel only on JANTA24 Application right now!! Share it with your friends and relatives',
              subject: 'Look what I made!',
            );
          },
          icon: const Icon(
            Icons.share,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

*/