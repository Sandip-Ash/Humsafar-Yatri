// import 'package:flutter/material.dart';
//
// Color iconColor = Colors.black;
// Color bgColor = Colors.white;
//
// // Home page (Discover)
// Map<String, String> places = {
//   "assets/images/darjeeling_1.jpeg": "Darjeeling",
//   "assets/images/kashmir.jpeg": "Kashmir",
//   "assets/images/goa_2.jpeg": "Goa",
// };

// Map<String, String> historicals = {
//   "assets/images/taj mahal.jpeg": "Taj Mahal",
//   "assets/images/red fort.jpeg": "Red Fort",
//   "assets/images/victoria memorial.jpeg": "Victoria Memorial",
// };
//
// Map<String, String> emotions = {
//   "assets/images/ooty.jpeg": "Ooty",
//   "assets/images/munnar.jpeg": "Munnar",
//   "assets/images/sundarban.jpeg": "Sundarban",
// };


//
// Map destinations = {
//   'Sundarban': {
//     0: {
//       "name": "Sundarbans National Park",
//       "latitude": 21.9497,
//       "longitude": 88.8914,
//     },
//     1: {
//       "name": "Sajnekhali Bird Sanctuary",
//       "latitude": 22.1758,
//       "longitude": 88.9722,
//     },
//     2: {
//       "name": "Dobanki Watch Tower",
//       "latitude": 22.0384,
//       "longitude": 88.8500,
//     },
//     3: {
//       "name": "Netidhopani Watch Tower",
//       "latitude": 22.0358,
//       "longitude": 88.8624,
//     },
//     4: {
//       "name": "Kanak",
//       "latitude": 22.1234,
//       "longitude": 88.9143,
//     },
//     5: {
//       "name": "Bhagabatpur Crocodile Project",
//       "latitude": 21.9527,
//       "longitude": 88.9512,
//     },
//     6: {
//       "name": "Bonnie Camp",
//       "latitude": 21.9571,
//       "longitude": 88.9825,
//     },
//     7: {
//       "name": "Jharkhali Tiger Reserve",
//       "latitude": 21.9463,
//       "longitude": 88.9857,
//     },
//     8: {
//       "name": "Kotka Wildlife Sanctuary",
//       "latitude": 22.1243,
//       "longitude": 88.8849,
//     },
//   },
//   'Sikkim': {
//     0: {
//       "name": "Gurudongmar Lake",
//       "latitude": 27.9879,
//       "longitude": 88.7691,
//     },
//     1: {
//       "name": "Nathula Pass",
//       "latitude": 27.4315,
//       "longitude": 88.6634,
//     },
//     2: {
//       "name": "Rumtek Monastery",
//       "latitude": 27.3036,
//       "longitude": 88.6048,
//     },
//     3: {
//       "name": "Tsomgo Lake",
//       "latitude": 27.3782,
//       "longitude": 88.8230,
//     },
//     4: {
//       "name": "Yumthang Valley",
//       "latitude": 27.9069,
//       "longitude": 88.6881,
//     },
//     5: {
//       "name": "Khangchendzonga National Park",
//       "latitude": 27.3150,
//       "longitude": 88.8506,
//     },
//     6: {
//       "name": "Pelling",
//       "latitude": 27.0675,
//       "longitude": 88.2642,
//     },
//     7: {
//       "name": "Lachen",
//       "latitude": 27.7167,
//       "longitude": 88.6300,
//     },
//     8: {
//       "name": "Singalila National Park",
//       "latitude": 27.0091,
//       "longitude": 88.1143,
//     },
//   },
//   'Ladakh': {
//     0: {
//       "name": "Pangong Lake",
//       "latitude": 33.7498,
//       "longitude": 78.8219,
//     },
//     1: {
//       "name": "Nubra Valley",
//       "latitude": 35.5461,
//       "longitude": 77.8375,
//     },
//     2: {
//       "name": "Hemis Monastery",
//       "latitude": 34.1669,
//       "longitude": 77.5829,
//     },
//     3: {
//       "name": "Leh Palace",
//       "latitude": 34.1649,
//       "longitude": 77.5840,
//     },
//     4: {
//       "name": "Tso Moriri Lake",
//       "latitude": 32.9983,
//       "longitude": 78.2430,
//     },
//     5: {
//       "name": "Zanskar Valley",
//       "latitude": 33.5940,
//       "longitude": 76.0479,
//     },
//     6: {
//       "name": "Shanti Stupa",
//       "latitude": 34.0862,
//       "longitude": 77.5591,
//     },
//     7: {
//       "name": "Magnetic Hill",
//       "latitude": 34.0804,
//       "longitude": 77.5467,
//     },
//     8: {
//       "name": "Thiksey Monastery",
//       "latitude": 33.7390,
//       "longitude": 78.0354,
//     },
//   },
//   'Kashmir': {
//     0: {
//       "name": "Dal Lake",
//       "latitude": 34.0836,
//       "longitude": 74.7973,
//     },
//     1: {
//       "name": "Gulmarg",
//       "latitude": 34.0484,
//       "longitude": 74.3830,
//     },
//     2: {
//       "name": "Shalimar Bagh",
//       "latitude": 34.1516,
//       "longitude": 74.8660,
//     },
//     3: {
//       "name": "Nishat Bagh",
//       "latitude": 34.0900,
//       "longitude": 74.7975,
//     },
//     4: {
//       "name": "Betaab Valley",
//       "latitude": 34.0110,
//       "longitude": 74.3015,
//     },
//     5: {
//       "name": "Aru Valley",
//       "latitude": 34.0053,
//       "longitude": 75.1967,
//     },
//     6: {
//       "name": "Pahalgam",
//       "latitude": 34.0144,
//       "longitude": 75.3250,
//     },
//     7: {
//       "name": "Sonamarg",
//       "latitude": 34.3100,
//       "longitude": 75.2424,
//     },
//     8: {
//       "name": "Dachigam National Park",
//       "latitude": 34.1834,
//       "longitude": 74.6663,
//     },
//   },
// };

