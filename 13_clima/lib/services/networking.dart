import 'package:http/http.dart' as http;
import 'dart:convert';

// The API needs a VPN to work!
class NetworkHelper {
  final String url;

  NetworkHelper({required this.url});

  Future getDate() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
