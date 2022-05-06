import 'package:among_us_wallpapers/pages/home/model/category_model.dart';
import 'package:among_us_wallpapers/core/firebase/base/firebase_base.dart';

class CategoryGetter with FirebaseBase {
  Future<List<CategoryModel>?> getCategories() async {
    var categories = await getCategoryNames();
    if (categories == null) {
      return null;
    }
    return categories;
  }

  Future<List<CategoryModel>?> getCategoryNames() async {
    var ref = firestore.collection('Categories');
    var rawData = await firebaseService.getCollection(ref);
    if (rawData.error != null) {
      return null;
    }
    var returningData = <CategoryModel>[];
    for (var data in rawData.data!.docs) {
      var categoryModel = CategoryModel.fromJson(data.data());
      returningData.add(categoryModel);
    }
    return returningData;
  }
}
