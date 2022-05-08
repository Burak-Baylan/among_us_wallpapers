import 'package:among_us_wallpapers/app/constants/app_constants.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  static AdManager get instance => AdManager._init();
  AdManager._init();

  static late BannerAd homeBannerAd;
  static late BannerAd inCategoryBannerAd;
  static late InterstitialAd? afterSetLockScreenInterstitialAd;
  static late InterstitialAd? afterSetHomeScreenInterstitialAd;
  static late InterstitialAd? categoryClickInterstitialAd;

  static Future<void> loadAllAds() async {
    await loadHomeScreenBanner();
    await loadInCategoryBanner();
    await loadAfterSetLockScreenInterstitial();
    await loadAfterSetHomeScreenInterstitial();
    await loadCategoryClickInterstitial();
  }

  static Future<void> showHomeScreenInterstitialAd() async {
    if (afterSetHomeScreenInterstitialAd != null) {
      await afterSetHomeScreenInterstitialAd!.show();
      await loadAfterSetHomeScreenInterstitial();
    } else {
      await loadAfterSetHomeScreenInterstitial();
    }
  }

  static Future<void> showLockScreenInterstitialAd() async {
    if (afterSetLockScreenInterstitialAd != null) {
      await afterSetLockScreenInterstitialAd!.show();
      await loadAfterSetLockScreenInterstitial();
    } else {
      await loadAfterSetLockScreenInterstitial();
    }
  }

  static Future<void> showCategoryClickInterstitialAd() async {
    if (categoryClickInterstitialAd != null) {
      await categoryClickInterstitialAd!.show();
      await loadCategoryClickInterstitial();
    } else {
      await loadCategoryClickInterstitial();
    }
  }

  static Future<void> loadHomeScreenBanner() async {
    homeBannerAd = AdManager.instance.getBannerAd(AppConstants.homeBannerId);
    await homeBannerAd.load();
  }

  static Future<void> loadInCategoryBanner() async {
    inCategoryBannerAd =
        AdManager.instance.getBannerAd(AppConstants.inCategoryBannerId);
    await inCategoryBannerAd.load();
  }

  static Future<void> loadAfterSetLockScreenInterstitial() async {
    await AdManager.instance.getInterstitialAd(
      (ad) => AdManager.instance.initSetLockScreenInterstitialAd(ad),
      AppConstants.afterSetLockScreenInterstitialId,
    );
  }

  static Future<void> loadAfterSetHomeScreenInterstitial() async {
    await AdManager.instance.getInterstitialAd(
      (ad) => AdManager.instance.initSetHomeScreenInterstitialAd(ad),
      AppConstants.afterSetHomeScreenInterstitialId,
    );
  }

  static Future<void> loadCategoryClickInterstitial() async {
    await AdManager.instance.getInterstitialAd(
      (ad) => AdManager.instance.initCategoryClickInterstitialAd(ad),
      AppConstants.categoryClickInterstitialId,
    );
  }

  BannerAd getBannerAd(String adUnitId) {
    return BannerAd(
      adUnitId: adUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    );
  }

  Future<void> getInterstitialAd(
    Function(InterstitialAd interstitialAd) onLoad,
    String adUnitId,
  ) async {
    await InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) => onLoad(ad),
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  void initSetLockScreenInterstitialAd(InterstitialAd interstitialAd) {
    AdManager.afterSetLockScreenInterstitialAd = interstitialAd;
  }

  void initSetHomeScreenInterstitialAd(InterstitialAd interstitialAd) {
    AdManager.afterSetHomeScreenInterstitialAd = interstitialAd;
  }

  void initCategoryClickInterstitialAd(InterstitialAd interstitialAd) {
    AdManager.categoryClickInterstitialAd = interstitialAd;
  }
}
