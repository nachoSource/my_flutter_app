import 'package:http/http.dart' as http;

class Api {
  final _encoding = "";

  //  TODO check if this could be wrapped and private
  Future<http.Response> get(String url) async {
    final response = http.get(Uri.parse(url));
print(response);
    return response;
  }

  // TODO review this type
  // Future<http.Response> post(String url, Object body) {
  //   // TODO check these types
  //   // TODO add headers
  //   return http.post(Uri.parse(url), body: body, encoding: _encoding);
  // }

  Future<http.Response> put(String url) {
    return http.put(Uri.parse(url));
  }

  Future<http.Response> delete(String url) {
    return http.get(Uri.parse(url));
  }

  get encoding => _encoding;
}