Map<String, Map<String, dynamic>> placesData = {
  "Darjeeling": {
    "image": "assets/images/darjeeling_1.jpeg",
    "state": "West Bengal, India",
    "description": "Experience breathtaking views of the Himalayas, lush tea gardens, and the enchanting Toy Train in the serene hills of Darjeeling.",
    "destinations": {
      0: {
        "name": "Tiger Hill",
        "latitude": 27.0125,
        "longitude": 88.2636,
      },
      1: {
        "name": "Batasia Loop",
        "latitude": 27.0333,
        "longitude": 88.2471,
      },
      2: {
        "name": "Padmaja Naidu Himalayan Zoological Park",
        "latitude": 27.0575,
        "longitude": 88.2590,
      },
      3: {
        "name": "Peace Pagoda",
        "latitude": 27.0547,
        "longitude": 88.2677,
      },
      4: {
        "name": "Darjeeling Himalayan Railway",
        "latitude": 27.0486,
        "longitude": 88.2644,
      },
      5: {
        "name": "Rock Garden",
        "latitude": 27.0140,
        "longitude": 88.2810,
      },
      6: {
        "name": "Observatory Hill",
        "latitude": 27.0424,
        "longitude": 88.2674,
      },
      7: {
        "name": "Ghoom Monastery",
        "latitude": 27.0115,
        "longitude": 88.2447,
      },
      8: {
        "name": "Mahakal Temple",
        "latitude": 27.0410,
        "longitude": 88.2675,
      },
    },
  },

  "Kashmir": {
    "image": "assets/images/kashmir.jpeg",
    "state": "Jammu and Kashmir, India",
    "description": "Discover the paradise on Earth with its pristine lakes, majestic mountains, and vibrant gardens in the picturesque Kashmir Valley.",
    "destinations": {
      0: {
        "name": "Dal Lake",
        "latitude": 34.0836,
        "longitude": 74.7973,
      },
      1: {
        "name": "Gulmarg",
        "latitude": 34.0484,
        "longitude": 74.3830,
      },
      2: {
        "name": "Shalimar Bagh",
        "latitude": 34.1516,
        "longitude": 74.8660,
      },
      3: {
        "name": "Nishat Bagh",
        "latitude": 34.0900,
        "longitude": 74.7975,
      },
      4: {
        "name": "Betaab Valley",
        "latitude": 34.0110,
        "longitude": 74.3015,
      },
      5: {
        "name": "Aru Valley",
        "latitude": 34.0053,
        "longitude": 75.1967,
      },
      6: {
        "name": "Pahalgam",
        "latitude": 34.0144,
        "longitude": 75.3250,
      },
      7: {
        "name": "Sonamarg",
        "latitude": 34.3100,
        "longitude": 75.2424,
      },
      8: {
        "name": "Dachigam National Park",
        "latitude": 34.1834,
        "longitude": 74.6663,
      },
    },
  },

  "Sundarban": {
    "image": "assets/images/sundarban.jpeg",
    "state": "Weat Bengal, India",
    "description": "Explore the world's largest mangrove forest, home to the majestic Royal Bengal Tiger and diverse wildlife in the mystical Sundarbans.",
    "destinations": {
      0: {
        "name": "Sundarbans National Park",
        "latitude": 21.9497,
        "longitude": 88.8914,
      },
      1: {
        "name": "Sajnekhali Bird Sanctuary",
        "latitude": 22.1758,
        "longitude": 88.9722,
      },
      2: {
        "name": "Dobanki Watch Tower",
        "latitude": 22.0384,
        "longitude": 88.8500,
      },
      3: {
        "name": "Netidhopani Watch Tower",
        "latitude": 22.0358,
        "longitude": 88.8624,
      },
      4: {
        "name": "Kanak",
        "latitude": 22.1234,
        "longitude": 88.9143,
      },
      5: {
        "name": "Bhagabatpur Crocodile Project",
        "latitude": 21.9527,
        "longitude": 88.9512,
      },
      6: {
        "name": "Bonnie Camp",
        "latitude": 21.9571,
        "longitude": 88.9825,
      },
      7: {
        "name": "Jharkhali Tiger Reserve",
        "latitude": 21.9463,
        "longitude": 88.9857,
      },
      8: {
        "name": "Kotka Wildlife Sanctuary",
        "latitude": 22.1243,
        "longitude": 88.8849,
      },
    },
  },

  "Goa": {
    "image": "assets/images/goa_2.jpeg",
    "state": "Goa, India",
    "description": "Experience the sun-kissed beaches, vibrant nightlife, and Portuguese heritage in the coastal paradise of Goa.",
    "destinations": {
      0: {"name": "Baga Beach", "latitude": 15.5601, "longitude": 73.7538},
      1: {"name": "Calangute Beach", "latitude": 15.5546, "longitude": 73.7550},
      2: {"name": "Anjuna Beach", "latitude": 15.5649, "longitude": 73.7416},
      3: {"name": "Dudhsagar Falls", "latitude": 15.3144, "longitude": 74.3147},
      4: {"name": "Fort Aguada", "latitude": 15.4988, "longitude": 73.7652},
      5: {"name": "Chapora Fort", "latitude": 15.6030, "longitude": 73.7397},
      6: {"name": "Basilica of Bom Jesus", "latitude": 15.5028, "longitude": 73.9110},
      7: {"name": "Dona Paula", "latitude": 15.4825, "longitude": 73.7659},
      8: {"name": "Naval Aviation Museum", "latitude": 15.3772, "longitude": 73.8360},
    },
  },

  "Ooty": {
    "image": "assets/images/ooty.jpeg",
    "state": "Tamil Nadu, India",
    "description": "Revel in the beauty of the 'Queen of Hill Stations' with its sprawling tea gardens, serene lakes, and captivating Nilgiri Mountain views in Ooty.",
    "destinations": {
      0: {
        "name": "Botanical Gardens",
        "latitude": 11.4167,
        "longitude": 76.7000,
      },
      1: {
        "name": "Ooty Lake",
        "latitude": 11.4100,
        "longitude": 76.6900,
      },
      2: {
        "name": "Doddabetta Peak",
        "latitude": 11.4030,
        "longitude": 76.7355,
      },
      3: {
        "name": "Rose Garden",
        "latitude": 11.4167,
        "longitude": 76.6950,
      },
      4: {
        "name": "Pykara Lake",
        "latitude": 11.4917,
        "longitude": 76.5967,
      },
      5: {
        "name": "Avalanche Lake",
        "latitude": 11.3250,
        "longitude": 76.6536,
      },
      6: {
        "name": "St. Stephen's Church",
        "latitude": 11.4105,
        "longitude": 76.6964,
      },
      7: {
        "name": "Emerald Lake",
        "latitude": 11.3447,
        "longitude": 76.6283,
      },
      8: {
        "name": "Tea Museum",
        "latitude": 11.4011,
        "longitude": 76.7351,
      },
    },
  },

  "Munnar": {
    "image": "assets/images/munnar.jpeg",
    "state": "Kerala, India",
    "description": "Immerse yourself in the scenic beauty of Munnar, known for its endless tea plantations, rolling hills, and rich biodiversity.",
    "destinations": {
      0: {
        "name": "Eravikulam National Park",
        "latitude": 10.2043,
        "longitude": 77.0427,
      },
      1: {
        "name": "Mattupetty Dam",
        "latitude": 10.0990,
        "longitude": 77.1410,
      },
      2: {
        "name": "Tea Gardens",
        "latitude": 10.0892,
        "longitude": 77.0595,
      },
      3: {
        "name": "Anamudi Peak",
        "latitude": 10.1650,
        "longitude": 77.0600,
      },
      4: {
        "name": "Attukad Waterfalls",
        "latitude": 10.0433,
        "longitude": 76.9983,
      },
      5: {
        "name": "Top Station",
        "latitude": 10.1060,
        "longitude": 77.2487,
      },
      6: {
        "name": "Kundala Lake",
        "latitude": 10.1376,
        "longitude": 77.2550,
      },
      7: {
        "name": "Pothamedu View Point",
        "latitude": 10.0870,
        "longitude": 77.0610,
      },
      8: {
        "name": "Chinnar Wildlife Sanctuary",
        "latitude": 10.3475,
        "longitude": 77.1783,
      },
    },
  },
};

