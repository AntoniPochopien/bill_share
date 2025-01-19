import 'package:bill_share/constants/secrets.dart';

class ImageUrlGenerator {
  static String? generateGroupImageUrl(String? url) {
    if (url == null) {
      return url;
    }
    return '${Secrets.supabasePublicStorageUrl}/$url';
  }
}
