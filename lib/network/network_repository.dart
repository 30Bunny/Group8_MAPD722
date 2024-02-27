import 'package:group8_mapd722/network/network_response.dart';
import 'package:http/http.dart' as http;

class NetworkRepository {

  static Future<NetworkResponse> get(String url,
      {Map<String, String>? headers}) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      headers ??= _defaultHeaders;
      Uri uri = Uri.parse(url);
      var result = await http.get(uri, headers: headers);
      if (result.statusCode == 200 || result.statusCode == 201) {
        networkResponse.success = true;
      } else {
        networkResponse.success = false;
        networkResponse.errorMsg = result.reasonPhrase;
      }
      networkResponse.statusCode = result.statusCode;
      networkResponse.response = result.body;
    } catch (e) {
      networkResponse.statusCode = 500;
      networkResponse.success = false;
      networkResponse.response = e.toString();
    }
    return networkResponse;
  }

  static Future<NetworkResponse> post(String url,
      {Map<String, String>? headers, dynamic body}) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      headers ??= _defaultHeaders;
      Uri uri = Uri.parse(url);
      var result = await http.post(uri, headers: headers, body: body);
      if (result.statusCode == 200 || result.statusCode == 201) {
        networkResponse.success = true;
      } else {
        networkResponse.success = false;
        networkResponse.errorMsg = result.reasonPhrase;
      }
      networkResponse.statusCode = result.statusCode;
      networkResponse.response = result.body;
    } catch (e) {
      networkResponse.statusCode = 500;
      networkResponse.success = false;
      networkResponse.response = e.toString();
    }
    return networkResponse;
  }

  static Future<NetworkResponse> delete(String url, {dynamic body}) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      Uri uri = Uri.parse(url);
      var result =
      await http.delete(uri, headers: _defaultHeaders, body: body);
      if (result.statusCode == 200 || result.statusCode == 204) {
        networkResponse.success = true;
      } else {
        networkResponse.success = false;
        networkResponse.errorMsg = result.reasonPhrase;
      }
      networkResponse.statusCode = result.statusCode;
      networkResponse.response = result.body;
    } catch (e) {
      networkResponse.statusCode = 500;
      networkResponse.success = false;
      networkResponse.response = e.toString();
    }
    return networkResponse;
  }

  static Future<NetworkResponse> put(String url,
      {Map<String, String>? headers, body}) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      headers ??= _defaultHeaders;

      Uri uri = Uri.parse(url);
      var result = await http.put(uri, headers: headers, body: body);
      if (result.statusCode == 200 || result.statusCode == 204) {
        networkResponse.success = true;
      } else {
        networkResponse.success = false;
        networkResponse.errorMsg = result.reasonPhrase;
      }
      networkResponse.statusCode = result.statusCode;
      networkResponse.response = result.body;
    } catch (e) {
      networkResponse.statusCode = 500;
      networkResponse.success = false;
      networkResponse.response = e.toString();
    }
    return networkResponse;
  }

  static Map<String, String> get _defaultHeaders => {
    'Content-Type': 'application/json',
    'Accept': 'application/json; charset=UTF-8',
  };
}