Map<String, Map<String, dynamic>> emotionsData = {
  "Ooty": {
    "image": "assets/images/ooty.jpeg",
    "state": "Tamil Nadu, India",
    "description": "Revel in the beauty of the 'Queen of Hill Stations' with its sprawling tea gardens, serene lakes, and captivating Nilgiri Mountain views in Ooty.",
    "destinations": {
      0: {
        "name": "Botanical Gardens",
        "latitude": 11.4167,
        "longitude": 76.7000,
      },
      1: {
        "name": "Ooty Lake",
        "latitude": 11.4100,
        "longitude": 76.6900,
      },
      2: {
        "name": "Doddabetta Peak",
        "latitude": 11.4030,
        "longitude": 76.7355,
      },
      3: {
        "name": "Rose Garden",
        "latitude": 11.4167,
        "longitude": 76.6950,
      },
      4: {
        "name": "Pykara Lake",
        "latitude": 11.4917,
        "longitude": 76.5967,
      },
      5: {
        "name": "Avalanche Lake",
        "latitude": 11.3250,
        "longitude": 76.6536,
      },
      6: {
        "name": "St. Stephen's Church",
        "latitude": 11.4105,
        "longitude": 76.6964,
      },
      7: {
        "name": "Emerald Lake",
        "latitude": 11.3447,
        "longitude": 76.6283,
      },
      8: {
        "name": "Tea Museum",
        "latitude": 11.4011,
        "longitude": 76.7351,
      },
    },
  },

  "Munnar": {
    "image": "assets/images/munnar.jpeg",
    "state": "Kerala, India",
    "description": "Immerse yourself in the scenic beauty of Munnar, known for its endless tea plantations, rolling hills, and rich biodiversity.",
    "destinations": {
      0: {
        "name": "Eravikulam National Park",
        "latitude": 10.2043,
        "longitude": 77.0427,
      },
      1: {
        "name": "Mattupetty Dam",
        "latitude": 10.0990,
        "longitude": 77.1410,
      },
      2: {
        "name": "Tea Gardens",
        "latitude": 10.0892,
        "longitude": 77.0595,
      },
      3: {
        "name": "Anamudi Peak",
        "latitude": 10.1650,
        "longitude": 77.0600,
      },
      4: {
        "name": "Attukad Waterfalls",
        "latitude": 10.0433,
        "longitude": 76.9983,
      },
      5: {
        "name": "Top Station",
        "latitude": 10.1060,
        "longitude": 77.2487,
      },
      6: {
        "name": "Kundala Lake",
        "latitude": 10.1376,
        "longitude": 77.2550,
      },
      7: {
        "name": "Pothamedu View Point",
        "latitude": 10.0870,
        "longitude": 77.0610,
      },
      8: {
        "name": "Chinnar Wildlife Sanctuary",
        "latitude": 10.3475,
        "longitude": 77.1783,
      },
    },
  },

  "Sundarban": {
    "image": "assets/images/sundarban.jpeg",
    "state": "West Bengal, India",
    "description": "Explore the world's largest mangrove forest, home to the majestic Royal Bengal Tiger and diverse wildlife in the mystical Sundarbans.",
    "destinations": {
      0: {
        "name": "Sundarbans National Park",
        "latitude": 21.9497,
        "longitude": 88.8914,
      },
      1: {
        "name": "Sajnekhali Bird Sanctuary",
        "latitude": 22.1758,
        "longitude": 88.9722,
      },
      2: {
        "name": "Dobanki Watch Tower",
        "latitude": 22.0384,
        "longitude": 88.8500,
      },
      3: {
        "name": "Netidhopani Watch Tower",
        "latitude": 22.0358,
        "longitude": 88.8624,
      },
      4: {
        "name": "Kanak",
        "latitude": 22.1234,
        "longitude": 88.9143,
      },
      5: {
        "name": "Bhagabatpur Crocodile Project",
        "latitude": 21.9527,
        "longitude": 88.9512,
      },
      6: {
        "name": "Bonnie Camp",
        "latitude": 21.9571,
        "longitude": 88.9825,
      },
      7: {
        "name": "Jharkhali Tiger Reserve",
        "latitude": 21.9463,
        "longitude": 88.9857,
      },
      8: {
        "name": "Kotka Wildlife Sanctuary",
        "latitude": 22.1243,
        "longitude": 88.8849,
      },
    },
  },
};

