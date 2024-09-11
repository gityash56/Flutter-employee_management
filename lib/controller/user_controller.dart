import 'package:employee_management/services/api_service.dart';
import 'package:employee_management/model/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  RxBool isLoading = true.obs;
  var userList = <UserModel>[].obs;
  var filteredUserList = <UserModel>[].obs;

  @override
  void onInit() {
    fetchUsers();
    filteredUserList.value = userList;
    super.onInit();
  }

  // Fetch User Data
  fetchUsers() async {
    try {
      isLoading(true);

      var userData = await ApiService().fetchUserData();

      userList.addAll(userData);
    } catch (e) {
      print('Error Fetching User Data $e');
    } finally {
      isLoading(false);
    }
  }

  // Function to filter users by ID

  void filterUserById(String id) {
    if (id.isEmpty) {
      filteredUserList.value = userList;
      print('fail');
    } else {
      filteredUserList.value = userList
          .where((user) => user.id.toLowerCase().contains(id.toLowerCase()))
          .toList();
      print('success');
    }
  }
}
