import '../../core/firebase/base/firebase_base.dart';
import '../../pages/detail/model/image_model.dart';

class ImagesGetter with FirebaseBase {
  late String collectionName;

  Future<List<ImageModel>?> getImages(String collectionName) async {
    this.collectionName = collectionName;
    var categories = await getImagesModel();
    if (categories == null) {
      return null;
    }
    return categories;
  }

  Future<List<ImageModel>?> getImagesModel() async {
    var ref = firestore.collection(collectionName);
    var rawData = await firebaseService.getCollection(ref);
    if (rawData.error != null) {
      return null;
    }
    var returningData = <ImageModel>[];
    for (var data in rawData.data!.docs) {
      var categoryModel = ImageModel.fromJson(data.data());
      returningData.add(categoryModel);
    }
    return returningData;
  }
}
