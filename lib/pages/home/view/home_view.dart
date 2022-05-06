import 'package:among_us_wallpapers/pages/detail/view/details_view.dart';
import 'package:among_us_wallpapers/pages/home/model/category_model.dart';
import 'package:among_us_wallpapers/components/category_view_widget.dart';
import 'package:among_us_wallpapers/pages/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';

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
    future = homeVm.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError || homeVm.categories == null) {
          return const Center(child: Text('Error'));
        }
        if (snapshot.connectionState == ConnectionState.done &&
            homeVm.categories != null &&
            homeVm.categories!.isEmpty) {
          return const Center(child: Text('Categories not found'));
        }
        if (snapshot.connectionState == ConnectionState.done &&
            homeVm.categories != null &&
            homeVm.categories!.isNotEmpty) {
          return listViewBuilder();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget listViewBuilder() {
    return ListView.builder(
      itemCount: homeVm.categories!.length,
      itemBuilder: (context, index) {
        return CategoryViewWiget(
          title: homeVm.categories![index].title,
          link: homeVm.categories![index].link,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailsView(title: homeVm.categories![index].title),
              ),
            );
          },
        );
      },
    );
  }
}
