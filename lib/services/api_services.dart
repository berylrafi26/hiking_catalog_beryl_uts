import 'dart:convert';
import 'dart:math';

class ApiService {
  Future<String> generateJwt() async {
    await Future.delayed(const Duration(milliseconds: 500));

    String jwt = base64Encode(
      utf8.encode(
        "jwt_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(9999)}",
      ),
    );

    return jwt;
  }
}
