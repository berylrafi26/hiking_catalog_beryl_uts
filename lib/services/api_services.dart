import 'dart:convert';
import 'dart:math';

class ApiService {
  Future<String> generateJwt() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final header = {"alg": "HS256", "typ": "JWT"};

    final payload = {
      "user": "hiking_user",
      "iat": DateTime.now().millisecondsSinceEpoch,
    };

    String encode(Map<String, dynamic> data) {
      return base64Url
          .encode(utf8.encode(jsonEncode(data)))
          .replaceAll('=', '');
    }

    final encodedHeader = encode(header);
    final encodedPayload = encode(payload);

    final random = Random().nextInt(999999);
    final signature = base64Url
        .encode(utf8.encode("secret_$random"))
        .replaceAll('=', '');

    final jwt = "$encodedHeader.$encodedPayload.$signature";

    return jwt;
  }
}
