import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/aboout_us_bg.jpg'),
            fit: BoxFit.cover,
            opacity: 0.4
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Center(
                  child: Text(
                    'Sandip Ash',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Sandip Ash is a final-year B.Tech student in Information Technology at Dr. B.C. Roy Engineering College, Durgapur. With a passion for technology and innovation, Sandip has been involved in numerous projects that leverage advanced technologies to solve real-world problems. His expertise in Flutter and Dart, along with his keen interest in AI and digital mapping services, has been instrumental in the development of the AI-Enabled Route Planning System for Multi-Stop Journeys.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Sudip Kabiraj',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Sudip Kabiraj is also a final-year B.Tech student in Information Technology at Dr. B.C. Roy Engineering College, Durgapur. Sudip\'s dedication to enhancing user experiences through innovative solutions has driven him to specialize in AI technologies and route optimization. His collaborative efforts with Sandip Ash have resulted in the successful creation of a comprehensive travel planning system that aims to revolutionize how travelers plan their multi-stop journeys.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    'Our Project',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'The AI-Enabled Route Planning System for Multi-Stop Journeys is a state-of-the-art application designed to assist travelers in efficiently planning their trips. Developed using Flutter and Dart, and leveraging Google Maps API and OpenRouteService, this system provides users with optimized travel routes that encompass multiple tourist attractions. Key features include automated display of significant attractions upon location search and the ability for users to manually select desired attractions with the system generating the shortest possible route in both scenarios.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                Text(
                  'Our system employs advanced AI algorithms to ensure optimal route calculations, enhancing the overall travel experience. The interactive map interface facilitates easy visualization of routes and attractions. Extensive testing has validated the system\'s functionality, usability, and compatibility across various devices. User feedback underscores the app’s effectiveness in saving time and enriching travel experiences.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                Text(
                  'Future improvements will focus on real-time traffic integration, enhanced personalization, multi-modal transport options, hotels and restaurants booking, and offline capabilities. This project demonstrates significant advancements in travel planning technology, offering a seamless and enjoyable solution for travelers.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
