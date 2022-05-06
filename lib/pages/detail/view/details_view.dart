import 'package:flutter/material.dart';
import '../../../components/image_view_widget.dart';
import '../../full_screen_image/view/full_screen_image_view.dart';
import '../view_model/details_view_model.dart';

class DetailsView extends StatefulWidget {
  DetailsView({
    Key? key,
    required this.title,
  }) : super(key: key);

  String title;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  DetailsViewModel detailsVm = DetailsViewModel();

  @override
  void initState() {
    super.initState();
    future = detailsVm.getImages(widget.title);
  }

  late Future future;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title + ' Wallpapers'),
      ),
      body: buildPageSkeleton(),
    );
  }

  Widget buildPageSkeleton() {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        }
        /* if (snapshot.connectionState == ConnectionState.done) {
          return const Center(child: Text('Categories not found'));
        } */
        if (snapshot.connectionState == ConnectionState.done) {
          return listViewBuilder();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget listViewBuilder() {
    return ListView.builder(
      itemCount: detailsVm.images!.length,
      itemBuilder: (context, index) {
        String imageLink = detailsVm.images![index].link!;
        return ImageViewWidget(
          link: imageLink,
          onPressed: () => pushToFullScreenImageView(imageLink),
        );
      },
    );
  }

  void pushToFullScreenImageView(String imageLink) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImageView(imageUrl: imageLink),
      ),
    );
  }
}
