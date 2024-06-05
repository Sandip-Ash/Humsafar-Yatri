import 'package:flutter/material.dart';

Color iconColor = Colors.black;
Color bgColor = Colors.white;

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

Map destinations = {
  'Sundarban': {
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
  'Sikkim': {
    0: {
      "name": "Gurudongmar Lake",
      "latitude": 27.9879,
      "longitude": 88.7691,
    },
    1: {
      "name": "Nathula Pass",
      "latitude": 27.4315,
      "longitude": 88.6634,
    },
    2: {
      "name": "Rumtek Monastery",
      "latitude": 27.3036,
      "longitude": 88.6048,
    },
    3: {
      "name": "Tsomgo Lake",
      "latitude": 27.3782,
      "longitude": 88.8230,
    },
    4: {
      "name": "Yumthang Valley",
      "latitude": 27.9069,
      "longitude": 88.6881,
    },
    5: {
      "name": "Khangchendzonga National Park",
      "latitude": 27.3150,
      "longitude": 88.8506,
    },
    6: {
      "name": "Pelling",
      "latitude": 27.0675,
      "longitude": 88.2642,
    },
    7: {
      "name": "Lachen",
      "latitude": 27.7167,
      "longitude": 88.6300,
    },
    8: {
      "name": "Singalila National Park",
      "latitude": 27.0091,
      "longitude": 88.1143,
    },
  },
  'Ladakh': {
    0: {
      "name": "Pangong Lake",
      "latitude": 33.7498,
      "longitude": 78.8219,
    },
    1: {
      "name": "Nubra Valley",
      "latitude": 35.5461,
      "longitude": 77.8375,
    },
    2: {
      "name": "Hemis Monastery",
      "latitude": 34.1669,
      "longitude": 77.5829,
    },
    3: {
      "name": "Leh Palace",
      "latitude": 34.1649,
      "longitude": 77.5840,
    },
    4: {
      "name": "Tso Moriri Lake",
      "latitude": 32.9983,
      "longitude": 78.2430,
    },
    5: {
      "name": "Zanskar Valley",
      "latitude": 33.5940,
      "longitude": 76.0479,
    },
    6: {
      "name": "Shanti Stupa",
      "latitude": 34.0862,
      "longitude": 77.5591,
    },
    7: {
      "name": "Magnetic Hill",
      "latitude": 34.0804,
      "longitude": 77.5467,
    },
    8: {
      "name": "Thiksey Monastery",
      "latitude": 33.7390,
      "longitude": 78.0354,
    },
  },
  'Kashmir': {
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
};
