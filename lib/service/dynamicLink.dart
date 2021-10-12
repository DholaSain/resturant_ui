
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/tempview.dart';

class DynamicLinkService {
  void handleDynamicLinks() async {
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null && deepLink.queryParameters != null) {
      var isProfile = deepLink.pathSegments.contains('post');
      if (isProfile) {
        var title = deepLink.queryParameters['title'];
        print("init $title");

        if (title != null) {
          Get.to(()=> TempView(title: title));
          // _navigationService.navigateTo(ProfileRoute, arguments: userName);
        }
      }
    }

    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      final Uri? deepLink = dynamicLink?.link;

      if (deepLink != null && deepLink.queryParameters != null) {
        var isProfile = deepLink.pathSegments.contains('post');
        if (isProfile) {
          var userName = deepLink.queryParameters['title'];
          print("onlink $userName");

          if (userName != null) {
            Get.to(()=> TempView(title: userName,));
          }
        }
      }
    }, onError: (OnLinkErrorException e) async {
      print(e.message);
    });
  }
}