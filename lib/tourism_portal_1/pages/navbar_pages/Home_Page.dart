import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tourism_app/tourism_portal_1/pages/detailed_pages/detailed_page1.dart';
import 'package:tourism_app/tourism_portal_1/pages/detailed_pages/detailed_page2.dart';
import 'package:tourism_app/tourism_portal_1/pages/detailed_pages/detailed_page_explore_sports.dart';
import 'package:tourism_app/tourism_portal_1/pages/search_destinations.dart';
import '../../../constants/dataset.dart';
import '../../../multi_destination_portal_2/screens/map_screen.dart';
import '../../widgets/app_large_text.dart';
import '../../widgets/app_text_welcome.dart';
import '../detailed_pages/detail_page.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> with TickerProviderStateMixin {

  // List<bool> isBookmarked = [
  //   false,
  //   false,
  //   false
  // ];

  // late final Position curLocation;
  String _locationMessage = "Fetching location...";
  String? _locality;
  String? _state;
  List<Map<String, dynamic>> locInfo = [];

  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    _initLocationService();
  }

  Future<void> _initLocationService() async {
    try {
      Position curLocation = await getUserLocation();
      List<Placemark> placemarks = await placemarkFromCoordinates(curLocation!.latitude, curLocation!.longitude);
      setState(() {
        _locality = placemarks.first.locality;
        _state = placemarks.first.administrativeArea;
        // _locationMessage = '$_locality, $_state' ?? "Locality not found";
        _locationMessage = _locality ?? "Error: Not found";
        locInfo.add({'name': _locationMessage, 'latitude': curLocation.latitude, 'longitude': curLocation.longitude});
      });
    } catch (e) {
      setState(() {
        _locationMessage = e.toString();
      });
    }
  }

  Future<Position> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Error: Location disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Error: Permissions denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // return Future.error('Location permissions are permanently denied, we cannot request permissions.');
      return Future.error('Error: Permission denied');
    }

    return await Geolocator.getCurrentPosition();
  }


  @override
  Widget build(BuildContext context) {

    TabController tabController = TabController(length: 3, vsync: this);

    Future<void> requestLocationPermission() async {
      PermissionStatus status = await Permission.location.status;

      if (status.isDenied) {
        status = await Permission.location.request();
        if (status.isGranted) {
          print("Location permission granted");
        } else if (status.isDenied) {
          print("Location permission denied");
        } else if (status.isPermanentlyDenied) {
          openAppSettings();
        }
      } else if (status.isGranted) {
        print("Location permission already granted");

        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Turn On GPS'),
              content: const Text("Location permission already granted"),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
        );
      }
    }

    return Scaffold(
        // resizeToAvoidBottomInset: false,

        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          padding: const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 100),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(
                  //     'Humsafar Yatri',
                  //   style: GoogleFonts.artifika(fontSize: 25),
                  // ),
                  SizedBox(),

                  ////////////////////////////// User location
                  InkWell(
                    onTap: (){
                      setState(() {
                        if(!_locationMessage.contains('Error')) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => HomeScreen(locInfo: locInfo),
                              // builder: (BuildContext context) => Navigate(),
                            ),
                          );
                        }
                        else{
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Permission Denied'),
                                content: const Text('Location permission is denied, please request for permissions.'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Permission'),
                                    onPressed: () async{
                                      requestLocationPermission();
                                      Navigator.of(context).pop();
                                    },
                                  ),

                                  TextButton(
                                    child: const Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              )
                          );
                        }
                      });
                    },

                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.red,
                        ),
                        Text(
                          _locationMessage,
                          style: GoogleFonts.aleo(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                ]
              ),

              const SizedBox(
                height: 10,
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: AppLargeText(text: 'Discover'),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              SearchBar(
                padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 15)),
                leading: const Icon(Icons.search, color: Colors.black54,),
                hintText: 'Search',
                hintStyle: const WidgetStatePropertyAll(TextStyle(color: Colors.black54, fontSize: 20)),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SearchDestinations()));

                },
              ),

              const SizedBox(
                height: 20,
              ),

              // tab bar//
              Align(
                alignment: Alignment.center,
                child: TabBar(
                  labelPadding: const EdgeInsets.only(right: 30),
                  controller: tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  // unselectedLabelStyle: TextStyle(fontSize: 15),
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: const [
                    Tab(
                      text: 'Destinations',
                    ),
                    Tab(text: 'Heritage'),
                    Tab(text: 'Recents'),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.only(left: 5),
                width: double.maxFinite,
                height: 300,
                child: TabBarView(
                  controller: tabController,
                  children: [

                    //1.//  FOR PLACES in HOME page
                    ListView.builder(
                      itemCount: placesData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {

                        String placesName = placesData.keys.toList()[index];
                        String imagePath = placesData[placesName]?['image'];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(placeName: placesName,)    // Replace NewScreen() with the name of your new screen widget
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                // image: AssetImage(city[index]),
                                // image: AssetImage(places.keys.elementAt(index)),
                                image: AssetImage(imagePath),
                                fit: BoxFit.cover,
                              ),
                              // boxShadow:
                            ),

                            child: Column(
                              children: [
                                // Container(
                                //   padding: const EdgeInsets.only(top: 10, right: 10),
                                //   alignment: Alignment.topRight,
                                //   child: IconButton(
                                //     // Use IconButton instead of Icon to enable onPressed
                                //     onPressed: () {},
                                //     icon: const Icon(
                                //       Icons.bookmark_border,
                                //       color: Colors.white,
                                //       size: 30,
                                //     ),
                                //   ),
                                // ),

                                const Spacer(),

                                Container(
                                  padding: const EdgeInsets.only(bottom: 20, left: 20),
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                      placesName,
                                    style: GoogleFonts.amita(
                                        color: Colors.yellow,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    //2.// FOR HISTORICALS in HOME page

                    ListView.builder(
                      itemCount: historicalsData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        String historicalName = historicalsData.keys.toList()[index];
                        String imagePath = historicalsData[historicalName]?['image'];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailedPage2(historicalsName: historicalName)    // Replace NewScreen() with the name of your new screen widget
                              ),
                            );
                          },

                          child: Container(
                            margin: const EdgeInsets.only(right: 10, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                // image: AssetImage(city_1[index]),
                                  image: AssetImage(imagePath),
                                fit: BoxFit.cover
                              )
                            ),

                            child: Column(
                              children: [
                                // Container(
                                //   padding: const EdgeInsets.only(top: 10, right: 10),
                                //   alignment: Alignment.topRight,
                                //   child: const Icon(
                                //     Icons.bookmark_border_outlined,
                                //     color: Colors.white,
                                //     size: 30,
                                //   ),
                                // ),

                                const Spacer(),

                                Container(
                                  padding: const EdgeInsets.only(bottom: 20, left: 20),
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    historicalName,
                                    style: GoogleFonts.amita(
                                        color: Colors.yellow,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    // 3.
                    ListView.builder(
                      itemCount: emotionsData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {

                        String emotionsName = emotionsData.keys.toList()[index];
                        String imagePath = emotionsData[emotionsName]?['image'];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailedPage1(emotionsName: emotionsName,)
                                )
                            );
                          },

                          child: Container(
                            margin: const EdgeInsets.only(right: 10, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                // image: AssetImage(city_2[index]),
                                image: AssetImage(imagePath),
                                fit: BoxFit.cover
                              )
                            ),

                            child: Column(
                              children: [
                                // Container(
                                //   padding: const EdgeInsets.only(top: 10, right: 10),
                                //   alignment: Alignment.topRight,
                                //   child: const Icon(
                                //     Icons.bookmark_border_outlined,
                                //     color: Colors.white,
                                //     size: 30,
                                //   ),
                                // ),

                                const Spacer(),

                                Container(
                                  padding:
                                      const EdgeInsets.only(bottom: 20, left: 20),
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    emotionsName,
                                    style: GoogleFonts.amita(
                                        color: Colors.yellow,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Padding(
              //     padding: const EdgeInsets.all(8),
              //     child: Row(
              //       children: [
              //         for (int i = 0; i < 6; i++)
              //           Container(
              //             margin: const EdgeInsets.symmetric(horizontal: 10),
              //             padding: const EdgeInsets.all(10),
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(8),
              //               boxShadow: const [
              //                 BoxShadow(
              //                   color: Colors.black54,
              //                   blurRadius: 4,
              //                 )
              //               ]
              //             ),
              //
              //             child: Text(
              //               category[i],
              //               style: GoogleFonts.anekMalayalam(
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //           )
              //       ],
              //     ),
              //   ),
              // ),

              const SizedBox(
                height: 20,
              ),

              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AppLargeText(
                    text: 'Explore more',
                    size: 22,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Container(
                height: 140,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 10),
                child: ListView.builder(
                    itemCount: exploreData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      String activity = exploreData.keys.toList()[index];
                      String img_path = exploreData[activity]?['image'];
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailedPage3(sportsName: activity,)
                              )
                          );
                        },

                        child: Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              Container(
                                //margin: EdgeInsets.only(right: 50),
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage(img_path),
                                      fit: BoxFit.cover
                                  )
                                ),
                              ),

                              const SizedBox(
                                height: 5,
                              ),

                              AppText(
                                text: activity,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        )
    );
  }
}
