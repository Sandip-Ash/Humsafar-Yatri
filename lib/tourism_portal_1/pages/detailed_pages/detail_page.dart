import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourism_app/constants/dataset.dart';

import '../../widgets/app_buttons.dart';
import '../../widgets/app_large_text.dart';
import '../../widgets/app_text_welcome.dart';
import '../Map_Page.dart';

///////////////////////////////////// This detailed page is for Places in homescreen ////////////////////////////////////////////////////////

class DetailPage extends StatefulWidget {
  final String placeName;
  const DetailPage({Key? key, required this.placeName}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState(placeName);
}

class _DetailPageState extends State<DetailPage> {
  final String placeName;
  _DetailPageState(this.placeName);

  int gottenStars=4;
  int selectedIndex=-1;

  // int numberOfPeople=1;  // initial value fixed
  // int basePrice=5000;     // initial base price

  double rating = 4.5;
  List<Map<String, dynamic>> locInfo = [];

  List<Map<String, dynamic>> AllLocations(){
    {
      try{
        locInfo.clear();
        var destinations = placesData[placeName]?["destinations"];
        print(destinations.keys);
        for (var key in destinations.keys) {
          var destination = destinations[key];
          locInfo.add({
            'name': destination['name'],
            'latitude': destination['latitude'],
            'longitude': destination['longitude'],
          });
        }

        return locInfo;
      }catch (e) {
        print('Error: $e');
        throw Exception('Error occurred while fetching data');
      }
    }
  }
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

    // int totalPrice = calculatePrice(numberOfPeople);
    // Icon fav = const Icon(Icons.favorite_border, size: 35,);
    // bool isFav = false;

    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(                                    // image
                left: 0,
                right: 0,
                child:Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(placesData[placeName]?['image']),
                        fit: BoxFit.cover,
                      )
                  ),
                )
            ),

            Positioned(                       // row present down
                left: 20,
                top: 40,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                          Icons.arrow_back_ios),
                      color: Colors.white,
                      highlightColor: Colors.black54,

                    )
                  ],
                )
            ),

            Positioned(                                         // container inside designing
                top: 320,
                child: Container(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
                  //color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 500,
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
                          const Icon(Icons.location_on,color: Colors.redAccent, size: 30,),

                          const SizedBox(width: 5),

                          Text(placeName,
                            style: GoogleFonts.akshar(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      // const SizedBox(height: 10,),

                      // Row(
                      //   children: [
                      //     const Icon(Icons.location_on,color: Colors.redAccent,),
                      //
                      //     const SizedBox(width: 5,),
                      //
                      //     Text(
                      //       'Ladakh',
                      //       style: GoogleFonts.alexandria(
                      //         fontSize: 15,
                      //         color: Colors.black54
                      //       ),
                      //     )
                      //   ],
                      // ),

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
                              onRatingUpdate: (new_rating) {
                                // print(new_rating);
                                // rating = new_rating;
                                setState(() {
                                  print(new_rating);
                                  rating = new_rating;
                                });
                              },
                            ),

                            const SizedBox(width: 10,),

                            AppText(text: '($rating)',color: Colors.black45,)
                          ]
                      ),

                      // const SizedBox(height: 25,),
                      //
                      // AppLargeText(text: 'People',color: Colors.black,size: 20,),
                      //
                      // const SizedBox(height: 10,),
                      //
                      // AppText(text: 'Number of People in your group',color: Colors.black38,size: 16,),
                      //
                      // const SizedBox(height: 10,),
                      //
                      // Wrap(
                      //     children:
                      //     List.generate(5, (index) {
                      //       // buttons are present in app button .dart file//
                      //       return InkWell(
                      //         onTap: (){
                      //           setState(() {
                      //             selectedIndex=index;
                      //             numberOfPeople=index+1;
                      //           });
                      //         },
                      //         child: Container(
                      //           margin: const EdgeInsets.only(right: 10),
                      //           child: AppButtons(
                      //             color: selectedIndex==index?Colors.black:Colors.white,
                      //             size: 50,
                      //             backgroundcolor: selectedIndex==index?Colors.black:Colors.grey,
                      //             borderColor: selectedIndex ==index?Colors.black:Colors.black12,
                      //             text: (index+1).toString(),
                      //           ),
                      //         ),
                      //       );
                      //     })
                      // ),

                      const SizedBox(height: 20,),

                      AppLargeText(text: 'Description',color: Colors.black54,size: 20,),

                      const SizedBox(height: 10,),

                      AppText(text: placesData[placeName]?['description'],color: Colors.black87,size: 16,),
                      // AppText(text: 'The city is called place of the thunderbolt, and it is  also known as the "Queen of the Hills"',color: Colors.black87,size: 16),

                      const SizedBox(height: 20,),

                      AppLargeText(text: 'Locations',color: Colors.black54,size: 20,),

                      const SizedBox(height: 10,),

                      SizedBox(
                        height: 160,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.only(bottom: 8.0),
                          itemCount: placesData[placeName]?["destinations"].length,
                          itemBuilder: (BuildContext context, int index) {
                            String locationName = placesData[placeName]?["destinations"][index]['name'];

                            return GestureDetector(
                              onTap: () {
                                locInfo.clear();
                                locInfo.add({'name': locationName, 'latitude': placesData[placeName]?["destinations"][index]['latitude'], 'longitude': placesData[placeName]?["destinations"][index]['longitude']});
                                print('${index+1}. $locationName');

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MapScreen(locInfo: locInfo)),
                                );
                              },
                              child: Text(
                                '${index+1}. $locationName',
                                style: GoogleFonts.alegreya(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            );
                          },
                        ),
                      ),

                      // Add locations
                    ],
                  ),
                )
            ),

            Positioned(
                bottom: 30,
                left: 20 ,
                right: 20,  // low fixed boxex
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

                    // AppButtons(
                    //   color: Colors.black54,
                    //   size: 50,
                    //   backgroundcolor: Colors.white,
                    //   borderColor: Colors.black,
                    //   isIcon: true,
                    //   icon: Icons.favorite_border,
                    // ),

                    const SizedBox(width: 20,),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MapScreen(locInfo: AllLocations(), range: false,)),
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
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
                )
            )
          ],
        ),
      ),
    );
  }
}


