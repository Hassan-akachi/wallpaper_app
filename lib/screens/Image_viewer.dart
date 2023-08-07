import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wallpaper_app/Utils/contants.dart';
import 'package:wallpaper_app/Utils/style.dart';

class ImageViewer extends StatelessWidget {
  final String imgUrl;
  final int imgId;

  const ImageViewer({super.key, required this.imgUrl, required this.imgId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: imgId,
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
            constraints: const BoxConstraints.expand(),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                    style: TextButton.styleFrom(
                        fixedSize: const Size(200, 70),
                        //side: BorderSide(width:10,color: Colors.transparent),
                        backgroundColor: Colors.white12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onPressed: ()async {
                     // if (!context.mounted) return;
                      final tempDir =await getTemporaryDirectory();
                      final path ="${tempDir.path}/myfile.jpg";
                      await Dio().download(imgUrl,path);
                      await GallerySaver.saveImage(path,albumName: Constant.kFileName);

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Downloaded to Gallery")));
                    },
                    child: const Text(
                      "Download",
                      style: kTextstyle,
                    )),
              ),
            )),
      ),
    );
  }
}