Map<String, Map<String, dynamic>> historicalsData = {
  "Taj Mahal": {
    "image": "assets/images/taj mahal.jpeg",
    "state": "Uttar Pradesh, India",
    "description": "The Taj Mahal, a UNESCO World Heritage Site, is a magnificent white marble mausoleum built by Emperor Shah Jahan in memory of his wife Mumtaz Mahal.",
    "latitude": 27.1751,
    "longitude": 78.0421,
  },
  "Red Fort": {
    "image": "assets/images/red fort.jpeg",
    "state": "Delhi, India",
    "description": "The Red Fort is a historic fortification in the city of Delhi. It served as the main residence of the Mughal Emperors for nearly 200 years.",
    "latitude": 28.6562,
    "longitude": 77.2410,
  },
  "Victoria Memorial": {
    "image": "assets/images/victoria memorial.jpeg",
    "state": "West Bengal, India",
    "description": "The Victoria Memorial, located in Kolkata, is a large marble building dedicated to the memory of Queen Victoria, and now serves as a museum and tourist destination.",
    "latitude": 22.5448,
    "longitude": 88.3426,
  },
};

List<Map<String, dynamic>> hotAirBalloonDestinations = [
  {
    "place": "Manali",
    "name": "Solang Valley",
    "latitude": 32.3166,
    "longitude": 77.1575,
  },
  {
    "place": "Darjeeling",
    "name": "Tiger Hill",
    "latitude": 27.0125,
    "longitude": 88.2636,
  },
  {
    "place": "Agra",
    "name": "Taj Mahal",
    "latitude": 27.1751,
    "longitude": 78.0421,
  },
  {
    "place": "Delhi",
    "name": "India Gate",
    "latitude": 28.6129,
    "longitude": 77.2295,
  }
];

