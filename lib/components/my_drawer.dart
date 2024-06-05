import 'package:flutter/material.dart';
import 'package:tourism_app/multi_destination_portal_2/screens/search_places_page1.dart';
import 'package:tourism_app/tourism_portal_1/pages/navbar_pages/main_page.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  // void logout(){
  //   final authService = AuthServices();
  //   authService.SignOut();
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Logo
              const DrawerHeader(
                  child: Icon(
                    Icons.travel_explore,
                    size: 60,
                    color: Colors.black54,
                  ),
              ),

              // home list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  onTap: (){
                    // pop the drawer
                    Navigator.pop(context);

                    // navigate to settings page
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MainPage())
                    );
                  },
                  leading: const Icon(
                    Icons.home,
                    color: Colors.black54,
                    // size: 35,
                  ),
                  title: const Text(
                    'PORTAL 1',
                    style: TextStyle(
                      color: Colors.black54,
                      // fontSize: 30,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ),

              // Portal 2 (Multi-stop) list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  onTap: (){
                    // pop the drawer
                    Navigator.pop(context);

                    // navigate to settings page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Places())
                    );
                  },
                  leading: const Icon(
                    Icons.map_outlined,
                    color: Colors.black54,
                    // size: 35,
                  ),
                  title: const Text(
                    'PORTAL 2',
                    style: TextStyle(
                      color: Colors.black54,
                      // fontSize: 30,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ),

              // Portal 3 list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  onTap: (){
                    // // pop the drawer
                    // Navigator.pop(context);
                    //
                    // // navigate to settings page
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => const MainPage())
                    // );
                  },
                  leading: const Icon(
                    Icons.radar,
                    color: Colors.black54,
                    // size: 35,
                  ),
                  title: const Text(
                    'PORTAL 3',
                    style: TextStyle(
                      color: Colors.black54,
                      // fontSize: 30,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ),
            ],
          ),

          //logout list tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
              // onTap: logout,
              onTap: (){},
              leading: const Icon(
                Icons.logout,
                color: Colors.black54,
                // size: 35,
              ),
              title: const Text(
                'LOGOUT',
                style: TextStyle(
                  color: Colors.black54,
                  // fontSize: 30,
                  letterSpacing: 3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
