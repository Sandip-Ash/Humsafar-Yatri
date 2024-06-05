import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'no_of_places_page3.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  List<Map<String, dynamic>> locInfo = [];
  final bool isNavReq;

  // List<Location> location = [];  // const HomeScreen({Key? key, required this.location}) : super(key: key);
  HomeScreen({super.key, required this.locInfo, this.isNavReq = false});
  @override
  State<HomeScreen> createState() => _HomeScreenState(locInfo, isNavReq);
}

class _HomeScreenState extends State<HomeScreen>{

  List<Map<String, dynamic>> locInfo = [];
  final bool isNavReq;
  _HomeScreenState(this.locInfo, this.isNavReq);


  //----------------------------------------------- Variables and declarations Starts ------------------------------------------------//
  // static const CameraPosition initialPosition = CameraPosition(target: LatLng(23.527737335940245, 87.36138973276746), zoom: 1);
  late CameraPosition initialPosition;
  IconData locate = Icons.location_searching;
  final Completer<GoogleMapController> _controller = Completer();
  final List<Marker> _marker = [];
  late List<LatLng> _places = [];
  final Set<Polyline> _ors_polylines = {};
  //----------------------------------------------- Variables and declarations Ends ------------------------------------------------//

  //-------------------------------------------------------- Functions Starts ------------------------------------------------------//
  Stream<Position> getLocationStream() {
    StreamController<Position> streamController = StreamController<Position>();

    Stream<Position> positionStream = Geolocator.getPositionStream();
    positionStream.listen((Position position) {
      streamController.add(position);
    });

    return streamController.stream;
  }

  void initState(){
    initialPosition = CameraPosition(target: LatLng(locInfo[0]['latitude'], locInfo[0]['longitude']), zoom: 14);

    for(int i=0; i<locInfo.length; i++) {
      _marker.add(
        Marker(
          markerId: const MarkerId('Search_Place'),
          position: LatLng(locInfo[i]['latitude'], locInfo[i]['longitude']),
          infoWindow: InfoWindow(
            title: "${locInfo[i]['name']}",
            snippet: "(${locInfo[i]['latitude']}, ${locInfo[i]['longitude']})",
          ),
        ),
      );
    }

    // _addPolyline();
    add_poly();
    getUserLocation();
  }

  void add_poly()
  {
    _places = locInfo.map((location) {
      return LatLng(location['latitude'], location['longitude']);
    }).toList();

    for (int i = 0; i < _places.length-1; i++) {
      LatLng start = _places[i];
      LatLng end = _places[i+1];
      String id = locInfo[i]['name'] + ' - ' + locInfo[i+1]['name'];
      _getRoute(start, end, id);
    }
  }

  Future<void> _getRoute(LatLng start, LatLng end, String id) async {
    const String apiKey = '5b3ce3597851110001cf62481fcd3b98e3bb40d29f9adb1a7a16adff';
    final Uri url = Uri.parse(
        'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=${start.longitude},${start.latitude}&end=${end.longitude},${end.latitude}');

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

  // void _addPolyline() {
  //   // Create a list of LatLng points for your polyline
  //   List<LatLng> polylinePoints = [];
  //
  //   for (int i = 0; i < locInfo.length; i++) {
  //     polylinePoints.add(LatLng(locInfo[i]['latitude'], locInfo[i]['longitude']));
  //   }
  //
  //   // Create a Polyline object and set its properties
  //   Polyline polyline = Polyline(
  //     polylineId: PolylineId('route'),
  //     color: Colors.orangeAccent,
  //     width: 5,
  //     points: polylinePoints,
  //   );
  //
  //   setState(() {
  //     // Add the polyline to the list of polylines
  //     _polylines.add(polyline);
  //   });
  // }

  Future<Position> getUserLocation()async{
    await Geolocator.requestPermission().then((value){}).onError((error, stackTrace){
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
  //-------------------------------------------------------- Functions Ends ------------------------------------------------------//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,

        appBar: AppBar(
          // title: Text('RoutePlanner', style: GoogleFonts.pacifico(),),
          // titleTextStyle: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          backgroundColor: Colors.transparent,
          elevation: 0,
          //centerTitle: true,
          foregroundColor: Colors.black,
        ),
        body: MapScreen(),

        // Condition button required
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isNavReq ? Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 8),
              child: FloatingActionButton(
                  backgroundColor: Colors.black87,
                  onPressed: ()async{
                    setState(() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const Navigate(),
                        ),
                      );
                    });
                  },
                  child: const Icon(Icons.navigate_next, color: Colors.blue)
              ),
            )
                : const SizedBox(),

            Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 8),
              child: FloatingActionButton(
                  backgroundColor: Colors.black87,
                  onPressed: ()async{
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
                      setState(() {

                      });
                    });
                  },
                  child: Icon(locate, color: Colors.blue)
              ),
            ),
          ],
        )
    );
  }

  MapScreen() {
    return GoogleMap(
      initialCameraPosition: initialPosition,
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      markers: Set<Marker>.of(_marker),
      polylines: _ors_polylines,
      // myLocationButtonEnabled: true,
      // myLocationEnabled: true,
      compassEnabled: true,
      onMapCreated: (GoogleMapController controller){
        _controller.complete(controller);
      },);
  }
}
