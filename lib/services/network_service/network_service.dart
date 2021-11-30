import 'package:pixareo_test_task/services/network_service/network_service_interface.dart';
import 'package:http/http.dart' as http;

class NetworkService implements NetworkServiceInterface {
  @override
  Future<String> get(String url) async {
    http.Response? response;
    try {
      response = await http.get(Uri.parse(url));
    } catch (e) {
      throw Exception(e);
    }
    return response.body;
  }
}