List<Map<String, dynamic>> hikingDestinations = [
  {
    "place": "Darjeeling",
    "name": "Tiger Hill",
    "latitude": 27.0125,
    "longitude": 88.2636,
  },
  {
    "place": "Darjeeling",
    "name": "Observatory Hill",
    "latitude": 27.0424,
    "longitude": 88.2674,
  },
  {
    "place": "Darjeeling",
    "name": "Peace Pagoda",
    "latitude": 27.0547,
    "longitude": 88.2677,
  },
  {
    "place": "Kashmir",
    "name": "Gulmarg",
    "latitude": 34.0484,
    "longitude": 74.3830,
  },
  {
    "place": "Kashmir",
    "name": "Pahalgam",
    "latitude": 34.0144,
    "longitude": 75.3250,
  },
  {
    "place": "Kashmir",
    "name": "Sonamarg",
    "latitude": 34.3100,
    "longitude": 75.2424,
  },
  {
    "place": "Ooty",
    "name": "Doddabetta Peak",
    "latitude": 11.4030,
    "longitude": 76.7355,
  },
  {
    "place": "Munnar",
    "name": "Anamudi Peak",
    "latitude": 10.1650,
    "longitude": 77.0600,
  },
  {
    "place": "Munnar",
    "name": "Pothamedu View Point",
    "latitude": 10.0870,
    "longitude": 77.0610,
  }
];

