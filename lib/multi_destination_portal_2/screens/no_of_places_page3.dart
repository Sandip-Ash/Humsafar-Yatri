import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'multi_destination_page4.dart';

class Navigate extends StatefulWidget {
  const Navigate({Key? key}) : super(key: key);

  @override
  State<Navigate> createState() => _Navigate();
}

class _Navigate extends State<Navigate> {
  // final TextEditingController _controller = TextEditingController();
  int count_places = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // title: Text('RoutePlanner', style: GoogleFonts.pacifico(),),
          // titleTextStyle: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          backgroundColor: Colors.transparent,
          elevation: 0,
          //centerTitle: true,
          foregroundColor: Colors.black,
        ),
      body: Center(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          // color: Colors.lightGreen,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/vector1.jpg'),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              opacity: 85
              // colorFilter: ColorFilter.mode(Colors.orangeAccent, BlendMode.color)
            ),

          ),
          child: buildSearchBar(),
        ),
      )
    );
  }
  Padding buildSearchBar(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 250.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // color: Colors.white,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextField(
              // controller: _controller,
              onChanged: (value){
                count_places = int.parse(value);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'How many places do you want to visit?',
                hintStyle: TextStyle(color: Colors.black54, fontSize: 20),
                suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => MultiDestination(count_places: count_places),
                          ),
                        );
                      });
                    },
                    icon: Icon(Icons.arrow_forward)
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ],
      ),
    );
  }
}


