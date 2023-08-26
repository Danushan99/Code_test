// ignore_for_file: avoid_print

import 'package:prac_test/model/user_model.dart';
import 'package:prac_test/service/http_service.dart';

class UserService {
  Future<GetUsersModel?> loginUser(String username, String password) async {
    final apiUrl =
        'avLogin/Get?id=$username&password=$password&macaddress=123&versionnumber=123&deviceid=123';

    final response = await get(apiUrl);

    if (!response.isError) {
      print('Login error: ${response.status}, Error: ${response.body}');

      GetUsersModel userResponse = GetUsersModel.fromJson(response.body[0]);
      return userResponse;
    } else {
      return null;
    }
  }
}
