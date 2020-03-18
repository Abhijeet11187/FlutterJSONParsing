import 'package:musicplayer/Services/service.dart';

class SongList {
  static dynamic _allSongsData;
  static List _songs = [];
  static List _thumbNails=[];
  Service _service = Service();
  fetchSong() async {
    _allSongsData = await _service.fetchData();
    _allSongsData.forEach((element) => {
          _songs.add(element['name']),
          _thumbNails.add(element['artworkUrl100']),
        });
  }

  fetchSongList() async {
    await _service.fetchData();
  }

  getSongList() async {
    if (_songs.length < 1) {
      await fetchSong();
    }
    return _songs;
  }
   getThumbnailList() async {
    if (_songs.length < 1) {
      await fetchSong();
    }
    return _thumbNails;
  }

  getSongDetails(index) async {
    return _allSongsData[index];
  }
}
