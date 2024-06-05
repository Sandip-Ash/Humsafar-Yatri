import 'dart:convert';
import 'package:http/http.dart' as http;

class PlacesService {
  final String apiKey = 'YOUR_GOOGLE_MAP_API';

  Future<List<dynamic>> getNearbyPlaces(double lat, double lng, {bool restaurant = false, bool tourist = false}) async {
    List<String> placeTypes = [];

    if (restaurant) placeTypes.add('restaurant');
    if (tourist) placeTypes.add('tourist_attraction');

    List<dynamic> allPlaces = [];

    for (String type in placeTypes) {
      final String url =
          'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&radius=5000&type=$type&key=$apiKey';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        allPlaces.addAll(data['results']);
      } else {
        throw Exception('Failed to load places of type $type');
      }
    }

    return allPlaces;
  }
}
