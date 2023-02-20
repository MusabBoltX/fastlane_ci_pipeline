import 'dart:convert';

import 'albums_model.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 400) {
    throw Exception('Unknown error');
  } else if (response.statusCode == 401) {
    throw Exception('Un Authenticated');
  } else if (response.statusCode == 500) {
    throw Null;
  } else {
    throw Exception('Failed to load album');
  }
}