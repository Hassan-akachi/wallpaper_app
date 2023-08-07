import 'package:flutter/material.dart';
import 'package:wallpaper_app/network/network_service.dart';
import 'package:wallpaper_app/screens/Image_viewer.dart';
import 'package:wallpaper_app/screens/search_screen.dart';
import 'package:wallpaper_app/widget/brand_name.dart';
import 'package:wallpaper_app/widget/search_bar.dart';

import '../Utils/data.dart';
import '../model/wallpaper_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List category = getcategories();

  final List wp = getWallpaper();
  List<WallpaperModel>? lastestwallpaper = [];

  Future<List<WallpaperModel>?> getLastestImage() async {
    lastestwallpaper = await NetworkService().getTrendingWallpaper();

    return lastestwallpaper;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const BrandName(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            const SearchBar(),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            RichText(
              text: const TextSpan(
                  text: "Powered by",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  children: [
                    TextSpan(
                        text: " Pexels",
                        style:
                            TextStyle(fontSize: 15, color: Colors.blueAccent))
                  ]),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
              height: screenHeight * 0.1,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              //I assumed you want to occupy the entire space of the card
                              image:
                                  AssetImage(category[index].categoryImageUrl)),
                        ),
                        child: ListTile(
                          title: Text(
                            category[index]
                                .categoryName
                                .toString()
                                .toLowerCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SearchScreen(
                                  searchQuery: category[index].categoryName);
                            }));
                          },
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            const Text(
              "Latest Images",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueAccent, fontSize: 15),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Expanded(
              child: FutureBuilder(
                  future: getLastestImage(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      final List<WallpaperModel> trendingWallpaper =
                          snapshot.data as List<WallpaperModel>;
                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: trendingWallpaper.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ImageViewer(
                                  imgUrl: trendingWallpaper[index].src.portrait,
                                  imgId: trendingWallpaper[index].id,
                                );
                              }));
                            },
                            child: Hero(
                              tag: trendingWallpaper[index].id,
                              child: Container(
                                width: 200,
                                height: 100,
                                //screenHeight*7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      //I assumed you want to occupy the entire space of the card
                                      image: NetworkImage(
                                          trendingWallpaper[index]
                                              .src
                                              .portrait)),
                                ),
                              ),
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 10),
                      );
                    }
                    if (snapshot.data == null) {
                      return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: const [CircularProgressIndicator(),
                          Text("Network problem !"),
                        ],
                      ));
                    } else if (snapshot.hasError) {
                      return Text("SomeThing went Wrong${snapshot.error}");
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
