import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import '../constants/constants.dart';
import 'map_screen.dart';

class MultiDestination extends StatefulWidget {
  final int count_places;

  MultiDestination({Key? key, required this.count_places}) : super(key: key);

  @override
  State<MultiDestination> createState() => _MultiDestinationState();
}

class _MultiDestinationState extends State<MultiDestination> {
  List<TextEditingController> _controllers = [];
  List<String> userInput = [];
  List<Location> location = [];
  List<Map<String, dynamic>> locInfo = [];


  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.count_places; i++) {
      _controllers.add(TextEditingController());
      userInput.add('');
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<List<Location>> locate(String input) async {
    try {
      String actual_input = '$input, $areaLocation';
      List<Location> coordinates = await locationFromAddress(actual_input);
      if (coordinates.isNotEmpty) {
        locInfo.add({'name': input, 'latitude': coordinates.first.latitude, 'longitude': coordinates.first.longitude});
        return coordinates;
      } else {
        throw Exception('Location not found');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error occurred while fetching location');
    }
  }

  Future<void> submit() async {
    location.clear();
    locInfo.clear();

    for (int i = 0; i < widget.count_places; i++) {
      print('Place ${i + 1} => ${userInput[i]}');
      try {
        List<Location> coordinates = await locate(userInput[i]);
        if (coordinates.isNotEmpty) {
          location.addAll(coordinates);
          print(
              'Coordinates ${i + 1} => Latitude: ${coordinates.first.latitude}, Longitude: ${coordinates.first.longitude}');
        } else {
          print('Coordinates not found for Place ${i + 1}');
        }
      } catch (e) {
        print('Error while fetching coordinates for Place ${i + 1}: $e');
      }
    }

    print(locInfo);
    setState(() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(locInfo: locInfo,),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/vector2.jpg'),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
          child: buildSearchBar(),
        ),
      ),
    );
  }

  Padding buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: ListView(
        children: <Widget>[
          for (int i = 0; i < widget.count_places; i++)
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 15.0,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextFormField(
                  controller: _controllers[i],
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search Places',
                    hintStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                    ),
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  onChanged: (value) {
                    // Update the userInput list directly
                    userInput[i] = value;
                  },
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: ElevatedButton.icon(
              onPressed: () {
                submit();
              },
              label: const Text(
                'Find Route',
                style: TextStyle(
                    fontSize: 25, color: Colors.white, fontFamily: 'Pacifico'),
              ),
              icon: const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 25,
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
