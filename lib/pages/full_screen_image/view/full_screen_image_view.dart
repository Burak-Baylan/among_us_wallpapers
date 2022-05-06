import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import '../../../app/helpers/set_wallpaper_alert_dialog.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/widgets/border_container.dart';

class FullScreenImageView extends StatelessWidget {
  FullScreenImageView({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, provider) => PhotoView(
                imageProvider: provider,
                maxScale: 5.0,
                minScale: PhotoViewComputedScale.contained,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: buildBackButton(context),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: setWallpaperButton(context),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBackButton(BuildContext context) {
    return BorderContainer.all(
      radius: 15,
      margin: const EdgeInsets.only(top: 25, left: 10),
      color: Colors.black.withOpacity(.3),
      child: IconButton(
        icon: const Icon(
          Icons.keyboard_arrow_left,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () => context.pop,
      ),
    );
  }

  Widget setWallpaperButton(BuildContext context) {
    return BorderContainer.all(
      radius: 15,
      margin: EdgeInsets.only(top: 25, right: 25, bottom: 25),
      color: Colors.redAccent.withOpacity(.3),
      padding: const EdgeInsets.all(3),
      child: IconButton(
        icon: const Icon(
          Icons.wallpaper_rounded,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () => SetWallpaperAlertDialog.show(context, imageUrl),
      ),
    );
  }
}
