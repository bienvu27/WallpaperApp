import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperapp/data/data.dart';
import 'package:wallpaperapp/model/wallpaper_mode.dart';
import 'package:wallpaperapp/views/search.dart';
import 'package:wallpaperapp/widgets/categories_tile.dart';
import 'package:wallpaperapp/widgets/widget.dart';

import '../model/categories_model.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = [];
  List<WallpaperModel> wallpapers = [];
  TextEditingController searchController = new TextEditingController();

  getTrendingWallpapers() async {
    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=15&page=1"),
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
    getTrendingWallpapers();
    categories = getCategories()!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Color(0xfff5f8fd),
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: "Search wallpaper",
                            border: InputBorder.none),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Search(
                                    searchQuery: searchController.text,
                                  )));
                        },
                        child: Container(child: Icon(Icons.search)))
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 80,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoriesTile(
                      title: categories[index].categoriesName,
                      imgUrl: categories[index].imgUrl,
                    );
                  },
                ),
              ),
              wallpapersList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}
