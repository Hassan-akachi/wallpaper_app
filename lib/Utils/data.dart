import 'package:wallpaper_app/model/wallpaper.dart';

import '../model/category_model.dart';



List<CategoriesModel> getcategories() {
  List<CategoriesModel> cate = [];

  cate.add(CategoriesModel(categoryName: "Street Art",
      categoryImageUrl: "assets/wallpaperTags/streetart.jpg"));
  cate.add(CategoriesModel(categoryName: "code",
      categoryImageUrl: "assets/wallpaperTags/code.jpg"));
  cate.add(CategoriesModel(categoryName: "Cars",
      categoryImageUrl: "assets/wallpaperTags/cars.jpg"));
  cate.add(CategoriesModel(categoryName: "Wild Life",
      categoryImageUrl: "assets/wallpaperTags/wildlife.jpg"));
  cate.add(CategoriesModel(categoryName: "Nature",
      categoryImageUrl: "assets/wallpaperTags/nature.jpg"));
  cate.add(CategoriesModel(categoryName: "Design",
      categoryImageUrl: "assets/wallpaperTags/design.jpg"));
  cate.add(CategoriesModel(categoryName: "animals",
      categoryImageUrl: "assets/wallpaperTags/animals.jpg"));

  cate.add(CategoriesModel(categoryName: "creative",
      categoryImageUrl: "assets/wallpaperTags/creative.jpg"));
  cate.add(CategoriesModel(categoryName: "flowers",
      categoryImageUrl: "assets/wallpaperTags/flowers.jpg"));
  cate.add(CategoriesModel(categoryName: "guns",
      categoryImageUrl: "assets/wallpaperTags/guns.jpg"));

  cate.add(CategoriesModel(categoryName: "space",
      categoryImageUrl: "assets/wallpaperTags/space.jpg"));

  cate.add(CategoriesModel(categoryName: "mountains",
      categoryImageUrl: "assets/wallpaperTags/mountains.jpg"));


  return cate;
}



List<Wallpaper> getWallpaper() {
  List<Wallpaper> wp = [];
    wp.add(Wallpaper(wallpaperImageUrl: "https://images.pexels.com/photos/1274260/pexels-photo-1274260.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"));
  wp.add(Wallpaper(wallpaperImageUrl: "https://images.pexels.com/photos/1274260/pexels-photo-1274260.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"));
  wp.add(Wallpaper(wallpaperImageUrl: "https://images.pexels.com/photos/1274260/pexels-photo-1274260.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"));
  wp.add(Wallpaper(wallpaperImageUrl: "https://images.pexels.com/photos/1274260/pexels-photo-1274260.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"));
  wp.add(Wallpaper(wallpaperImageUrl: "https://images.pexels.com/photos/1274260/pexels-photo-1274260.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"));
  return wp;
}




