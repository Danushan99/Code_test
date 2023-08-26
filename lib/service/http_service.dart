// ignore_for_file: unnecessary_null_comparison
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prac_test/app/http_enum.dart';



//HTTP
const String baseURL = "http://www.axienta.lk/VantageCoreWebAPI/api/";

getHeader() {
  return {'Content-Type': 'application/json'};
}

Future<CommonResponseModel> post(String url, Map data) async {
  http.Response response = await http.post(Uri.parse(baseURL + url),
      body: json.encode(data), headers: getHeader());
  if (response.statusCode == HttpCodeEnum.Ok.status ||
      response.statusCode == HttpCodeEnum.Created.status ||
      response.statusCode == HttpCodeEnum.Accepted.status) {
    return CommonResponseModel(
        body: json.decode(response.body),
        isError: false,
        status: response.statusCode);
  } else {
    return CommonResponseModel(
        body: json.decode(response.body),
        isError: true,
        status: response.statusCode);
  }
}

Future<CommonResponseModel> get(String url) async {
  http.Response response =
      await http.get(Uri.parse(baseURL + url), headers: getHeader());
  if (response.statusCode == HttpCodeEnum.Ok.status ||
      response.statusCode == HttpCodeEnum.Created.status ||
      response.statusCode == HttpCodeEnum.Accepted.status) {
    return CommonResponseModel(
        body: json.decode(response.body),
        isError: false,
        status: response.statusCode);
  } else {
    return CommonResponseModel(
        body: json.decode(response.body),
        isError: true,
        status: response.statusCode);
  }
}

class CommonResponseModel {
  final dynamic body;
  final int status;
  final bool isError;

  CommonResponseModel({this.body, required this.status, required this.isError});
}
