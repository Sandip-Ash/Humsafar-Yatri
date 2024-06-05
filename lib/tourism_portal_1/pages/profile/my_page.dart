import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourism_app/tourism_portal_1/pages/profile/about_us.dart';
import 'package:tourism_app/tourism_portal_1/pages/profile/my_favourite.dart';
import 'package:tourism_app/tourism_portal_1/pages/profile/policy_page.dart';
import 'Edit_Profile.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 70,
      //   elevation: 10,
      //   backgroundColor: Colors.white,
      //   // leading: IconButton(
      //   //   onPressed: () {
      //   //     Navigator.pop(context);
      //   //   },
      //   //   icon: const Icon(Icons.arrow_back_ios),
      //   //   color: Colors.black,
      //   // ),
      //   title: Text(
      //     'Profile Corner',
      //     style: GoogleFonts.anticDidone(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 20,
      //       color: Colors.black,
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(isDark ? Icons.sunny : Icons.dark_mode_rounded,
      //           color: Colors.black),
      //     )
      //   ],
      // ),

      body: Column(

        children: [
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              'Profile Corner',
              style: GoogleFonts.anticDidone(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ),

          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              // padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 70),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: const Image(
                              // image: AssetImage('assets/images/kouliki.jpg')
                              image: AssetImage('assets/images/Sandip Ash.jpg'),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),

                      /// photo icon//

                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.greenAccent,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Text(
                    // 'Kouliki Mahato',
                    'Sandip Ash',
                    style: GoogleFonts.andadaPro(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  Text(
                    // 'koulikimahato123@gmail.com',
                    'sandipash2020@gmail.com',
                    style: GoogleFonts.andadaPro(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const EditProfile())
                        );
                      },

                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          side: BorderSide.none,
                          shape: const StadiumBorder()
                      ),

                      child: const Text(
                        'Edit profile',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16
                        ),
                      ),
                    ),
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     ElevatedButton(
                  //       onPressed: () {},
                  //       style: ElevatedButton.styleFrom(
                  //           backgroundColor: Colors.orange[300],
                  //           side: BorderSide.none,
                  //           shape: const StadiumBorder()
                  //       ),
                  //       child: const Row(
                  //         children: [
                  //           Icon(
                  //             Icons.phone,
                  //             color: Colors.black,
                  //             size: 16,
                  //           ),
                  //
                  //           SizedBox(
                  //             width: 8,
                  //           ),
                  //
                  //           Text(
                  //             'call',
                  //             style: TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: 16
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //
                  //     ElevatedButton(
                  //       onPressed: () {},
                  //       style: ElevatedButton.styleFrom(
                  //           backgroundColor: Colors.orange[300],
                  //           side: BorderSide.none,
                  //           shape: const StadiumBorder()
                  //       ),
                  //
                  //       child: const Row(
                  //         children: [
                  //           Icon(
                  //             Icons.language_outlined,
                  //             color: Colors.black,
                  //             size: 16,
                  //           ),
                  //
                  //           SizedBox(
                  //             width: 8,
                  //           ),
                  //
                  //           Text(
                  //             'Language',
                  //             style: TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: 16
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  const SizedBox(
                    height: 20,
                  ),

                  const Divider(),

                  const SizedBox(
                    height: 10,
                  ),

                  // menu
                  // ProfileMenuWidget(
                  //   title: "Settings",
                  //   icon: Icons.settings,
                  //   onPress: () {},
                  // ),

                  ProfileMenuWidget(
                    title: 'My Favourites',
                    icon: Icons.favorite_border,
                    onPress: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const MyFavouritePage())
                      );
                    },
                  ),

                  // ProfileMenuWidget(
                  //   title: "My Journeys",
                  //   icon: Icons.mode_of_travel_outlined,
                  //   onPress: () {},
                  // ),

                  // const Divider(color: Colors.grey, indent: 10),
                  //
                  // const SizedBox(
                  //   height: 10,
                  // ),

                  ProfileMenuWidget(
                      icon: Icons.sticky_note_2_outlined,
                      title: 'Policies',
                      onPress: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PolicyPage())
                        );
                      }
                  ),

                  ProfileMenuWidget(
                    title: 'About us',
                    icon: Icons.person,
                    onPress: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AboutUsPage())
                      );
                    },
                  ),

                  ProfileMenuWidget(
                    title: 'Help Center',
                    icon: Icons.question_answer,
                    onPress: () {},
                  ),

                  ProfileMenuWidget(
                    title: 'Logout',
                    icon: Icons.logout,
                    textColor: Colors.redAccent,
                    endIcon: false,
                    onPress: () {
                      // Navigate back to the home screen
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                  ),

                  // Menu
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// menu option //

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? Colors.cyan : Colors.indigo;

    return ListTile(
      onTap: onPress,

      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white38,
        ),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),

      title: Text(
        title,
        style: GoogleFonts.aladin(fontSize: 20, color: textColor),
      ),

      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey[300],
              ),

              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.blueGrey,
              ),
            )
          : null
    );
  }
}
