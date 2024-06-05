// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'places_service.dart';
//
// class RangePage extends StatefulWidget {
//   @override
//   _RangePageState createState() => _RangePageState();
// }
//
// class _RangePageState extends State<RangePage> {
//   late GoogleMapController mapController;
//   Position? _currentPosition;
//   List<Marker> _markers = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeLocation();
//   }
//
//   Future<void> _initializeLocation() async {
//     if (await _handleLocationPermission()) {
//       print("Location permission granted.");
//       try {
//         Position position = await _getCurrentLocation();
//         setState(() {
//           _currentPosition = position;
//         });
//         print("Current location: $_currentPosition");
//
//         List<dynamic> places = await _fetchNearbyPlaces(position);
//         setState(() {
//           _markers = places.map((place) {
//             return Marker(
//               markerId: MarkerId(place['place_id']),
//               position: LatLng(
//                 place['geometry']['location']['lat'],
//                 place['geometry']['location']['lng'],
//               ),
//               infoWindow: InfoWindow(
//                 title: place['name'],
//                 snippet: place['vicinity'],
//               ),
//               icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//             );
//           }).toList();
//         });
//         print("Markers updated: $_markers");
//       } catch (e) {
//         print("Error fetching location or places: $e");
//       }
//     } else {
//       print("Location permission denied.");
//     }
//   }
//
//   Future<bool> _handleLocationPermission() async {
//     var status = await Permission.location.status;
//     if (status.isDenied) {
//       status = await Permission.location.request();
//     }
//     return status.isGranted;
//   }
//
//   Future<Position> _getCurrentLocation() async {
//     return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   }
//
//   Future<List<dynamic>> _fetchNearbyPlaces(Position position) async {
//     return await PlacesService().getNearbyPlaces(position.latitude, position.longitude);
//   }
//
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Nearby Restaurants'),
//       ),
//       body: _currentPosition == null
//           ? Center(child: CircularProgressIndicator())
//           : GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
//           zoom: 12,
//         ),
//         myLocationEnabled: true,
//         myLocationButtonEnabled: false,
//         zoomControlsEnabled: false,
//         mapType: MapType.hybrid,
//         circles: {
//           Circle(
//             circleId: CircleId("5km_range"),
//             center: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
//             radius: 5000, // 5 km in meters
//             fillColor: Color.fromRGBO(100, 100, 255, 0.3),
//             strokeColor: Colors.blue,
//             strokeWidth: 2,
//           ),
//         },
//         markers: Set.from(_markers),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../tourism_portal_1/widgets/custom_icons.dart';
import 'places_service.dart';

class RangePage extends StatefulWidget {
  @override
  _RangePageState createState() => _RangePageState();
}

class _RangePageState extends State<RangePage> {
  late GoogleMapController mapController;
  Position? _currentPosition;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    if (await _handleLocationPermission()) {
      print("Location permission granted.");
      try {
        Position position = await _getCurrentLocation();
        setState(() {
          _currentPosition = position;
        });
        print("Current location: $_currentPosition");

        List<dynamic> places = await _fetchNearbyPlaces(position);
        final BitmapDescriptor restaurantIcon = await getMarkerIcon(Icons.restaurant_menu, Colors.green, 80);// await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/icons/restaurant_marker.png');
        final BitmapDescriptor touristIcon = await getMarkerIcon(Icons.tour_outlined, Colors.white, 80);// await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/icons/tourist_marker.png');
        setState(() {
          _markers = places.map((place) {
            BitmapDescriptor icon;
            if (place['types'].contains('restaurant')) {
              icon = restaurantIcon;
            } else if (place['types'].contains('tourist_attraction')) {
              icon = touristIcon;
            } else {
              icon = BitmapDescriptor.defaultMarker;
            }
            return Marker(
              markerId: MarkerId(place['place_id']),
              position: LatLng(
                place['geometry']['location']['lat'],
                place['geometry']['location']['lng'],
              ),
              infoWindow: InfoWindow(
                title: place['name'],
                snippet: place['vicinity'],
              ),
              icon: icon,
            );
          }).toSet();
        });
        print("Markers updated: $_markers");
      } catch (e) {
        print("Error fetching location or places: $e");
      }
    } else {
      print("Location permission denied.");
    }
  }

  Future<bool> _handleLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      status = await Permission.location.request();
    }
    return status.isGranted;
  }

  Future<Position> _getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<List<dynamic>> _fetchNearbyPlaces(Position position) async {
    return await PlacesService().getNearbyPlaces(position.latitude, position.longitude, restaurant: true, tourist: true);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Nearby Restaurants and Tourist Places'),
      // ),
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          zoom: 12,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        mapType: MapType.hybrid,
        circles: {
          Circle(
            circleId: CircleId("5km_range"),
            center: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
            radius: 5000, // 5 km in meters
            fillColor: Color.fromRGBO(100, 100, 255, 0.3),
            strokeColor: Colors.blue,
            strokeWidth: 2,
          ),
        },
        markers: _markers,
      ),
    );
  }
}
