import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/app_buttons.dart';
import '../../widgets/app_large_text.dart';
import '../../widgets/app_text_welcome.dart';
import '../Map_Page.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({Key? key}) : super(key: key);

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {

  int gottenStars=4;
  int selectedIndex=-1;

  int numberOfPeople=1;  // initial value fixed
  int basePrice=5000;     // initial base price

  // function to calculate price dynamically

  int calculatePrice(int numberOfPeople){
    return basePrice+(numberOfPeople-1)*5000;
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice=calculatePrice(numberOfPeople);
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
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/kashmir.jpeg'),
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
                      color: Colors.black,

                    )
                  ],
                )
            ),

            Positioned(                                         // achacontainer inside designing
                top: 320,
                child: Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 30),
                  //color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Kashmir',
                            style: GoogleFonts.akshar(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text('\₹$totalPrice',style: TextStyle(
                              color: Colors.black,
                              fontSize: 18
                          ),)

                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.location_on,color: Colors.redAccent,),
                          SizedBox(width: 5,),
                          Text('Ladakh',style: GoogleFonts.alexandria(
                              fontSize: 15,color: Colors.black54
                          ),)
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                          children: [
                            // stars //
                            Wrap(
                              children:
                              List.generate(5, (index){
                                return Icon(Icons.star,color: index<gottenStars?Colors.yellow:Colors.grey,); // star condition for 1 star grey
                              }),
                            ),
                            SizedBox(width: 10,),
                            AppText(text: '(4.0)',color: Colors.black45,)
                          ]),
                      SizedBox(height: 25,),
                      AppLargeText(text: 'People',color: Colors.black,size: 20,),
                      SizedBox(height: 10,),
                      AppText(text: 'Number of People in your group',color: Colors.black38,size: 16,),
                      SizedBox(height: 10,),
                      Wrap(
                          children:
                          List.generate(5, (index) {
                            // buttons are present in app button .dart file//
                            return InkWell(
                              onTap: (){
                                setState(() {
                                  selectedIndex=index;
                                  numberOfPeople=index+1;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  color: selectedIndex==index?Colors.black:Colors.white,
                                  size: 50,
                                  backgroundcolor: selectedIndex==index?Colors.black:Colors.grey,
                                  borderColor: selectedIndex ==index?Colors.black:Colors.black12,
                                  text: (index+1).toString(),
                                ),
                              ),
                            );
                          })
                      ),
                      SizedBox(height: 20,),
                      AppLargeText(text: 'Description',color: Colors.black54,size: 20,),
                      SizedBox(height: 10,),
                      AppText(text: 'Kashmir is a region in the northwestern part of India that is known for its natural beauty, rich culture, and adventurous activities',color: Colors.black87,size: 16,),
                      // AppText(text: 'The city is called place of the thunderbolt, and it is  also known as the "Queen of the Hills"',color: Colors.black87,size: 16),
                    ],

                  ),
                )),
            Positioned(
                bottom: 20,
                left: 20 ,
                right: 20,  // low fixed boxex
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppButtons(
                      color: Colors.black54,
                      size: 60,
                      backgroundcolor: Colors.white,
                      borderColor: Colors.black,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    SizedBox(width: 20,),
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => Map_page()),
                        // );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.grey; // Change to the desired color when pressed
                            }
                            return Colors.indigo; // Default color
                          },
                        ),
                        elevation: MaterialStateProperty.all<double>(3),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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


