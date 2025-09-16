import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_house_app/app/data/models/home_model.dart';
import 'package:my_house_app/app/data/services/api_endpoints.dart';

class HouseService {
  Future<HomeModel?> fetchFeaturedHouse() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.baseUrl}${ApiEndpoints.featuredHouses}'),
      );

      if (response.statusCode == 200) {
        print(response);
        final jsonResponse = json.decode(response.body);
        final houseData = jsonResponse['data']['data'][0]['house'];
        return HomeModel.fromJson(houseData);
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
