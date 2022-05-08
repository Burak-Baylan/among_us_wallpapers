import 'package:among_us_wallpapers/pages/buy_pro_mode_view/view/buy_pro_mode_view.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../app/ad_manager/ad_manager.dart';
import '../../../components/category_view_widget.dart';
import '../../../components/error_text.dart';
import '../../detail/view/details_view.dart';
import '../view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future future;

  HomeViewModel homeVm = HomeViewModel();

  @override
  void initState() {
    super.initState();
    homeVm.setContext(context);
    future = homeVm.getCategories();
    WidgetsBinding.instance!.addPostFrameCallback(
      (d) => homeVm.navigateToBuyPremium(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasError || homeVm.categories == null) {
            return const ErrorText();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              homeVm.categories != null &&
              homeVm.categories!.isNotEmpty) {
            return Column(
              children: [
                Flexible(flex: 9, child: listViewBuilder()),
                Flexible(flex: 1, child: AdWidget(ad: AdManager.homeBannerAd)),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Among Us Wallpaper'),
      actions: [
        IconButton(
          onPressed: () => homeVm.navigateToBuyPremium(),
          icon: const Icon(Icons.workspace_premium_outlined),
        ),
      ],
    );
  }

  Widget listViewBuilder() {
    return ListView.builder(
      itemCount: homeVm.categories!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CategoryViewWiget(
          title: homeVm.categories![index].title,
          link: homeVm.categories![index].link,
          onPressed: () {
            pushToDetailsView(index);
            AdManager.showHomeScreenInterstitialAd();
          },
        );
      },
    );
  }

  void pushToDetailsView(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            DetailsView(title: homeVm.categories![index].title),
      ),
    );
  }
}
