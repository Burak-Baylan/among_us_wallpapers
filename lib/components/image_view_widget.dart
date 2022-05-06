import 'package:flutter/material.dart';
import '../app/helpers/set_wallpaper_alert_dialog.dart';
import '../core/widgets/border_container.dart';
import 'category_view_widget.dart';

class ImageViewWidget extends StatelessWidget {
  ImageViewWidget({
    Key? key,
    required this.link,
    required this.onPressed,
  }) : super(key: key);

  String link;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Stack(
        children: [
          CategoryViewWiget(
            link: link,
            onPressed: () => onPressed(),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: buildSetWallpaperButton(context),
          ),
        ],
      ),
    );
  }

  Widget buildSetWallpaperButton(BuildContext context) {
    return BorderContainer.all(
      radius: 15,
      margin: EdgeInsets.only(top: 25, right: 25),
      color: Colors.black.withOpacity(.3),
      padding: const EdgeInsets.all(3),
      child: IconButton(
        icon: const Icon(
          Icons.wallpaper_rounded,
          color: Colors.white,
        ),
        onPressed: () => SetWallpaperAlertDialog.show(context, link),
      ),
    );
  }
}
