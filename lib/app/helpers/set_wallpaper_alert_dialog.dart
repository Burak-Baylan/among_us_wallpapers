import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';
import '../ad_manager/ad_manager.dart';
import 'wallpaper_helper.dart';

class SetWallpaperAlertDialog {
  static Future<void> show(BuildContext context, String imageUrl) async {
    WallpaperHelper wallpaperHelper = WallpaperHelper();
    Widget setAsLockButton = TextButton(
      child: const Text("Set as Lock Screen"),
      onPressed: () async {
        await WallpaperHelper.setLockScreen(imageUrl);
        await AdManager.showLockScreenInterstitialAd();
        context.pop;
      },
    );
    Widget setAsHomeButton = TextButton(
      child: const Text("Set as Home Screen"),
      onPressed: () async {
        await WallpaperHelper.setHomeScreen(imageUrl);
        await AdManager.showHomeScreenInterstitialAd();
        context.pop;
      },
    );
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () => context.pop,
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Set Wallpaper"),
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
