import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:my_house_app/app/data/services/api_endpoints.dart';

class AddingEngineerService {
  final String token;

  AddingEngineerService({required this.token});

  /// Submit engineer profile with optional image file
  Future<http.Response?> submitProfile(Map<String, String> fields, File? imageFile) async {
    final url = Uri.parse('${ApiEndpoints.baseUrl}${ApiEndpoints.engineers}');
    final request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = 'Bearer $token'
      ..headers['Accept'] = 'application/json';

    request.fields.addAll(fields);

    if (imageFile != null) {
      final mimeType = lookupMimeType(imageFile.path) ?? 'image/jpeg';
      final mimeParts = mimeType.split('/');
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          imageFile.path,
          contentType: MediaType(mimeParts[0], mimeParts[1]),
        ),
      );
    }

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      // Handle HTTP status codes
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response;
      } else {
        print('Error: HTTP ${response.statusCode} - ${response.body}');
        return response;
      }
    } on SocketException {
      print('Network error: Please check your internet connection.');
      return null;
    } on HttpException {
      print('HTTP error: Failed to reach server.');
      return null;
    } on FormatException {
      print('Response format error: Unable to process server response.');
      return null;
    } catch (e) {
      print('Unexpected error submitting profile: $e');
      return null;
    }
  }
}

/// Detect MIME type
String? lookupMimeType(String path) {
  final extension = path.split('.').last.toLowerCase();
  switch (extension) {
    case 'jpg':
    case 'jpeg':
      return 'image/jpeg';
    case 'png':
      return 'image/png';
    case 'gif':
      return 'image/gif';
    default:
      return 'image/jpeg';
  }
}
