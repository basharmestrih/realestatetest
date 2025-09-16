import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_house_app/app/data/models/home_model.dart';
import 'package:my_house_app/app/data/models/others_model.dart';
import 'package:my_house_app/app/data/services/api_endpoints.dart';
import 'package:my_house_app/app/data/services/token_service.dart';

class OthersService {
  static const String baseUrl = '${ApiEndpoints.baseUrl}';

static Future<List<OthersModels>> fetchOthers({String? location, String? query}) async {
  //final tokenService = TokenService();
  //final token = await tokenService.token;
  final token = '1|Nv8B2uXnMgi37cHbvvh1P1bi7V0JlV7Ilx4aH1Hj5c5c2d8c';

  if (token == null) {
    throw Exception('Token not found. User may not be logged in.');
  }

  // Decide endpoint based on whether search query is provided
  final uri = Uri.parse(query != null && query.isNotEmpty
      ? '$baseUrl/api/others/search'
      : '$baseUrl/api/others');

  // Build query parameters
  final queryParameters = <String, String>{
    'per_page': '10',
    if (query != null && query.isNotEmpty) 'q': query,
    if (location != null && location.toLowerCase() != 'all' && location.toLowerCase() != 'الكل' ) 'location': location,
  };

  final finalUri = uri.replace(queryParameters: queryParameters);

  final response = await http.get(
    finalUri,
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  print('FetchHouses Response: ${response.body}');

  if (response.statusCode == 200) {
    final decoded = json.decode(response.body);
    final List<dynamic> others = decoded['data']['data'];
    return others.map((json) => OthersModels.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load others: ${response.statusCode}');
  }
}


}
