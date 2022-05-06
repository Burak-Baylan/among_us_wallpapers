import 'package:among_us_wallpapers/app/helpers/images_getter.dart';
import 'package:among_us_wallpapers/pages/detail/model/image_model.dart';
import 'package:mobx/mobx.dart';
part 'details_view_model.g.dart';

class DetailsViewModel = _DetailsViewModelBase with _$DetailsViewModel;

abstract class _DetailsViewModelBase with Store {
  List<ImageModel>? images = [];
  ImagesGetter imagesGetter = ImagesGetter();

  Future<void> getImages(String collectionName) async {
    var images = await imagesGetter.getImages(collectionName);
    this.images = images;
  }
}
