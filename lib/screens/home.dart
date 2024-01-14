import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pixelverse/components/imgcard.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static List<Map<String, dynamic>> dummydata = [
    {'title': 'This is our first task. Yaay 🎉', 'color': 0xFFC3AEFF},
    {'title': 'Let’s create a tutorial for flutter  apps', 'color': 0xFFFFAF95},
    {
      'title': 'First, we need an appbar which should contain our title',
      'color': 0xFFFFD990
    },
    {'title': 'Now we need some dummy tasks', 'color': 0xFFABFFE1},
  ];
  static Map f = {
    "page": 1,
    "per_page": 15,
    "photos": [
      {
        "id": 19577229,
        "width": 3456,
        "height": 5184,
        "url":
            "https://www.pexels.com/photo/a-woman-holding-a-hamburger-with-a-pink-ribbon-19577229/",
        "photographer": "Avery Arwood",
        "photographer_url": "https://www.pexels.com/@avery-arwood-713708816",
        "photographer_id": 713708816,
        "avg_color": "#8798A0",
        "src": {
          "original":
              "https://images.pexels.com/photos/19577229/pexels-photo-19577229.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19577229/pexels-photo-19577229.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19577229/pexels-photo-19577229.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19577229/pexels-photo-19577229.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19577229/pexels-photo-19577229.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19577229/pexels-photo-19577229.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19577229/pexels-photo-19577229.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19577229/pexels-photo-19577229.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": ""
      },
      {
        "id": 19628394,
        "width": 4160,
        "height": 6240,
        "url":
            "https://www.pexels.com/photo/a-little-girl-sitting-in-the-snow-with-a-christmas-tree-19628394/",
        "photographer": "Alexander Mass",
        "photographer_url": "https://www.pexels.com/@alexander-mass-748453803",
        "photographer_id": 748453803,
        "avg_color": "#676B6A",
        "src": {
          "original":
              "https://images.pexels.com/photos/19628394/pexels-photo-19628394.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19628394/pexels-photo-19628394.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19628394/pexels-photo-19628394.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19628394/pexels-photo-19628394.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19628394/pexels-photo-19628394.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19628394/pexels-photo-19628394.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19628394/pexels-photo-19628394.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19628394/pexels-photo-19628394.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": ""
      },
      {
        "id": 19620408,
        "width": 2592,
        "height": 3888,
        "url":
            "https://www.pexels.com/photo/a-car-is-parked-on-a-hillside-with-mountains-in-the-background-19620408/",
        "photographer": "Andreas -",
        "photographer_url": "https://www.pexels.com/@andreas-246992646",
        "photographer_id": 246992646,
        "avg_color": "#C0A07A",
        "src": {
          "original":
              "https://images.pexels.com/photos/19620408/pexels-photo-19620408.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19620408/pexels-photo-19620408.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19620408/pexels-photo-19620408.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19620408/pexels-photo-19620408.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19620408/pexels-photo-19620408.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19620408/pexels-photo-19620408.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19620408/pexels-photo-19620408.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19620408/pexels-photo-19620408.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": ""
      },
      {
        "id": 19620956,
        "width": 3648,
        "height": 5472,
        "url":
            "https://www.pexels.com/photo/a-woman-posing-in-a-doorway-19620956/",
        "photographer": "Rajaa Lemnari",
        "photographer_url": "https://www.pexels.com/@rajaa-lemnari-857487426",
        "photographer_id": 857487426,
        "avg_color": "#543437",
        "src": {
          "original":
              "https://images.pexels.com/photos/19620956/pexels-photo-19620956.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19620956/pexels-photo-19620956.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19620956/pexels-photo-19620956.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19620956/pexels-photo-19620956.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19620956/pexels-photo-19620956.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19620956/pexels-photo-19620956.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19620956/pexels-photo-19620956.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19620956/pexels-photo-19620956.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": "Free stock photo of fashion photography, marrakech, morocco"
      },
      {
        "id": 19611701,
        "width": 6960,
        "height": 4640,
        "url": "https://www.pexels.com/photo/xmas-19611701/",
        "photographer": "Efrem  Efre",
        "photographer_url": "https://www.pexels.com/@efrem-efre-2786187",
        "photographer_id": 2786187,
        "avg_color": "#9E9495",
        "src": {
          "original":
              "https://images.pexels.com/photos/19611701/pexels-photo-19611701.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19611701/pexels-photo-19611701.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19611701/pexels-photo-19611701.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19611701/pexels-photo-19611701.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19611701/pexels-photo-19611701.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19611701/pexels-photo-19611701.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19611701/pexels-photo-19611701.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19611701/pexels-photo-19611701.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": "Xmas "
      },
      {
        "id": 19584288,
        "width": 3376,
        "height": 6000,
        "url":
            "https://www.pexels.com/photo/a-reflection-of-a-building-in-a-river-19584288/",
        "photographer": "Andreas Schnabl",
        "photographer_url": "https://www.pexels.com/@andreas-schnabl-1775843",
        "photographer_id": 1775843,
        "avg_color": "#929695",
        "src": {
          "original":
              "https://images.pexels.com/photos/19584288/pexels-photo-19584288.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19584288/pexels-photo-19584288.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19584288/pexels-photo-19584288.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19584288/pexels-photo-19584288.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19584288/pexels-photo-19584288.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19584288/pexels-photo-19584288.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19584288/pexels-photo-19584288.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19584288/pexels-photo-19584288.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": ""
      },
      {
        "id": 19665569,
        "width": 3516,
        "height": 5274,
        "url":
            "https://www.pexels.com/photo/a-couple-standing-in-the-middle-of-a-pool-19665569/",
        "photographer": "Rajaa Lemnari",
        "photographer_url": "https://www.pexels.com/@rajaa-lemnari-857487426",
        "photographer_id": 857487426,
        "avg_color": "#B2ADA7",
        "src": {
          "original":
              "https://images.pexels.com/photos/19665569/pexels-photo-19665569.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19665569/pexels-photo-19665569.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19665569/pexels-photo-19665569.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19665569/pexels-photo-19665569.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19665569/pexels-photo-19665569.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19665569/pexels-photo-19665569.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19665569/pexels-photo-19665569.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19665569/pexels-photo-19665569.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt":
            "Free stock photo of couple goals, couple in love, fashion photography"
      },
      {
        "id": 19567571,
        "width": 2624,
        "height": 3936,
        "url":
            "https://www.pexels.com/photo/man-and-woman-on-meadow-together-19567571/",
        "photographer": "Elif Aksoy",
        "photographer_url": "https://www.pexels.com/@birseydaha",
        "photographer_id": 162268239,
        "avg_color": "#736D6D",
        "src": {
          "original":
              "https://images.pexels.com/photos/19567571/pexels-photo-19567571.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19567571/pexels-photo-19567571.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19567571/pexels-photo-19567571.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19567571/pexels-photo-19567571.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19567571/pexels-photo-19567571.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19567571/pexels-photo-19567571.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19567571/pexels-photo-19567571.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19567571/pexels-photo-19567571.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": ""
      },
      {
        "id": 19562326,
        "width": 3506,
        "height": 4909,
        "url":
            "https://www.pexels.com/photo/woman-wearing-pastel-colour-clothing-posing-outdoors-19562326/",
        "photographer": "Kateryna Tsurik",
        "photographer_url": "https://www.pexels.com/@kateryna-tsurik-505461005",
        "photographer_id": 505461005,
        "avg_color": "#8C857F",
        "src": {
          "original":
              "https://images.pexels.com/photos/19562326/pexels-photo-19562326.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19562326/pexels-photo-19562326.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19562326/pexels-photo-19562326.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19562326/pexels-photo-19562326.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19562326/pexels-photo-19562326.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19562326/pexels-photo-19562326.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19562326/pexels-photo-19562326.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19562326/pexels-photo-19562326.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": ""
      },
      {
        "id": 19562063,
        "width": 3564,
        "height": 4084,
        "url":
            "https://www.pexels.com/photo/view-of-people-surfing-on-the-sea-19562063/",
        "photographer": "Bishnu ghale",
        "photographer_url": "https://www.pexels.com/@bishnu-ghale-854254931",
        "photographer_id": 854254931,
        "avg_color": "#818479",
        "src": {
          "original":
              "https://images.pexels.com/photos/19562063/pexels-photo-19562063.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19562063/pexels-photo-19562063.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19562063/pexels-photo-19562063.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19562063/pexels-photo-19562063.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19562063/pexels-photo-19562063.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19562063/pexels-photo-19562063.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19562063/pexels-photo-19562063.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19562063/pexels-photo-19562063.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": "surfing"
      },
      {
        "id": 19562112,
        "width": 4016,
        "height": 6016,
        "url":
            "https://www.pexels.com/photo/interior-of-the-china-high-speed-rail-building-west-kowloon-hong-kong-china-19562112/",
        "photographer": "king Ho",
        "photographer_url": "https://www.pexels.com/@king",
        "photographer_id": 126767734,
        "avg_color": "#66635C",
        "src": {
          "original":
              "https://images.pexels.com/photos/19562112/pexels-photo-19562112.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19562112/pexels-photo-19562112.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19562112/pexels-photo-19562112.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19562112/pexels-photo-19562112.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19562112/pexels-photo-19562112.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19562112/pexels-photo-19562112.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19562112/pexels-photo-19562112.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19562112/pexels-photo-19562112.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": ""
      },
      {
        "id": 19561004,
        "width": 2373,
        "height": 3505,
        "url":
            "https://www.pexels.com/photo/young-man-in-denim-overalls-standing-next-to-a-tree-19561004/",
        "photographer": "Swati Dvh",
        "photographer_url": "https://www.pexels.com/@swati-dvh-811011393",
        "photographer_id": 811011393,
        "avg_color": "#717165",
        "src": {
          "original":
              "https://images.pexels.com/photos/19561004/pexels-photo-19561004.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19561004/pexels-photo-19561004.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19561004/pexels-photo-19561004.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19561004/pexels-photo-19561004.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19561004/pexels-photo-19561004.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19561004/pexels-photo-19561004.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19561004/pexels-photo-19561004.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19561004/pexels-photo-19561004.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": ""
      },
      {
        "id": 19561006,
        "width": 6000,
        "height": 8841,
        "url":
            "https://www.pexels.com/photo/young-woman-sitting-among-succulents-19561006/",
        "photographer": "Swati Dvh",
        "photographer_url": "https://www.pexels.com/@swati-dvh-811011393",
        "photographer_id": 811011393,
        "avg_color": "#5B6157",
        "src": {
          "original":
              "https://images.pexels.com/photos/19561006/pexels-photo-19561006.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19561006/pexels-photo-19561006.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19561006/pexels-photo-19561006.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19561006/pexels-photo-19561006.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19561006/pexels-photo-19561006.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19561006/pexels-photo-19561006.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19561006/pexels-photo-19561006.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19561006/pexels-photo-19561006.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": ""
      },
      {
        "id": 19561297,
        "width": 4000,
        "height": 6000,
        "url":
            "https://www.pexels.com/photo/aerial-view-of-mountains-in-sunlight-19561297/",
        "photographer": "Ruslan Ataev",
        "photographer_url": "https://www.pexels.com/@ruslan-ataev-830130344",
        "photographer_id": 830130344,
        "avg_color": "#979191",
        "src": {
          "original":
              "https://images.pexels.com/photos/19561297/pexels-photo-19561297.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19561297/pexels-photo-19561297.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19561297/pexels-photo-19561297.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19561297/pexels-photo-19561297.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19561297/pexels-photo-19561297.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19561297/pexels-photo-19561297.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19561297/pexels-photo-19561297.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19561297/pexels-photo-19561297.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": "Зимнее утро в горах"
      },
      {
        "id": 19561445,
        "width": 3356,
        "height": 4968,
        "url":
            "https://www.pexels.com/photo/view-of-a-town-on-a-hill-19561445/",
        "photographer": "Ruslan Ataev",
        "photographer_url": "https://www.pexels.com/@ruslan-ataev-830130344",
        "photographer_id": 830130344,
        "avg_color": "#80807E",
        "src": {
          "original":
              "https://images.pexels.com/photos/19561445/pexels-photo-19561445.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19561445/pexels-photo-19561445.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19561445/pexels-photo-19561445.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19561445/pexels-photo-19561445.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19561445/pexels-photo-19561445.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19561445/pexels-photo-19561445.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19561445/pexels-photo-19561445.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19561445/pexels-photo-19561445.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": "Горное село"
      }
    ],
    "total_results": 8000,
    "next_page": "https://api.pexels.com/v1/curated/?page=2&per_page=15"
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimationLimiter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 375),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      curve: Curves.easeOut,
                      horizontalOffset: 20,
                      child: FadeInAnimation(
                        child: widget,
                        duration: const Duration(milliseconds: 400),
                        // delay: Duration(milliseconds: 100),
                      ),
                    ),
                    children: [
                      Text(
                        'Curated',
                        style: GoogleFonts.raleway(
                            textStyle: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w600)),
                      ),
                      Text(
                        ' just for you',
                        style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 14,
                                height: 0.9,
                                fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 46,
                child: AnimationConfiguration.synchronized(
                  duration: const Duration(milliseconds: 400),
                  child: ScaleAnimation(
                    scale: 0.5,
                    curve: Curves.easeInOut,
                    child: TextField(
                      style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                              fontSize: 15, color: Colors.grey)),
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.all(0),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            size: 20,
                            color: Colors.grey[600],
                          ),
                          hintText: 'Search wallpapers',
                          hintStyle: GoogleFonts.raleway(
                              textStyle: TextStyle(color: Colors.grey[600])),
                          fillColor: Colors.lightBlue[50],
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(40)),
                          filled: true),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 0, left: 4, right: 4),
                  child: AnimationLimiter(
                    child: MasonryGridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: f["photos"].length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: ScaleAnimation(
                                scale: 0.8,
                                curve: Curves.easeOut,
                                child: FadeInAnimation(
                                  delay: const Duration(milliseconds: 100),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: ImgCard(info: f['photos'][index]),
                                  ),
                                ),
                              ),
                            )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
