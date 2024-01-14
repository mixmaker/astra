import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/imgcard.dart';

class CollectionPage extends StatelessWidget {
  final String colId;
  final String colTitle;
  const CollectionPage(
      {super.key, required this.colId, required this.colTitle});
  static Map col = {
    "page": 1,
    "per_page": 15,
    "media": [
      {
        "type": "Photo",
        "id": 6157032,
        "width": 3377,
        "height": 3635,
        "url":
            "https://www.pexels.com/photo/ripe-fresh-peach-on-beige-background-6157032/",
        "photographer": "Laker",
        "photographer_url": "https://www.pexels.com/@laker",
        "photographer_id": 3688642,
        "avg_color": "#E89565",
        "src": {
          "original":
              "https://images.pexels.com/photos/6157032/pexels-photo-6157032.jpeg",
          "large2x":
              "https://images.pexels.com/photos/6157032/pexels-photo-6157032.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/6157032/pexels-photo-6157032.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/6157032/pexels-photo-6157032.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/6157032/pexels-photo-6157032.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/6157032/pexels-photo-6157032.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/6157032/pexels-photo-6157032.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/6157032/pexels-photo-6157032.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt":
            "High angle of whole healthy ripe peach placed on beige background in studio"
      },
      {
        "type": "Photo",
        "id": 7336640,
        "width": 3388,
        "height": 4235,
        "url":
            "https://www.pexels.com/photo/baby-giraffes-standing-under-palm-tree-7336640/",
        "photographer": "Tamara Velazquez",
        "photographer_url": "https://www.pexels.com/@tamarita",
        "photographer_id": 3479618,
        "avg_color": "#C5A496",
        "src": {
          "original":
              "https://images.pexels.com/photos/7336640/pexels-photo-7336640.jpeg",
          "large2x":
              "https://images.pexels.com/photos/7336640/pexels-photo-7336640.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/7336640/pexels-photo-7336640.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/7336640/pexels-photo-7336640.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/7336640/pexels-photo-7336640.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/7336640/pexels-photo-7336640.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/7336640/pexels-photo-7336640.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/7336640/pexels-photo-7336640.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": "Baby Giraffes Standing under Palm Tree"
      },
      {
        "type": "Photo",
        "id": 15172910,
        "width": 4016,
        "height": 6016,
        "url":
            "https://www.pexels.com/photo/woman-near-building-wall-15172910/",
        "photographer": "Alina Skazka",
        "photographer_url": "https://www.pexels.com/@alinaskazka",
        "photographer_id": 174849153,
        "avg_color": "#A68772",
        "src": {
          "original":
              "https://images.pexels.com/photos/15172910/pexels-photo-15172910.jpeg",
          "large2x":
              "https://images.pexels.com/photos/15172910/pexels-photo-15172910.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/15172910/pexels-photo-15172910.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/15172910/pexels-photo-15172910.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/15172910/pexels-photo-15172910.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/15172910/pexels-photo-15172910.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/15172910/pexels-photo-15172910.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/15172910/pexels-photo-15172910.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": "Woman near Building Wall"
      },
      {
        "type": "Photo",
        "id": 16548619,
        "width": 1667,
        "height": 2500,
        "url": "https://www.pexels.com/photo/lakeshore-at-sunrise-16548619/",
        "photographer": "marko_aim",
        "photographer_url": "https://www.pexels.com/@marko_aim-537690234",
        "photographer_id": 537690234,
        "avg_color": "#927265",
        "src": {
          "original":
              "https://images.pexels.com/photos/16548619/pexels-photo-16548619.jpeg",
          "large2x":
              "https://images.pexels.com/photos/16548619/pexels-photo-16548619.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/16548619/pexels-photo-16548619.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/16548619/pexels-photo-16548619.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/16548619/pexels-photo-16548619.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/16548619/pexels-photo-16548619.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/16548619/pexels-photo-16548619.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/16548619/pexels-photo-16548619.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": "Lakeshore at Sunrise"
      },
      {
        "type": "Photo",
        "id": 18208776,
        "width": 2592,
        "height": 3888,
        "url": "https://www.pexels.com/photo/rio-de-janeiro-18208776/",
        "photographer": "Jonathan Goncalves",
        "photographer_url": "https://www.pexels.com/@thisisjooh",
        "photographer_id": 1583890,
        "avg_color": "#C9BAA3",
        "src": {
          "original":
              "https://images.pexels.com/photos/18208776/pexels-photo-18208776.jpeg",
          "large2x":
              "https://images.pexels.com/photos/18208776/pexels-photo-18208776.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/18208776/pexels-photo-18208776.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/18208776/pexels-photo-18208776.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/18208776/pexels-photo-18208776.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/18208776/pexels-photo-18208776.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/18208776/pexels-photo-18208776.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/18208776/pexels-photo-18208776.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": "Rio de Janeiro"
      },
      {
        "type": "Photo",
        "id": 18609695,
        "width": 4000,
        "height": 6000,
        "url": "https://www.pexels.com/photo/blonde-model-posing-18609695/",
        "photographer": "Nano Erdozain",
        "photographer_url": "https://www.pexels.com/@nano-erdozain-120534369",
        "photographer_id": 120534369,
        "avg_color": "#845A4C",
        "src": {
          "original":
              "https://images.pexels.com/photos/18609695/pexels-photo-18609695.jpeg",
          "large2x":
              "https://images.pexels.com/photos/18609695/pexels-photo-18609695.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/18609695/pexels-photo-18609695.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/18609695/pexels-photo-18609695.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/18609695/pexels-photo-18609695.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/18609695/pexels-photo-18609695.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/18609695/pexels-photo-18609695.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/18609695/pexels-photo-18609695.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": "Blonde Model Posing"
      },
      {
        "type": "Photo",
        "id": 19700741,
        "width": 4640,
        "height": 6960,
        "url": "https://www.pexels.com/photo/venice-19700741/",
        "photographer": "Efrem  Efre",
        "photographer_url": "https://www.pexels.com/@efrem-efre-2786187",
        "photographer_id": 2786187,
        "avg_color": "#A7816C",
        "src": {
          "original":
              "https://images.pexels.com/photos/19700741/pexels-photo-19700741.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19700741/pexels-photo-19700741.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19700741/pexels-photo-19700741.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19700741/pexels-photo-19700741.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19700741/pexels-photo-19700741.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19700741/pexels-photo-19700741.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19700741/pexels-photo-19700741.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19700741/pexels-photo-19700741.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": "Venice "
      },
      {
        "type": "Photo",
        "id": 19701940,
        "width": 5184,
        "height": 3456,
        "url":
            "https://www.pexels.com/photo/sparrow-perching-on-tree-19701940/",
        "photographer": "Kadir Akman",
        "photographer_url": "https://www.pexels.com/@kadirakman",
        "photographer_id": 70589864,
        "avg_color": "#95836D",
        "src": {
          "original":
              "https://images.pexels.com/photos/19701940/pexels-photo-19701940.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19701940/pexels-photo-19701940.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19701940/pexels-photo-19701940.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19701940/pexels-photo-19701940.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19701940/pexels-photo-19701940.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19701940/pexels-photo-19701940.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19701940/pexels-photo-19701940.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19701940/pexels-photo-19701940.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": ""
      },
      {
        "type": "Photo",
        "id": 19716649,
        "width": 3024,
        "height": 4032,
        "url": "https://www.pexels.com/photo/kedarkantha-trek-19716649/",
        "photographer": "Ex Route Adventures",
        "photographer_url":
            "https://www.pexels.com/@ex-route-adventures-656223369",
        "photographer_id": 656223369,
        "avg_color": "#64534C",
        "src": {
          "original":
              "https://images.pexels.com/photos/19716649/pexels-photo-19716649.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19716649/pexels-photo-19716649.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19716649/pexels-photo-19716649.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19716649/pexels-photo-19716649.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19716649/pexels-photo-19716649.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19716649/pexels-photo-19716649.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19716649/pexels-photo-19716649.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19716649/pexels-photo-19716649.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": "Kedarkantha Trek"
      },
      {
        "type": "Photo",
        "id": 19718653,
        "width": 3311,
        "height": 4967,
        "url":
            "https://www.pexels.com/photo/fashion-people-woman-relaxation-19718653/",
        "photographer": "Kenzhar Sharap",
        "photographer_url": "https://www.pexels.com/@kenzhar-sharap-125323072",
        "photographer_id": 125323072,
        "avg_color": "#C4B6B6",
        "src": {
          "original":
              "https://images.pexels.com/photos/19718653/pexels-photo-19718653.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19718653/pexels-photo-19718653.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19718653/pexels-photo-19718653.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19718653/pexels-photo-19718653.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19718653/pexels-photo-19718653.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19718653/pexels-photo-19718653.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19718653/pexels-photo-19718653.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19718653/pexels-photo-19718653.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": "A woman in a white dress is sitting on a roof"
      },
      {
        "type": "Photo",
        "id": 19720781,
        "width": 3024,
        "height": 4032,
        "url":
            "https://www.pexels.com/photo/a-bunch-of-pink-roses-in-a-white-box-19720781/",
        "photographer": "Marina Zvada",
        "photographer_url": "https://www.pexels.com/@marina-zvada-844583049",
        "photographer_id": 844583049,
        "avg_color": "#B0A591",
        "src": {
          "original":
              "https://images.pexels.com/photos/19720781/pexels-photo-19720781.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19720781/pexels-photo-19720781.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19720781/pexels-photo-19720781.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19720781/pexels-photo-19720781.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19720781/pexels-photo-19720781.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19720781/pexels-photo-19720781.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19720781/pexels-photo-19720781.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19720781/pexels-photo-19720781.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": ""
      },
      {
        "type": "Photo",
        "id": 19725306,
        "width": 6576,
        "height": 4389,
        "url":
            "https://www.pexels.com/photo/a-woman-holding-a-pink-flower-in-front-of-a-cherry-tree-19725306/",
        "photographer": "Helena Jankovičová Kováčová",
        "photographer_url": "https://www.pexels.com/@helen1",
        "photographer_id": 3686880,
        "avg_color": "#A38D7F",
        "src": {
          "original":
              "https://images.pexels.com/photos/19725306/pexels-photo-19725306.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19725306/pexels-photo-19725306.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19725306/pexels-photo-19725306.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19725306/pexels-photo-19725306.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19725306/pexels-photo-19725306.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19725306/pexels-photo-19725306.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19725306/pexels-photo-19725306.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19725306/pexels-photo-19725306.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": ""
      },
      {
        "type": "Photo",
        "id": 19726255,
        "width": 4000,
        "height": 5328,
        "url":
            "https://www.pexels.com/photo/portrait-of-a-woman-in-peach-fuzz-colors-19726255/",
        "photographer": "Sherman Trotz",
        "photographer_url": "https://www.pexels.com/@nerdcinema",
        "photographer_id": 597215675,
        "avg_color": "#C5816C",
        "src": {
          "original":
              "https://images.pexels.com/photos/19726255/pexels-photo-19726255.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19726255/pexels-photo-19726255.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19726255/pexels-photo-19726255.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19726255/pexels-photo-19726255.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19726255/pexels-photo-19726255.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19726255/pexels-photo-19726255.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19726255/pexels-photo-19726255.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19726255/pexels-photo-19726255.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": ""
      },
      {
        "type": "Photo",
        "id": 19733182,
        "width": 4094,
        "height": 2724,
        "url":
            "https://www.pexels.com/photo/a-large-group-of-tall-buildings-in-the-distance-19733182/",
        "photographer": "Vera Bomstad",
        "photographer_url": "https://www.pexels.com/@aloevera",
        "photographer_id": 364770822,
        "avg_color": "#C9B8B0",
        "src": {
          "original":
              "https://images.pexels.com/photos/19733182/pexels-photo-19733182.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19733182/pexels-photo-19733182.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19733182/pexels-photo-19733182.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19733182/pexels-photo-19733182.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19733182/pexels-photo-19733182.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19733182/pexels-photo-19733182.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19733182/pexels-photo-19733182.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19733182/pexels-photo-19733182.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": "A large group of tall buildings in the distance"
      },
      {
        "type": "Photo",
        "id": 19734581,
        "width": 2900,
        "height": 4350,
        "url": "https://www.pexels.com/photo/sunset-in-paradise-19734581/",
        "photographer": "Naro K",
        "photographer_url": "https://www.pexels.com/@naro-k-670655635",
        "photographer_id": 670655635,
        "avg_color": "#BB836A",
        "src": {
          "original":
              "https://images.pexels.com/photos/19734581/pexels-photo-19734581.jpeg",
          "large2x":
              "https://images.pexels.com/photos/19734581/pexels-photo-19734581.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large":
              "https://images.pexels.com/photos/19734581/pexels-photo-19734581.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium":
              "https://images.pexels.com/photos/19734581/pexels-photo-19734581.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small":
              "https://images.pexels.com/photos/19734581/pexels-photo-19734581.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait":
              "https://images.pexels.com/photos/19734581/pexels-photo-19734581.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape":
              "https://images.pexels.com/photos/19734581/pexels-photo-19734581.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny":
              "https://images.pexels.com/photos/19734581/pexels-photo-19734581.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
        "liked": false,
        "alt": "Sunset in Paradise "
      }
    ],
    "total_results": 33,
    "next_page":
        "https://api.pexels.com/v1/collections/lg60fo7/?page=2&per_page=15",
    "id": "lg60fo7"
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          backgroundColor:
              CupertinoColors.extraLightBackgroundGray.withOpacity(0.5),
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
              )),
          middle: Text(colTitle,
              style: GoogleFonts.raleway(
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600)))),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.grey[50],
        height: 1000,
        child: Center(
          child: Padding(
              padding: const EdgeInsets.only(top: 18, left: 4, right: 4),
              child: AnimationLimiter(
                child: MasonryGridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: col["media"].length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (col['media'][index]['type'] == 'Photo') {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: ScaleAnimation(
                            scale: 0.8,
                            curve: Curves.easeOut,
                            child: FadeInAnimation(
                              delay: Duration(milliseconds: 100),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: ImgCard(info: col['media'][index]),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
              )),
        ),
      ),
    );
  }
}
