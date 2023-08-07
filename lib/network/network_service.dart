import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/Utils/contants.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';

class NetworkService {

  var client = http.Client();

  final StringBuffer stringBuffer = StringBuffer(Constant.kBaseUrl);
  // NetworkService({Key key});
  static Map<String, String> _getHeaders() =>
      {"Authorization": Constant.kapikey};

  Future<List<WallpaperModel>> getTrendingWallpaper() async {

    stringBuffer.write(Constant.kCuratedQueryUrl);
    var url = Uri.parse(stringBuffer.toString());//"${Constant.kBaseUrl}curated?per_page=15&page=1"
    var response = await client.get(url, headers: _getHeaders());

    if (response.statusCode == 200) {
          Map<String,dynamic> jsonData=jsonDecode(response.body);

      return ( jsonData["photos"]as List).map((e) =>   WallpaperModel.fromJson(e)).toList();

    }else{
      throw(e){debugPrint("${e}");};
    }
  }



  Future<List<WallpaperModel>> getSearchWallpaper(String str) async {

    stringBuffer.write("search?query=${str.toLowerCase().trim()}&per_page=100");
    var url = Uri.parse(stringBuffer.toString());//"${Constant.kBaseUrl}curated?per_page=15&page=1"
    var response = await client.get(url, headers: _getHeaders());

    if (response.statusCode == 200) {
      Map<String,dynamic> jsonData=jsonDecode(response.body);

      return ( jsonData["photos"]as List).map((e) =>   WallpaperModel.fromJson(e)).toList();

    }else{
      throw(e){debugPrint("${e}");};
    }
  }
}