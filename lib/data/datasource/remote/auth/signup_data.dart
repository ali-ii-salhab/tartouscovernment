import 'package:tartouscovernment/Apiapplink.dart';

import '../../../../core/class/crud.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postdata(String username, String fullname, String phone, String email,
      String password, String repassword) async {
    var response = await crud.postdata(ApiApplinks.signup, {
      "fullname": fullname,
      "username": username,
      "phone": phone,
      "email": email,
      "password": password,
      "re_password": repassword
    });

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
