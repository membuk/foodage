import 'dart:convert';
import 'dart:io';

import 'package:foodageapp/services/base_api.dart';
import 'package:http/http.dart';

class AiAPI {
  static const String baseUrl = "/ai";

  static const String testUrl = "$baseUrl/test";
  static const String trainUrl = "$baseUrl/train";
  static const String foodNameUrl = "$baseUrl/food_names";
  static const String isTrainedUrl = "$baseUrl/is_trained";

  static Future<Map<String, dynamic>?> getFoodNames() async {
    final Response? response = await BaseAPI.fetch(foodNameUrl);
    if (response == null) return null;

    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  static Future<Map<String, dynamic>?> trainAI(
      File file, Map<String, List<String>> foodNameMap) async {
    final Map<String, String> body = {'food_names': jsonEncode(foodNameMap)};
    final Map<String, File> files = {'csv_file': file};

    final StreamedResponse? response =
        await BaseAPI.fetchWithFiles(trainUrl, files: files, body: body);
    if (response == null) return null;

    return jsonDecode(String.fromCharCodes(await response.stream.toBytes()));
  }

  static Future<int?> calculateExpectedNumber(List<String> foodNames) async {
    Map<String, String> body = {"food_names": jsonEncode(foodNames)};

    final Response? response =
        await BaseAPI.fetch(testUrl, body: body, requestType: RequestType.post);
    if (response == null) return null;

    return jsonDecode(response.body)['pred'];
  }

  static Future<bool?> isTrained() async {
    final Response? response = await BaseAPI.fetch(isTrainedUrl);
    if (response == null) return null;

    return jsonDecode(response.body);
  }
}
