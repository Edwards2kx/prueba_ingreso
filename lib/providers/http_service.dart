import 'package:http/http.dart' as http;

class HttpService {
//  late String url;

 
  static Future<http.Response> fetchData(String url) {
    return http.get(Uri.parse(url));
  }
/*
  Future<http.Response> fetchAlbum() {
    return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  }*/
}
