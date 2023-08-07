import 'package:flutter/material.dart';

class BrandName extends StatelessWidget with PreferredSizeWidget {
  const BrandName({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: RichText(
        text: const TextSpan(
            text: "WallPaper",
            style: TextStyle(fontSize: 20, color: Colors.black),
            children: [TextSpan(
                text: " Hub",
                style: TextStyle(fontSize: 20, color: Colors.blueAccent))]),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>const Size.fromHeight(50); //throw UnimplementedError();
}
