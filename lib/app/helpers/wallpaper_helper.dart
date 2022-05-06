import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class WallpaperHelper {
  static Future<bool> setHomeScreen(String imageUrl) async {
    var result = await _set(WallpaperManager.HOME_SCREEN, imageUrl);
    return result;
  }

  static Future<bool> setLockScreen(String imageUrl) async {
    var result = await _set(WallpaperManager.LOCK_SCREEN, imageUrl);
    return result;
  }

  static Future<bool> setBothScreen(String imageUrl) async {
    var result = await _set(WallpaperManager.BOTH_SCREEN, imageUrl);
    return result;
  }

  static Future<bool> _set(int locationType, String imageUrl) async {
    var file = await DefaultCacheManager().getSingleFile(imageUrl);
    bool result =
        await WallpaperManager.setWallpaperFromFile(file.path, locationType);
    return result;
  }
}