List<Map<String, dynamic>> canoeingDestinations = [
  {
    "place": "Kashmir",
    "name": "Dal Lake",
    "latitude": 34.0836,
    "longitude": 74.7973,
  },
  {
    "place": "Kashmir",
    "name": "Betaab Valley",
    "latitude": 34.0110,
    "longitude": 74.3015,
  },
  {
    "place": "Kashmir",
    "name": "Aru Valley",
    "latitude": 34.0053,
    "longitude": 75.1967,
  },
  {
    "place": "Kashmir",
    "name": "Pahalgam",
    "latitude": 34.0144,
    "longitude": 75.3250,
  },
  {
    "place": "Kashmir",
    "name": "Sonamarg",
    "latitude": 34.3100,
    "longitude": 75.2424,
  },
  {
    "place": "Sundarban",
    "name": "Sundarbans National Park",
    "latitude": 21.9497,
    "longitude": 88.8914,
  },
  {
    "place": "Sundarban",
    "name": "Dobanki Watch Tower",
    "latitude": 22.0384,
    "longitude": 88.8500,
  },
  {
    "place": "Sundarban",
    "name": "Netidhopani Watch Tower",
    "latitude": 22.0358,
    "longitude": 88.8624,
  },
  {
    "place": "Sundarban",
    "name": "Kanak",
    "latitude": 22.1234,
    "longitude": 88.9143,
  },
  {
    "place": "Sundarban",
    "name": "Bonnie Camp",
    "latitude": 21.9571,
    "longitude": 88.9825,
  },
];

