import 'package:flutter/material.dart';
import 'package:musicplayer/Pages/Details/DetailsPage/songDetails.dart';

class Widgetbuilder {
  Widget gridViewBuilder(_songs,_thumbnails) {
    return GridView.builder(
        itemCount: _songs.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _showSongDetails(index, context);
            },
            child: Card(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 100,
                          child: Image.network(_thumbnails[index]))),
                    Text(_songs[index])
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _returnPadding() {
    return Padding(
      padding: EdgeInsets.all(10),
    );
  }

  Widget showSongDetails(_songModel, context) {
    List _songGenre = [];
    _songModel.genres.forEach((element) => {
          _songGenre.add(element['name']),
        });
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Card(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width * 0.40,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(_songModel.artworkUrl100)),
            ),
            Text("Id : ${_songModel.id}"),
            _returnPadding(),
            Center(child: Text(_songModel.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20) )),
            Text(
              " by ${_songModel.artistName}. Released on  ${_songModel.releaseDate}",
              style: TextStyle(fontSize: 20),
            ),
            _returnPadding(),
            Text(
             "Kind : ${ _songModel.kind}",
            ),
            _returnPadding(),
            Text("Artist Id : ${_songModel.artistId}"),
            _returnPadding(),
            Text("Artist URL :" ,  style: TextStyle(fontWeight: FontWeight.bold),),
            Text(_songModel.artistUrl ,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            _returnPadding(),
            Text("Song URL :",  style: TextStyle(fontWeight: FontWeight.bold),),
            Text(_songModel.url  ,style: TextStyle(fontStyle: FontStyle.italic),),
            _returnPadding(),
            Text("Gener : $_songGenre"),
            _returnPadding(),
            Text(
              _songModel.copyright,
              style: TextStyle(fontSize: 10),
            ),
          ],
        )),
      ),
    );
  }

  _showSongDetails(index, context) {
    Navigator.of(context).pushNamed(SongDetails.routeName, arguments: index);
  }
}
