import 'package:flutter/material.dart';
import 'package:musicplayer/Services/songList.dart';
import 'package:musicplayer/Widgets/widgets.dart';

class SongName extends StatefulWidget {
  @override
  _SongNameState createState() => _SongNameState();
}

class _SongNameState extends State<SongName> {
  //Declarations
  List _songs;
  List _thumbnails;
  bool _songsLoaded = false;
  SongList _songList = SongList();
  Widgetbuilder _widgetBuilder = Widgetbuilder();
  @override
  void initState() {
    _fetchSongs();
    super.initState();
  }

  //Functions
  _fetchSongs() async {
    _songs = await _songList.getSongList();
    _thumbnails=await _songList.getThumbnailList();
    setState(() {
      _songsLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _songsLoaded
          ? _widgetBuilder.gridViewBuilder(_songs,_thumbnails)
          : Center(child: Image.asset('assets/progressIndiator.gif')),
    );
  }
}
