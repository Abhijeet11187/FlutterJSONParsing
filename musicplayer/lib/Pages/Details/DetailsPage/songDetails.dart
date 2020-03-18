import 'package:flutter/material.dart';
import 'package:musicplayer/Services/songList.dart';
import 'package:musicplayer/Model/songDetailModel.dart';
import 'package:musicplayer/Widgets/widgets.dart';

class SongDetails extends StatefulWidget {
  static const routeName = "/songdetails";
  @override
  _SongDetailsState createState() => _SongDetailsState();
}

class _SongDetailsState extends State<SongDetails> {
  //Declarations
  static var argumentindex;
  bool _isDetailsFetched = false;
  Widgetbuilder _widgetbuilder = Widgetbuilder();
  SongList _songList = SongList();
  SongDetailModel _songModel;
  static dynamic _songDetails;

  //Functions
  _getSongDetails() async {
    if (!_isDetailsFetched) {
      _songDetails = await _songList.getSongDetails(argumentindex);
      _songModel = SongDetailModel(
          _songDetails['artistName'],
          _songDetails['id'],
          _songDetails['releaseDate'],
          _songDetails['name'],
          _songDetails['kind'],
          _songDetails['copyright'],
          _songDetails['artistId'],
          _songDetails['artistUrl'],
          _songDetails['artworkUrl100'],
          _songDetails['url'],
          _songDetails['genres']);
      setState(() {
        _isDetailsFetched = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    argumentindex = ModalRoute.of(context).settings.arguments;
    _getSongDetails();

    return Scaffold(
      body: _isDetailsFetched
          ? Center(child: _widgetbuilder.showSongDetails(_songModel, context))
          : Center(child: Text("Fetching Details...")),
    );
  }
}