Map<String, Map<String, dynamic>> exploreData = {
  "Hot Air Balloon":{
    "image" : "assets/images/balloning.jpeg",
    "description" : "Experience serene and breathtaking views as you float above picturesque landscapes in a hot air balloon, offering a unique and peaceful way to explore the beauty of nature from above.",
    "destinations" :{
      0 : {
        "place": "Manali",
        "name": "Solang Valley",
        "latitude": 32.3166,
        "longitude": 77.1575,
      },
      1 : {
        "place": "Darjeeling",
        "name": "Tiger Hill",
        "latitude": 27.0125,
        "longitude": 88.2636,
      },
    }
  },

  "Hiking" : {
    "image" : "assets/images/hiking.jpeg",
    "description" : "Embark on a thrilling hiking adventure, traversing diverse terrains from lush forests to rugged mountains. Enjoy the physical challenge and the opportunity to connect with nature and breathtaking vistas.",
    "destinations" : {
      0 : {
        "place": "Darjeeling",
        "name": "Tiger Hill",
        "latitude": 27.0125,
        "longitude": 88.2636,
      },
      1 : {
        "place": "Darjeeling",
        "name": "Observatory Hill",
        "latitude": 27.0424,
        "longitude": 88.2674,
      },
      2 : {
        "place": "Darjeeling",
        "name": "Peace Pagoda",
        "latitude": 27.0547,
        "longitude": 88.2677,
      },
      3 : {
        "place": "Kashmir",
        "name": "Gulmarg",
        "latitude": 34.0484,
        "longitude": 74.3830,
      },
      4 : {
        "place": "Kashmir",
        "name": "Pahalgam",
        "latitude": 34.0144,
        "longitude": 75.3250,
      },
      5 : {
        "place": "Kashmir",
        "name": "Sonamarg",
        "latitude": 34.3100,
        "longitude": 75.2424,
      },
      6 : {
        "place": "Ooty",
        "name": "Doddabetta Peak",
        "latitude": 11.4030,
        "longitude": 76.7355,
      },
      7 : {
        "place": "Munnar",
        "name": "Anamudi Peak",
        "latitude": 10.1650,
        "longitude": 77.0600,
      },
      8 : {
        "place": "Munnar",
        "name": "Pothamedu View Point",
        "latitude": 10.0870,
        "longitude": 77.0610,
      }
    }
  },

  "Canoeing" : {
    "image" : "assets/images/canoening.jpeg",
    "description" : "Navigate serene lakes and winding rivers in a canoe, immersing yourself in the tranquility of water adventures. Enjoy the blend of physical activity and the peacefulness of natural waterways.",
    "destinations" : {
      0 : {
        "place": "Kashmir",
        "name": "Dal Lake",
        "latitude": 34.0836,
        "longitude": 74.7973,
      },
      1 : {
        "place": "Kashmir",
        "name": "Betaab Valley",
        "latitude": 34.0110,
        "longitude": 74.3015,
      },
      2 : {
        "place": "Kashmir",
        "name": "Aru Valley",
        "latitude": 34.0053,
        "longitude": 75.1967,
      },
      3 : {
        "place": "Kashmir",
        "name": "Pahalgam",
        "latitude": 34.0144,
        "longitude": 75.3250,
      },
      4 : {
        "place": "Kashmir",
        "name": "Sonamarg",
        "latitude": 34.3100,
        "longitude": 75.2424,
      },
      5 : {
        "place": "Sundarban",
        "name": "Sundarbans National Park",
        "latitude": 21.9497,
        "longitude": 88.8914,
      },
      6 : {
        "place": "Sundarban",
        "name": "Dobanki Watch Tower",
        "latitude": 22.0384,
        "longitude": 88.8500,
      },
      7 : {
        "place": "Sundarban",
        "name": "Netidhopani Watch Tower",
        "latitude": 22.0358,
        "longitude": 88.8624,
      },
      8 : {
        "place": "Sundarban",
        "name": "Kanak",
        "latitude": 22.1234,
        "longitude": 88.9143,
      },
      9 : {
        "place": "Sundarban",
        "name": "Bonnie Camp",
        "latitude": 21.9571,
        "longitude": 88.9825,
      },
    }
  },

  "Rock Climbing" : {
    "image" : "assets/images/rock_climbing.jpg",
    "description" : "Test your strength and endurance by scaling natural rock formations. Rock climbing offers an adrenaline-pumping experience, combining physical challenge with the thrill of conquering nature's obstacles.",
    "destinations" : {
      0 : {
        "place": "Hampi",
        "name": "Hampi Boulders",
        "latitude": 15.3350,
        "longitude": 76.4600,
      },
      1 : {
        "place": "Badami",
        "name": "Badami Cliffs",
        "latitude": 15.9149,
        "longitude": 75.6768,
      },
      2 : {
        "place": "Pune",
        "name": "Sinhagad Fort",
        "latitude": 18.3664,
        "longitude": 73.7550,
      },
      3 : {
        "place": "Bangalore",
        "name": "Ramanagara",
        "latitude": 12.7278,
        "longitude": 77.2755,
      },
      4 : {
        "place": "Sethan, Manali",
        "name": "Sethan Boulders",
        "latitude": 32.2396,
        "longitude": 77.1887,
      },
      5 : {
        "place": "Malshej Ghat, Maharashtra",
        "name": "Ajoba Hill Fort",
        "latitude": 19.4181,
        "longitude": 73.7734,
      },
      6 : {
        "place": "Mount Abu, Rajasthan",
        "name": "Toad Rock",
        "latitude": 24.5937,
        "longitude": 72.7080,
      },
      7 : {
        "place": "Miyar Valley, Himachal Pradesh",
        "name": "Miyar Valley",
        "latitude": 32.7930,
        "longitude": 76.7318,
      }
    }
  },

  "Paragliding" : {
    "image" : "assets/images/paragliding.jpg",
    "description" : "Soar through the skies like a bird with paragliding, an exhilarating adventure sport offering panoramic views and the thrill of free flight. Ideal for adrenaline seekers and nature lovers alike.",
    "destinations" : {
      0 : {
        "place": "Bir Billing, Himachal Pradesh",
        "name": "Bir Billing",
        "latitude": 32.0420,
        "longitude": 76.7221,
      },
      1 : {
        "place": "Manali, Himachal Pradesh",
        "name": "Solang Valley",
        "latitude": 32.3166,
        "longitude": 77.1575,
      },
      2 : {
        "place": "Kamshet, Maharashtra",
        "name": "Kamshet",
        "latitude": 18.7578,
        "longitude": 73.5581,
      },
      3 : {
        "place": "Nainital, Uttarakhand",
        "name": "Naukuchiatal",
        "latitude": 29.3183,
        "longitude": 79.6080,
      },
      4 : {
        "place": "Gangtok, Sikkim",
        "name": "Tashi View Point",
        "latitude": 27.3671,
        "longitude": 88.6138,
      },
      5 : {
        "place": "Panchgani, Maharashtra",
        "name": "Table Land",
        "latitude": 17.9249,
        "longitude": 73.7997,
      },
      6 : {
        "place": "Yelagiri, Tamil Nadu",
        "name": "Yelagiri",
        "latitude": 12.5790,
        "longitude": 78.6357,
      }
    }
  },
};