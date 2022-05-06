import 'package:among_us_wallpapers/app/helpers/category_getter.dart';
import 'package:among_us_wallpapers/pages/home/model/category_model.dart';
import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  List<CategoryModel>? categories = [];

  CategoryGetter categoryGetter = CategoryGetter();

  Future<void> getCategories() async {
    categories = await categoryGetter.getCategories();
  }
}
