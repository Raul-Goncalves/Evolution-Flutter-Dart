//https://api.giphy.com/v1/gifs/trending?api_key=BjpcQBz7z1V1u6tQKs6wLI1WQm93dMKY&limit=25&offset=0&rating=g&bundle=messaging_non_clips

//https://api.giphy.com/v1/gifs/search?api_key=BjpcQBz7z1V1u6tQKs6wLI1WQm93dMKY&q=dogs&limit=25&offset=75&rating=g&lang=en&bundle=messaging_non_clips

import 'package:flutter/material.dart';
import 'package:search_gifs/Screens/Gif_Page.dart';

import 'Screens/ScreenHome.dart';

void main(){
  runApp(MaterialApp(
    home: ScreenHome(),
    theme: ThemeData(hintColor: Colors.white),
  ));
}