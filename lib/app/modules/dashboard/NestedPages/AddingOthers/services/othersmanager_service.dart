import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:my_house_app/app/data/services/api_endpoints.dart';

class OthersmanagerService {
  final String token;

  OthersmanagerService({required this.token});

  Future<http.Response?> sendToFeaturedApi(int houseId) async {
    final url = Uri.parse('${ApiEndpoints.baseUrl}${ApiEndpoints.featuredHouses}');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({'house_id': houseId}),
      );
      return response;
    } catch (e) {
      print('Error sending to featured API: $e');
      return null;
    }
  }

  Future<http.Response?> finalsubmitOthers({
    required Map<String, String> fields,
    required List<File> images,
    File? video,
  }) async {
    final url = Uri.parse('${ApiEndpoints.baseUrl}${ApiEndpoints.others}');
    final request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = 'Bearer $token'
      ..headers['Accept'] = 'application/json';

    request.fields.addAll(fields);

    for (var image in images) {
      request.files.add(await http.MultipartFile.fromPath(
        'images[]',
        image.path,
        contentType: MediaType('image', 'jpeg'),
      ));
    }

    if (video != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'video',
        video.path,
        contentType: MediaType('video', 'mp4'),
      ));
    }

    try {
      final streamedResponse = await request.send();
      return await http.Response.fromStream(streamedResponse);
    } catch (e) {
      print('Exception submitting property: $e');
      return null;
    }
  }
}
