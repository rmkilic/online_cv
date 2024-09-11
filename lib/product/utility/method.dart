import 'package:online_cv/core/constant/cons_application.dart';
import 'package:url_launcher/url_launcher.dart';

class Method {

  launchURL(String link) async {

  Uri uri = Uri.parse(link);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $uri';
  }
}



launchEmail() async {
  Uri uri = Uri.parse("mailto:${ConsApplication.EMAILADRESS}");
      if (await canLaunchUrl (uri)) {
        await launchUrl (uri);
      } else {
        throw 'Could not launch';
      }
    }

}