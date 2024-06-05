
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourism_app/constants/dataset.dart';
import 'package:tourism_app/tourism_portal_1/widgets/like_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/app_large_text.dart';
import '../../widgets/app_text_welcome.dart';
import '../Map_Page.dart';

///////////////////////////////////// This detailed page is for Exploring sports in homescreen ////////////////////////////////////////////////////////

class DetailedPage3 extends StatefulWidget {
  final String sportsName;
  const DetailedPage3({Key? key, required this.sportsName}) : super(key: key);

  @override
  State<DetailedPage3> createState() => _DetailedPage3State(sportsName);
}

class _DetailedPage3State extends State<DetailedPage3> {
  final String sportsName;
  _DetailedPage3State(this.sportsName);

  int gottenStars = 4;
  int selectedIndex = -1;
  double rating = 4.0;

  // int numberOfPeople = 1; // initial value fixed
  // int basePrice = 5000; // initial base price

  List<Map<String, dynamic>> locInfo = [];

  // List<Map<String, dynamic>> AllLocations(){
  //   {
  //     try{
  //       locInfo.clear();
  //       // var destinations = exploreData[sportsName];
  //       // print(destinations);
  //
  //       locInfo.add({
  //         'name': sportsName,
  //         'latitude': exploreData[sportsName]?['latitude'],
  //         'longitude': exploreData[sportsName]?['longitude'],
  //       });
  //       return locInfo;
  //     }catch (e) {
  //       print('Error: $e');
  //       throw Exception('Error occurred while fetching data');
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // int totalPrice = calculatePrice(numberOfPeople);
    Icon fav = const Icon(
      Icons.favorite_border,
      size: 35,
    );
    bool isFav = false;

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
                        image: AssetImage(exploreData[sportsName]?['image']),
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
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  // margin: const EdgeInsets.only(bottom: 20),
                  //color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                      )
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_on,color: Colors.redAccent, size: 30,),

                            const SizedBox(width: 5),

                            Text(sportsName,
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

                        const SizedBox(height: 20,),

                        AppLargeText(text: 'Description',color: Colors.black54,size: 20,),

                        const SizedBox(height: 10,),

                        AppText(text: exploreData[sportsName]?['description'],color: Colors.black87,size: 16,),
                        // AppText(text: 'The city is called place of the thunderbolt, and it is  also known as the "Queen of the Hills"',color: Colors.black87,size: 16),

                        const SizedBox(height: 20,),

                        AppLargeText(text: 'Locations',color: Colors.black54,size: 20,),

                        const SizedBox(height: 10,),

                        SizedBox(
                          height: 340,
                          child: ListView.builder(
                            // physics: const BouncingScrollPhysics(),
                            // scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.only(bottom: 10.0),
                            itemCount: exploreData[sportsName]?["destinations"].length,
                            itemBuilder: (BuildContext context, int index) {
                              String locationName = '${exploreData[sportsName]?["destinations"][index]['name']}, ${exploreData[sportsName]?["destinations"][index]['place']}';
                              // String locationPlace = exploreData[sportsName]?["destinations"][index]['place'];
                              return GestureDetector(
                                onTap: () {
                                  locInfo.clear();
                                  locInfo.add({'name': locationName, 'latitude': exploreData[sportsName]?["destinations"][index]['latitude'], 'longitude': exploreData[sportsName]?["destinations"][index]['longitude']});
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
                  ),
                )
            ),
          ],

        ),
      ),
    );
  }
}
