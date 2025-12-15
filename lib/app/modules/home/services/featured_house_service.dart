import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_house_app/app/data/models/home_model.dart';
import 'package:my_house_app/app/data/services/api_endpoints.dart';

class HouseService {
Future<List<HomeModel>?> fetchFeaturedHouses() async {
  try {
    final response = await http.get(
      Uri.parse('${ApiEndpoints.baseUrl}${ApiEndpoints.featuredHouses}'),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final dataList = jsonResponse['data']['data'] as List;
      return dataList.map((item) => HomeModel.fromJson(item['house'])).toList();
    } else {
      print('Server error: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Network error: $e');
    return null;
  }
}

}
