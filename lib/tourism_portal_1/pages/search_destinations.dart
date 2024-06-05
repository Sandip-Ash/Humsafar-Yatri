// main.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/dataset.dart';
import 'detailed_pages/detail_page.dart';

class SearchDestinations extends StatefulWidget {
  const SearchDestinations({Key? key}) : super(key: key);

  @override
  _SearchDestinationsState createState() => _SearchDestinationsState();
}

class _SearchDestinationsState extends State<SearchDestinations> {

  // final Map<String, Map<String, dynamic>> placesData = {
  //   "Darjeeling": {
  //     "image": "assets/images/darjeeling_1.jpeg",
  //     "state": "West Bengal, India",
  //     "description": "Experience breathtaking views of the Himalayas, lush tea gardens, and the enchanting Toy Train in the serene hills of Darjeeling.",
  //     "destinations": {
  //       0: {
  //         "name": "Tiger Hill",
  //         "latitude": 27.0125,
  //         "longitude": 88.2636,
  //       },
  //       // Add other destinations...
  //     },
  //   },
  //   // Add other places...
  // };

  // This list holds the data for the list view
  List<String> _foundPlaces = [];

  @override
  initState() {
    _foundPlaces = placesData.keys.toList();
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<String> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all places
      results = placesData.keys.toList();
    } else {
      results = placesData.keys
          .where((place) =>
          place.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    setState(() {
      _foundPlaces = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Search Listview'),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),

            SearchBar(
              padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 15)),
              leading: const Icon(Icons.search, color: Colors.black54,),
              hintText: 'Search',
              hintStyle: const WidgetStatePropertyAll(TextStyle(color: Colors.black54, fontSize: 20)),
              autoFocus: true,
              onChanged: (value) => _runFilter(value),
              // decoration: const InputDecoration(
              //     labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),

            const SizedBox(
              height: 20,
            ),

            Expanded(
              child: _foundPlaces.isNotEmpty
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _foundPlaces.length,
                    itemBuilder: (context, index) {
                      String placesName = _foundPlaces[index];
                      var placeData = placesData[placesName];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(placeName: placesName,)    // Replace NewScreen() with the name of your new screen widget
                            ),
                          );
                        },

                        child: Stack(
                          children: [
                            Container(
                              key: ValueKey(placesName),
                              // color: Colors.blue,
                              height: 200,
                              // width: ,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(image: AssetImage(placeData!["image"]), fit: BoxFit.cover)
                              ),
                            ),

                            Positioned(
                              bottom: 20,
                              left: 30,
                              child: Text(
                                placesName,
                                style: GoogleFonts.amita(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22
                                )
                              ),
                            ),
                          ]
                        ),
                      );
                    },
                )
                : Center(
                  child: Column(
                    children: [

                      Center(child: Icon(Icons.sentiment_very_dissatisfied, size: 50, color: Colors.grey[400],)),
                      Text(
                          'No results found',
                          style: TextStyle(fontSize: 24, color: Colors.grey[400]),
                        ),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
