import 'package:http/http.dart' as http;

class NetworkHelper {
  static NetworkHelper? _networkHelper;

  _NetworkHelper() {}

  static NetworkHelper getInstance() {
    if (_networkHelper == null) {
      _networkHelper = NetworkHelper();
    }
    return _networkHelper!;
  }

  Future<http.Response> get(String url) async {
    print("URL = "+url);
    http.Response response = await http.get(Uri.parse(url));
    print("Res Status  = ${response.statusCode}");
    print("Res = "+response.body);
    return response;
  }
}
