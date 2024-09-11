import 'package:employee_management/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>> fetchUserData() async {
    var response = await http.get(Uri.parse(
        'https://669b3f09276e45187d34eb4e.mockapi.io/api/v1/employee'));

    // Check status code
    if (response.statusCode == 200) {
      print(response.body);
      return userModelFromJson(response.body);
    } else {
      throw Exception('NetWork Error');
    }
  }
}
