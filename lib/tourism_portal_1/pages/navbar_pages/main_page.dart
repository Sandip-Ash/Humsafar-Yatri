import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
// import 'package:tourism_app/components/my_drawer.dart';
import 'package:tourism_app/multi_destination_portal_2/screens/search_places_page1.dart';
// import 'my_page.dart';

import '../../../nearby_places_app_portal_3/home_page.dart';
import '../profile/my_page.dart';
// import 'search_page.dart';
import 'Home_Page.dart';
// import 'bar_item.dart';


///////// this is the main page which connects all other pages ////

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List pages= [
    const Home_Page(),
    const Places(),
    RangePage(),
    const MyPage(),
  ];

  int currentIndex = 0;

  /// function for index///
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // drawer: const MyDrawer(),

      body: Stack(
        fit: StackFit.expand,
        children: [

          pages[currentIndex],
          // Positioned.fill(
          //   bottom: 0,
          //   left:0,
          //   // width: MediaQuery.of(context).size.width,
          //   // height: MediaQuery.of(context).size.height,
          //   child: pages[currentIndex],
          //   // child: Container(
          //   //   color: Colors.red,
          //   // ),
          // ),


          Positioned(
            bottom: 0,
            left: 0,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: CurvedNavigationBar(
                  backgroundColor: Colors.transparent,
                  color: Colors.green,
                  animationCurve: Curves.easeInOut,
                  buttonBackgroundColor: Colors.red,
                  // height: ,
                  onTap: onTap,
                  index: currentIndex,
                  items: const [
                    CurvedNavigationBarItem(
                        child: Icon(Icons.home, color: Colors.white,),
                        label: 'Home',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,)
                    ),

                    CurvedNavigationBarItem(
                        child: Icon(Icons.map, color: Colors.white,),
                        label: 'Multi-stop',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,)
                    ),

                    CurvedNavigationBarItem(
                        child: Icon(Icons.radar, color: Colors.white,),
                        label: 'Range',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,)
                    ),

                    CurvedNavigationBarItem(
                        child: Icon(Icons.person, color: Colors.white,),
                        label: 'Profile',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,)
                    ),
                  ]
              ),
            ),
          )
        ],
      )


      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.transparent,
      //   color: Colors.green,
      //   animationCurve: Curves.easeInOut,
      //   buttonBackgroundColor: Colors.red,
      //   onTap: onTap,
      //   index: currentIndex,
      //   items: const [
      //     CurvedNavigationBarItem(
      //       child: Icon(Icons.home, color: Colors.white,),
      //       label: 'Home',
      //       labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,)
      //     ),
      //
      //     CurvedNavigationBarItem(
      //       child: Icon(Icons.map, color: Colors.white,),
      //       label: 'Multi-stop',
      //         labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,)
      //     ),
      //
      //     CurvedNavigationBarItem(
      //       child: Icon(Icons.bar_chart, color: Colors.white,),
      //       label: 'Bar',
      //       labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,)
      //     ),
      //
      //     CurvedNavigationBarItem(
      //       child: Icon(Icons.person, color: Colors.white,),
      //       label: 'Profile',
      //       labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,)
      //     ),
      //   ]
      // )
    );
  }
}