import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../app/helpers/category_getter.dart';
import '../../buy_pro_mode_view/view/buy_pro_mode_view.dart';
import '../model/category_model.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  List<CategoryModel>? categories = [];
  BuildContext? mContext;

  void setContext(BuildContext context) => mContext = context;

  CategoryGetter categoryGetter = CategoryGetter();

  Future<void> getCategories() async {
    categories = await categoryGetter.getCategories();
  }

  void navigateToBuyPremium() {
    Navigator.push(
      mContext!,
      MaterialPageRoute(builder: (context) => BuyProModeView()),
    );
  }
}
