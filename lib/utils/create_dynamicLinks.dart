import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class AppUtils {
  ///Build a dynamic link firebase
  static Future<String> buildDynamicLink(String uid) async {
    String url = "https://resturent.page.link";
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: url,
      link: Uri.parse('$url/post?title=$uid'),
      androidParameters: AndroidParameters(
        packageName: "com.example.resturant_ui",
        minimumVersion: 0,
      ),
      iosParameters: IosParameters(
        bundleId: "com.example.resturantui",
        minimumVersion: '0',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
          description: "Once upon a time in the town",
          imageUrl:
              Uri.parse("https://flutter.dev/images/flutter-logo-sharing.png"),
          title: "Breaking Code's Post"),
    );
    final ShortDynamicLink dynamicUrl = await parameters.buildShortLink();
    return dynamicUrl.shortUrl.toString();
  }
}