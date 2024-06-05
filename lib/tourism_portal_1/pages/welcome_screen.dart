import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text_welcome.dart';
import '../widgets/responsive_button.dart';
import 'navbar_pages/main_page.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Welcome_page extends StatefulWidget {
  const Welcome_page({Key? key}) : super(key: key);

  void navigateToHomePage(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => Home_Page(), // Navigate to the home screen
    // ));
  }

  @override
  State<Welcome_page> createState() => _Welcome_pageState();
}

class _Welcome_pageState extends State<Welcome_page> {
  List images=[
    "welcome_5.jpeg",
    "welcome_4.jpg",
    "welcome_7.jpeg",
  ];

  List text=[
    "Discover Next Adventure",
    "Unveil Hidden Treasures",
    "Travel Dreams Realized",
  ];

  List quotes = [
    "Embrace the journey, create unforgettable memories.",
    "Explore the unseen, experience the extraordinary.",
    "From dreams to destinations, we make it happen."
  ];

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length, // no of page 3
        itemBuilder: (_, index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/${images[index]}'
                  ),
                  fit: BoxFit.cover,
                  opacity: 2,
                )
            ),

            child: Container(
              // margin: const EdgeInsets.symmetric(horizontal:25, vertical:150),
              margin: const EdgeInsets.only(left:25, right:25, top:150, bottom: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(
                              width: screenWidth-60,
                                child: Animate(
                                  effects: const [
                                    FadeEffect(
                                      duration: Duration(milliseconds: 1000)
                                    ) ,
                                    SlideEffect(
                                      duration: Duration(seconds: 1),
                                      curve: Curves.easeInOut,
                                      begin: Offset(0.0, 0.3),
                                      end: Offset.zero
                                    )
                                  ],
                                  child: AppLargeText(text: text[index],color: Colors.white, size: 40,)
                                )
                            ),

                            const SizedBox(height: 20,),

                            SizedBox(
                              width: screenWidth-60,
                              child: Animate(
                                effects: const [
                                  FadeEffect(
                                    duration: Duration(milliseconds: 1000),
                                    delay: Duration(milliseconds: 500),
                                  ) ,
                                  SlideEffect(
                                      duration: Duration(seconds: 1),
                                      delay: Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                      begin: Offset(0.0, 0.4),
                                      end: Offset.zero
                                  )
                                ],
                                child: AppText(
                                  text:quotes[index],
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),

                      ///  side dots ///

                        Column(
                          children: List.generate(3, (indexDots) {
                            return Container(
                              /// index dots slider ///
                              margin: const EdgeInsets.only(bottom: 2),
                              width: 8,
                              height: index==indexDots?25:8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index==indexDots?Colors.cyanAccent:Colors.greenAccent.withOpacity(0.3),
                              ),
                            );
                          }),
                        )
                    ],
                  ),

                  if (index==images.length-1)ResponsiveButton(
                      width: screenWidth*2/3,
                      text: 'Get started',
                      onPressed: () {
                        // Navigate to the desired page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MainPage()),
                        );
                      }
                  ),
                ],
              ),
            ),
          );
        }),
    );
  }
}
