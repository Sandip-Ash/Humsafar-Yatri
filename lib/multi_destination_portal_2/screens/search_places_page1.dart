import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'map_screen.dart';
import 'package:geocoding/geocoding.dart';

class Places extends StatefulWidget {
  const Places({Key? key}) : super(key: key);

  @override
  State<Places> createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
  final TextEditingController _controller = TextEditingController();
  late String userInput;
  // List<Location> location = [];
  List<Map<String, dynamic>> locInfo = [];
  // Location get getLocation => location;
  // screenWidth = MediaQuery.

  @override
  void initState() {
    super.initState();

    // Add a listener to the TextEditingController
    _controller.addListener(Listen);
  }

  void Listen(){
    // print('Text changed: ${_controller.text}');
    userInput = _controller.text;
  }

  Future<String> locate() async {
    print('Text changed: $userInput');
    try {
      List<Location> location = await locationFromAddress(userInput);
      if (location.isNotEmpty) {
        locInfo.add({'name': userInput, 'latitude': location.first.latitude, 'longitude': location.first.longitude});
        return userInput;
      } else {
        throw Exception('Location not found'); // Throw an exception
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error occurred while fetching location'); // Re-throw the exception
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            height: double.infinity,
            // color: Colors.lightGreen,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/explore.jpg'),
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                  opacity: 85
                // colorFilter: ColorFilter.mode(Colors.orangeAccent, BlendMode.color)
              ),

            ),
            child: Column(
              children: [
                buildSearchBar(),
                // Menu(),
              ],
            ),
          ),
        )
    );
  }

  Padding buildSearchBar() {
    return Padding(
      // padding: const EdgeInsets.symmetric(vertical: 250, horizontal: 50),
      padding: const EdgeInsets.only(top: 205, right: 25, left: 25, bottom: 50),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            // color: Colors.white,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextFormField(
                controller: _controller,
                style: const TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.all(8),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: ()async{
                      setState(() async{
                        // new_locate();
                        areaLocation = await locate();
                        Location get; // Getter method
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => HomeScreen(locInfo: locInfo, isNavReq: true,),
                            // builder: (BuildContext context) => Navigate(),
                          ),
                        );
                      });
                      // Execute();
                    },
                    icon: Icon(Icons.search, color: Colors.black),
                  ),
                  hintText: 'Where do you want to visit?',
                  hintStyle: TextStyle(color: Colors.black54, fontSize: 20),

                )
            ),
          ),
        ],
      ),
    );
  }
}
