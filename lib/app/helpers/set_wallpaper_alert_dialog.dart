import 'package:among_us_wallpapers/app/helpers/wallpaper_helper.dart';
import 'package:among_us_wallpapers/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class SetWallpaperAlertDialog {
  static Future<void> show(BuildContext context, String imageUrl) async {
    WallpaperHelper wallpaperHelper = WallpaperHelper();
    Widget setAsLockButton = TextButton(
      child: Text("Set as Lock Screen"),
      onPressed: () async {
        await WallpaperHelper.setLockScreen(imageUrl);
        context.pop;
      },
    );
    Widget setAsHomeButton = TextButton(
      child: Text("Set as Home Screen"),
      onPressed: () async {
        await WallpaperHelper.setHomeScreen(imageUrl);
        context.pop;
      },
    );
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () => context.pop,
    );

    AlertDialog alert = AlertDialog(
      title: Text("Set Wallpaper"),
      actions: [
        setAsHomeButton,
        setAsLockButton,
        cancelButton,
      ],
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
