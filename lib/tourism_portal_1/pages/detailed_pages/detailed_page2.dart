import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourism_app/constants/dataset.dart';
import 'package:tourism_app/tourism_portal_1/widgets/like_button.dart';

import '../../widgets/app_buttons.dart';
import '../../widgets/app_large_text.dart';
import '../../widgets/app_text_welcome.dart';
import '../Map_Page.dart';

///////////////////////////////////// This detailed page is for Emotions in homescreen ////////////////////////////////////////////////////////

class DetailedPage2 extends StatefulWidget {
  final String historicalsName;
  const DetailedPage2({Key? key, required this.historicalsName}) : super(key: key);

  @override
  State<DetailedPage2> createState() => _DetailedPage2State(historicalsName);
}

class _DetailedPage2State extends State<DetailedPage2> {
  final String historicalsName;
  _DetailedPage2State(this.historicalsName);

  int gottenStars = 4;
  int selectedIndex = -1;

  double rating = 4.5;

  // int numberOfPeople = 1; // initial value fixed
  // int basePrice = 5000; // initial base price

  List<Map<String, dynamic>> locInfo = [];

  List<Map<String, dynamic>> AllLocations(){
    {
      try{
        locInfo.clear();
        // var destinations = historicalsData[historicalsName];
        // print(destinations);

        locInfo.add({
          'name': historicalsName,
          'latitude': historicalsData[historicalsName]?['latitude'],
          'longitude': historicalsData[historicalsName]?['longitude'],
        });
        return locInfo;
      }catch (e) {
        print('Error: $e');
        throw Exception('Error occurred while fetching data');
      }
    }
  }

  // void AllLocations() {
  //   locInfo.clear();
  //   var destinations = historicalsData[historicalsName]?["destinations"];
  //
  //   if (destinations != null && destinations is Map<int, Map<String, dynamic>>) {
  //     for (var key in destinations.keys) {
  //       var destination = destinations[key];
  //       if (destination != null) {
  //         var name = destination['name'];
  //         var latitude = destination['latitude'];
  //         var longitude = destination['longitude'];
  //
  //         // Additional check to ensure values are not null
  //         if (name != null && latitude != null && longitude != null) {
  //           locInfo.add({
  //             'name': name,
  //             'latitude': latitude,
  //             'longitude': longitude,
  //           });
  //         } else {
  //           print("Missing data for a destination: $destination");
  //         }
  //       }
  //     }
  //   } else {
  //     print("No valid destinations found in historicalsData for $emotionsName.");
  //   }
  //
  //   print(locInfo);
  // }

  // function to calculate price dynamically

  // int calculatePrice(int numberOfPeople){
  //   return basePrice+(numberOfPeople-1)*5000;
  // }

  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              // image
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(historicalsData[historicalsName]?['image']),
                        fit: BoxFit.cover,
                      )),
                )),

            Positioned(
              // row present down
                left: 20,
                top: 40,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      highlightColor: Colors.black54,
                    )
                  ],
                )),

            Positioned(
              // container inside designing
                top: 320,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  //color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  // height: 700,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.redAccent,
                            size: 30,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            historicalsName,
                            style: GoogleFonts.akshar(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10,),

                      Row(
                          children: [
                            RatingBar.builder(
                              initialRating: rating,
                              minRating: 1,
                              glow: true,
                              itemSize: 28,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (newRating) {
                                // print(new_rating);
                                // rating = new_rating;
                                setState(() {
                                  print(newRating);
                                  rating = newRating;
                                });
                              },
                            ),

                            const SizedBox(width: 10,),

                            AppText(text: '($rating)',color: Colors.black45,)
                          ]
                      ),
                      const SizedBox(height: 20),
                      AppLargeText(
                        text: 'Description',
                        color: Colors.black54,
                        size: 20,
                      ),
                      const SizedBox(height: 10),
                      AppText(
                        text: historicalsData[historicalsName]?['description'],
                        color: Colors.black87,
                        size: 16,
                      ),
                      const SizedBox(height: 20),
                      AppLargeText(
                        text: 'Locations',
                        color: Colors.black54,
                        size: 20,
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(height: 10),
                      AppText(
                        text: 'Latitude: ${historicalsData[historicalsName]?['latitude']}',
                        color: Colors.black87,
                        size: 16,
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(height: 10),
                      AppText(
                        text: 'Latitude: ${historicalsData[historicalsName]?['longitude']}',
                        color: Colors.black87,
                        size: 16,
                      ),
                    ],
                  ),
                )),

            Positioned(
                bottom: 30,
                left: 20,
                right: 20,
                // low fixed boxex
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[350],
                      ),
                      child: IconButton(
                        icon: Icon(
                          _isFavorited ? Icons.favorite : Icons.favorite_border,
                        ),
                        color: _isFavorited ? Colors.red : Colors.black,
                        onPressed: _toggleFavorite,
                      ),
                    ),

                    // Container(
                    //   height: 60,
                    //   width: 60,
                    //   decoration: BoxDecoration(
                    //     color: Colors.black26,
                    //     borderRadius: BorderRadius.circular(20),
                    //   ),
                    //   child: LikeButton(
                    //     isLiked: isFav,
                    //     onTap: (){
                    //       isFav = !isFav;
                    //     }
                    //   )
                    // ),

                    const SizedBox(width: 20),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MapScreen(locInfo: AllLocations())),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                              (Set<WidgetState> states) {
                            if (states.contains(WidgetState.pressed)) {
                              return Colors.grey; // Change to the desired color when pressed
                            }
                            return Colors.indigo; // Default color
                          },
                        ),
                        elevation: WidgetStateProperty.all<double>(3),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        child: Text(
                          'Explore',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
