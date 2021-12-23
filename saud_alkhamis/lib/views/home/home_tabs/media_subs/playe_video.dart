// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  String url;
  VideoPlayer({Key key, @required this.url}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState(url: url);
}

class _VideoPlayerState extends State<VideoPlayer> {
  String url;
  _VideoPlayerState({@required this.url});
  YoutubePlayerController _controller;
  TextEditingController _idController;
  TextEditingController _seekToController;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: url,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    _idController = TextEditingController();
    _seekToController = TextEditingController();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Text(
            _controller.metadata.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
        onEnded: (data) {
          _controller.dispose();
          Navigator.of(context).pop();
        },
      ),
      builder: (context, player) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    _controller.dispose();
                    Navigator.of(context).pop();
                  },
                  color: whiteFonts,
                  textColor: darkFonts,
                  child: ImageIcon(
                    AssetImage('assets/images/icons/close.png'),
                    size: 14,
                  ),
                  padding: EdgeInsets.all(10),
                  shape: CircleBorder(),
                ),
                player,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
