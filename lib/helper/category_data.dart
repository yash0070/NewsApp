import '../models/category_models.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = CategoryModel();

//1
  categoryModel.categorieName = "Business";
  categoryModel.imageAssetUrl =
      "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2071&q=80";

  category.add(categoryModel);

  categoryModel = CategoryModel();

//2

  categoryModel.categorieName = "Entertainment";
  categoryModel.imageAssetUrl =
      "https://images.unsplash.com/photo-1481328101413-1eef25cc76c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80";
  category.add(categoryModel);

  categoryModel = CategoryModel();

//3
  categoryModel.categorieName = "General";
  categoryModel.imageAssetUrl =
      "https://images.unsplash.com/photo-1434030216411-0b793f4b4173?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  category.add(categoryModel);

  categoryModel = CategoryModel();

//4
  categoryModel.categorieName = "Health";
  categoryModel.imageAssetUrl =
      "https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80";
  category.add(categoryModel);

  categoryModel = CategoryModel();

//5
  categoryModel.categorieName = "Science";
  categoryModel.imageAssetUrl =
      "https://images.unsplash.com/photo-1614935151651-0bea6508db6b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1225&q=80";
  category.add(categoryModel);

  categoryModel = CategoryModel();

//6
  categoryModel.categorieName = "Sports";
  categoryModel.imageAssetUrl =
      "https://images.unsplash.com/photo-1530549387789-4c1017266635?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  category.add(categoryModel);

  return category;
}
