import 'package:flutter/material.dart';
import 'package:wallpaper_app/widget/brand_name.dart';

import '../model/wallpaper_model.dart';
import '../network/network_service.dart';
import 'Image_viewer.dart';

class SearchScreen extends StatelessWidget {
  final String? searchQuery;

   SearchScreen({super.key, this.searchQuery = ""});

  List<WallpaperModel> searchWallpaper = [];

  Future<List<WallpaperModel>?> getSearchImage() async {
    searchWallpaper = await NetworkService().getSearchWallpaper(searchQuery!);

    return searchWallpaper;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const BrandName(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              searchQuery!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.blueAccent, fontSize: 30),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Expanded(
              child: FutureBuilder(
                  future: getSearchImage(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      final List<WallpaperModel> searchWp =
                          snapshot.data as List<WallpaperModel>;
                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: searchWp.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return ImageViewer(
                                      imgUrl: searchWp[index].src.portrait,
                                      imgId: searchWp[index].id,
                                    );
                                  }));
                            },
                            child: Hero(
                              tag: searchWp[index].id ,
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
                                          searchWp[index].src.portrait)),
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
                      return  const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [CircularProgressIndicator(),
                          // Text("Network problem !"),
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
