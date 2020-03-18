import 'dart:convert';
import 'package:http/http.dart' as http;

class Service {
  static const String url =
      'https://rss.itunes.apple.com/api/v1/in/apple-music/new-releases/all/100/non-explicit.json';

  Future<dynamic> fetchData() async {
    var res = await http.get(Uri.encodeFull(url));
    var data = json.decode(res.body);
    return data['feed']['results'];
  }
}
