import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';

import 'package:glass_kit/glass_kit.dart';
import 'package:flutter_application_3/songlist.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  var fsong =
      'https://msicoursematerial.s3.us-west-2.amazonaws.com/-La_min_Lay_(getmp3.pro).mp3';
  var ssong =
      'https://msicoursematerial.s3.us-west-2.amazonaws.com/Amazing_Day_(getmp3.pro).mp3';
  var tsong =
      'https://msicoursematerial.s3.us-west-2.amazonaws.com/Coldplay+X+Selena+Gomez+-+Let+Somebody+Go+(Official+Video).mp3';
  var fosong =
      'https://msicoursematerial.s3.us-west-2.amazonaws.com/Hugh_Grant_Haley_Bennett_-_A_Way_(getmp3.pro).mp3';
  var songname = '';
  var url = '';
  var pic = 'wolf.png';

  var defdur = const Duration(milliseconds: 0);

  AudioPlayer audioPlayer = AudioPlayer();
  Playlist musicList = Playlist();

  bool PlayPause = false;
  Duration musicLength = Duration();
  Duration position = Duration();

  bool display = false;

  @override
  void initState() {
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        PlayPause = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((Duration d) {
      print('max musicLength: ${d.inSeconds}');
      setState(() => musicLength = d);
    });

    audioPlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });
  }

  Widget slider() {
    return Slider.adaptive(
        min: 0,
        max: musicLength > defdur ? musicLength.inSeconds.toDouble() : 0.0,
        value: musicLength > defdur ? position.inSeconds.toDouble() : 0.0,
        onChanged: (double value) {
          setState(() {
            position = Duration(seconds: value.round());
          });
          // final position = Duration(seconds: value.toInt());
          // await audioPlayer.seek(position);
        });
  }
  // @override
  // void dispose() {
  //   audioPlayer.dispose();

  //   super.dispose();
  // }

  void playbtn() async {
    var res;
    if (PlayPause == true) {
      res = await audioPlayer.pause();
    } else {
      res = await audioPlayer.resume();
    }
    if (res == 1) {
      setState(() {
        PlayPause = !PlayPause;
      });
    }
  }

  String formatTime(Duration musicLength) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(musicLength.inHours);
    final minutes = twoDigits(musicLength.inMinutes.remainder(60));
    final seconds = twoDigits(musicLength.inSeconds.remainder(60));

    return [
      if (musicLength.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Music Player'),
        backgroundColor: const Color.fromARGB(255, 26, 25, 25),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),

          Expanded(
            child: ListView.builder(
              itemCount: musicList.myplaylist.length,
              itemBuilder: (context, index) => musicDesign(
                  musicname: musicList.myplaylist[index].title,
                  id: musicList.myplaylist[index].artist,
                  img: musicList.myplaylist[index].img,
                  name: () {
                    setState(() async {
                      songname = musicList.myplaylist[index].title;
                      url = musicList.myplaylist[index].url;
                      pic = musicList.myplaylist[index].img;
                      display = true;
                      await audioPlayer.play(url);
                      if (PlayPause = false) {
                        PlayPause = !PlayPause;
                      }
                    });
                  }),
            ),
          ),
          // musicDesign(
          //     musicname: 'La Min Lay',
          //     id: ' - R ZarNi',
          //     img: 'a.png',
          //     name: () {
          //       setState(() async {
          //         songname = 'La Min Lay ';
          //         url = fsong;
          //         pic = 'a.png';
          //         await audioPlayer.play(url);
          //         if (PlayPause = false) {
          //           PlayPause = !PlayPause;
          //         }
          //       });
          //     }),
          // const SizedBox(
          //   height: 10,
          // ),
          // musicDesign(
          //     musicname: 'Amazing Day',
          //     id: ' - Coldplay',
          //     img: 'b.png',
          //     name: () {
          //       setState(() async {
          //         songname = 'Amazing Day';
          //         url = ssong;
          //         pic = 'b.png';
          //         await audioPlayer.play(url);
          //         if (PlayPause = false) {
          //           PlayPause = !PlayPause;
          //         }
          //       });
          //     }),
          // const SizedBox(
          //   height: 10,
          // ),
          // musicDesign(
          //     musicname: 'Let Somebody Go',
          //     id: ' - Coldplay + Selena Gomez',
          //     img: 'c.jpg',
          //     name: () {
          //       setState(() async {
          //         songname = 'Let Somebody Go';
          //         url = tsong;
          //         pic = 'c.jpg';
          //         await audioPlayer.play(url);
          //         if (PlayPause = false) {
          //           PlayPause = !PlayPause;
          //         }
          //       });
          //     }),
          // const SizedBox(
          //   height: 10,
          // ),
          // musicDesign(
          //     musicname: 'Way Back Into Love',
          //     id: ' - Hugh Grant',
          //     img: 'd.png',
          //     name: () {
          //       setState(() async {
          //         songname = 'Way Back Into Love';
          //         url = fosong;
          //         pic = 'd.png';
          //         await audioPlayer.play(url);
          //         if (PlayPause = false) {
          //           PlayPause = !PlayPause;
          //         }
          //       });
          //     }),
          const SizedBox(
            height: 10,
          ),
          display
              ? GlassContainer.clearGlass(
                  height: 250,
                  width: double.infinity,
                  borderColor: Colors.black,
                  gradient: const LinearGradient(
                    colors: [
                      Colors.grey,
                      Colors.blueGrey,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/$pic'),
                                    fit: BoxFit.fill,
                                  ),
                                )),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            songname,
                            style: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          slider(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(formatTime(position)),
                                Text(formatTime(musicLength)),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 30,
                            child: IconButton(
                                onPressed: (() {
                                  playbtn();
                                }),
                                splashRadius: 20,
                                iconSize: 30,
                                icon: PlayPause
                                    ? const Icon(Icons.pause)
                                    : const Icon(Icons.play_arrow)),
                          ),
                        ]),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}

class musicDesign extends StatelessWidget {
  final Function name;
  final String id;
  final String musicname;
  final String img;

  const musicDesign(
      {Key? key,
      required this.name,
      required this.musicname,
      required this.id,
      required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            return name();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/$img'),
                                fit: BoxFit.fill,
                              ),
                            ))),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          musicname,
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          id,
                          style: const TextStyle(
                            fontSize: 8,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: (() {}), icon: const Icon(Icons.more_horiz))
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
