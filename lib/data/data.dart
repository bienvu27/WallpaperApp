import 'package:wallpaperapp/model/categories_model.dart';

String apiKey = '563492ad6f91700001000001a90a4e84f4b14b7d8e8c6a297054f7b4';

List<CategoriesModel>? getCategories() {
  List<CategoriesModel> categories = [];
  CategoriesModel categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      'https://images.pexels.com/photos/162379/lost-places-pforphoto-leave-factory-162379.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  categoriesModel.categoriesName = 'Street Art';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      'https://images.pexels.com/photos/46519/leopard-cat-big-cat-wildcat-46519.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  categoriesModel.categoriesName = 'Wild Life';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      'https://images.pexels.com/photos/2662116/pexels-photo-2662116.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  categoriesModel.categoriesName = 'Nature';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      'https://images.pexels.com/photos/378570/pexels-photo-378570.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  categoriesModel.categoriesName = 'City';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      'https://images.pexels.com/photos/760721/pexels-photo-760721.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  categoriesModel.categoriesName = 'Motivation';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      'https://images.pexels.com/photos/819805/pexels-photo-819805.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  categoriesModel.categoriesName = 'Bike';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      'https://images.pexels.com/photos/164654/pexels-photo-164654.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  categoriesModel.categoriesName = 'Cars';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  return categories;
}
