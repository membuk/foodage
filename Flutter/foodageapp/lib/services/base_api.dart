import 'dart:io';

import 'package:foodageapp/widgets/snackbar.dart';
import 'package:http/http.dart';

enum RequestType { get, post }

extension IsResponseOk on Response {
  bool get ok {
    return (statusCode ~/ 100) == 2;
  }
}

extension IsStreamedResponseOk on StreamedResponse {
  bool get ok {
    return (statusCode ~/ 100) == 2;
  }
}

class BaseAPI {
  static const String server = "http://127.0.0.1:8000";
  static const Duration _durationTime = Duration(seconds: 4);

  static Future<Response?> fetch(
    String url, {
    Map<String, String> headers = const {},
    Map<String, String> params = const {},
    Map<String, String> body = const {},
    RequestType requestType = RequestType.get,
  }) async {
    Response response = await _baseFetch(url,
        headers: headers, params: params, body: body, requestType: requestType);

    if (response.ok) {
      return response;
    }

    AlertWidgets.showError(error: response.body);
    return null;
  }

  static Future<StreamedResponse?> fetchWithFiles(
    String url, {
    Map<String, File> files = const {},
    Map<String, String> params = const {},
    Map<String, String> body = const {},
  }) async {
    MultipartRequest request = MultipartRequest(
        "POST", Uri.parse(server + url + paramsToString(params)));

    for (MapEntry entry in files.entries) {
      var stream = ByteStream(entry.value.openRead());
      stream.cast();

      final String filename =
          entry.value.path.split(Platform.pathSeparator).last;
      request.files.add(MultipartFile(
          entry.key, stream, await entry.value.length(),
          filename: filename));
    }

    request.fields.addEntries(body.entries);

    StreamedResponse response = await request.send();

    if (response.ok) {
      return response;
    }

    AlertWidgets.showError(
        error: String.fromCharCodes(await response.stream.toBytes()));
    return null;
  }

  static Future<Response> _baseFetch(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? params,
    Map<String, String>? body,
    RequestType requestType = RequestType.get,
  }) async {
    headers ??= {};
    params ??= {};
    body ??= {};

    final Client client = Client();
    final Uri parsedUrl = Uri.parse(server + url + paramsToString(params));

    Response response;
    if (requestType == RequestType.get) {
      response =
          await client.get(parsedUrl, headers: headers).timeout(_durationTime);
    } else {
      response = await client
          .post(parsedUrl, headers: headers, body: body)
          .timeout(_durationTime);
    }

    return response;
  }

  static String paramsToString(Map<String, String> params) {
    if (params.isEmpty) return "";

    String paramString = "";
    for (var param in params.entries) {
      paramString += "&${param.key}=${param.value}";
    }
    paramString = "?${paramString.substring(1)}";
    return paramString;
  }
}
