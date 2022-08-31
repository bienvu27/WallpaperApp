import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/data.dart';
import '../model/wallpaper_mode.dart';
import '../widgets/widget.dart';

class Categories extends StatefulWidget {
  final String? categoriesName;

  Categories({this.categoriesName});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<WallpaperModel> wallpapers = [];

  getSearchWallpapers(String? query) async {
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=15&page=1"),
        headers: {'Authorization': apiKey});
    // print(response.body.toString());
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      // print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpapers(widget.categoriesName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              wallpapersList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}
