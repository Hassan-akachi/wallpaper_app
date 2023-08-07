import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/screens/search_screen.dart';

import '../Utils/style.dart';

class SearchBar extends StatelessWidget {


  const SearchBar({super.key, });

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchcontroller =TextEditingController();

    return TextField(
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) {
          return  SearchScreen(searchQuery: searchcontroller.text);
        }));
      },
      controller: searchcontroller,
      decoration: kSearchEditTextDecoration.copyWith(
          suffixIcon: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                      return  SearchScreen(searchQuery: searchcontroller.text);
                }));

              },
              icon: const Icon(Icons.search))),
    );
  }
}
