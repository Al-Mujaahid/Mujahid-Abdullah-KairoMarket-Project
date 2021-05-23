import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:kairomarket/utils/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiHelper {
  static Future makeGetRequest({url}) async {
    print('Url: $url');
    var dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

    return dio
        .get(url,
            options: Options(headers: {'Authorization': await getToken()}))
        .then((value) => value.data);
  }

  static Future makePostRequest({url, data, bool useFormData}) async {
    print('Url: $url');
    var dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

    return dio
        .post(url,
            data: useFormData ? FormData.fromMap(data) : data,
            options: Options(headers: {'Authorization': await getToken()}))
        .then((value) => value.data);
  }
}

Future<String> getToken() async {
  var opening = await Hive.openBox(TOKEN_BOX);
  String token = opening.get(TOKEN_KEY) ?? 'token';
  print('Token: $token');
  return "Bearer $token";
}
