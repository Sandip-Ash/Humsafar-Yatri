import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../../nearby_places_app_portal_3/places_service.dart';
import '../widgets/custom_icons.dart';
// import 'places_service.dart';  // Import the places_service.dart

class MapScreen extends StatefulWidget {
  final List<Map<String, dynamic>> locInfo;
  final bool range;

  MapScreen({super.key, required this.locInfo, this.range = true});

  @override
  State<MapScreen> createState() => _HomeScreenState(locInfo, range);
}

class _HomeScreenState extends State<MapScreen> {
  final List<Map<String, dynamic>> locInfo;
  final bool range;
  _HomeScreenState(this.locInfo, this.range);

  //----------------------------------------------- Variables and declarations Starts ------------------------------------------------//
  late CameraPosition initialPosition;
  IconData locate = Icons.location_searching;
  final Completer<GoogleMapController> _controller = Completer();
  final List<Marker> _marker = [];
  late List<LatLng> _places = [];
  final Set<Polyline> _ors_polylines = {};
  //-------------------------------------------------------- Variables and declarations Ends ------------------------------------------------//

  //-------------------------------------------------------- Functions Starts ------------------------------------------------------//
  Stream<Position> getLocationStream() {
    StreamController<Position> streamController = StreamController<Position>();

    Stream<Position> positionStream = Geolocator.getPositionStream();
    positionStream.listen((Position position) {
      streamController.add(position);
    });

    return streamController.stream;
  }

  @override
  void initState() {
    super.initState();
    initialPosition = CameraPosition(
      target: LatLng(locInfo[0]['latitude'], locInfo[0]['longitude']),
      zoom: 12,
    );

    for (int i = 0; i < locInfo.length; i++) {
      _marker.add(
        Marker(
          markerId: MarkerId('Search_Place_${i}'),
          position: LatLng(locInfo[i]['latitude'], locInfo[i]['longitude']),
          infoWindow: InfoWindow(
            title: "${locInfo[i]['name']}",
            snippet: "(${locInfo[i]['latitude']}, ${locInfo[i]['longitude']})",
          ),
        ),
      );
    }

    add_poly();
    getUserLocation();

    if (range) {
      fetchNearbyPlaces(locInfo[0]['latitude'], locInfo[0]['longitude']);
    }
  }

  void add_poly() {
    _places = locInfo.map((location) {
      return LatLng(location['latitude'], location['longitude']);
    }).toList();

    for (int i = 0; i < _places.length - 1; i++) {
      LatLng start = _places[i];
      LatLng end = _places[i + 1];
      String id = locInfo[i]['name'] + ' - ' + locInfo[i + 1]['name'];
      _getRoute(start, end, id);
    }
  }

  Future<void> _getRoute(LatLng start, LatLng end, String id) async {
    const String apiKey = '5b3ce3597851110001cf62481fcd3b98e3bb40d29f9adb1a7a16adff';
    final Uri url = Uri.parse(
        'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=${start.longitude},${start.latitude}&end=${end.longitude},${end.latitude}'
    );

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> coordinates = data['features'][0]['geometry']['coordinates'];
      final List<LatLng> points = coordinates.map((e) => LatLng(e[1], e[0])).toList();

      setState(() {
        _ors_polylines.add(
          Polyline(
            polylineId: PolylineId(id),
            points: points,
            color: Colors.blue,
            width: 5,
          ),
        );
      });
    } else {
      throw Exception('Failed to load route');
    }
  }

  Future<Position> getUserLocation() async {
    await Geolocator.requestPermission().then((value) {}).onError((error, stackTrace) {
      print("ERROR: ${error.toString()}");
    });

    return await Geolocator.getCurrentPosition();
  }

  void _toggleMyLocation() {
    setState(() {
      if (locate == Icons.location_searching) {
        locate = Icons.my_location;
      }
    });
  }

  Future<void> fetchNearbyPlaces(double lat, double lng) async {
    PlacesService placesService = PlacesService();
    final BitmapDescriptor restaurantIcon = await getMarkerIcon(Icons.restaurant_menu, Colors.green, 80);// await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/icons/restaurant_marker.png');
    final BitmapDescriptor touristIcon = await getMarkerIcon(Icons.tour_outlined, Colors.white, 80);// await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/icons/tourist_marker.png');
    try {
      List<dynamic> places = await placesService.getNearbyPlaces(lat, lng, restaurant: true);
      setState((){
        for (var place in places) {
          _marker.add(
            Marker(
              markerId: MarkerId(place['place_id']),
              position: LatLng(place['geometry']['location']['lat'], place['geometry']['location']['lng']),
              // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
              icon: restaurantIcon,
              infoWindow: InfoWindow(
                title: place['name'],
                snippet: place['vicinity'],
              ),
            ),
          );
        }
      });

      List<dynamic> tourist_places = await placesService.getNearbyPlaces(lat, lng, tourist: true);
      setState(() {
        for (var place in tourist_places) {
          _marker.add(
            Marker(
              markerId: MarkerId(place['place_id']),
              position: LatLng(place['geometry']['location']['lat'], place['geometry']['location']['lng']),
              icon: touristIcon,
              infoWindow: InfoWindow(
                title: place['name'],
                snippet: place['vicinity'],
              ),
            ),
          );
        }
      });
    } catch (e) {
      print('Error fetching nearby places: $e');
    }
  }

  //-------------------------------------------------------- Functions Ends ------------------------------------------------------//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        zoomControlsEnabled: false,
        indoorViewEnabled: true,
        mapType: MapType.hybrid,
        markers: Set<Marker>.of(_marker),
        // polylines: _ors_polylines,
        compassEnabled: true,
        circles: range ? {
          Circle(
            circleId: const CircleId("5km_range"),
            center: LatLng(locInfo[0]['latitude'], locInfo[0]['longitude']),
            radius: 5000, // 5 km in meters
            fillColor: const Color.fromRGBO(100, 100, 255, 0.3),
            strokeColor: Colors.blue,
            strokeWidth: 2,
          ),
        } : {},
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 8),
        child: FloatingActionButton(
          backgroundColor: Colors.black87,
          onPressed: () async {
            Stream<Position> positionStream = getLocationStream();
            positionStream.listen((Position position) async {
              _marker.add(
                Marker(
                  markerId: const MarkerId('Current_Location'),
                  position: LatLng(position.latitude, position.longitude),
                  infoWindow: InfoWindow(
                    title: "Current Location (${position.latitude}, ${position.longitude})",
                  ),
                ),
              );

              CameraPosition cameraPosition = CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 14,
              );
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
              _toggleMyLocation();
              setState(() {});
            });
          },
          child: Icon(locate, color: Colors.blue),
        ),
      ),
    );
  }
}
