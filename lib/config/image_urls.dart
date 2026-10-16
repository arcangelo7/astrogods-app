import 'environment.dart';

class ImageUrls {
  static String image(String path, {bool hd = false}) {
    if (hd) {
      final lastDot = path.lastIndexOf('.');
      path = '${path.substring(0, lastDot)}_hd${path.substring(lastDot)}';
    }
    return '${Environment.staticBaseUrl}/static/images/$path';
  }

  static String cavernPdf(String filename) =>
      '${Environment.staticBaseUrl}/static/images/caverns_pdf/$filename';
}
