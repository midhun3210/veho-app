import 'package:veho_app/utils/core_service/serviced.dart';

class LoginService {
  login(String email, String password) async {
    var data = await VehoServices().login('vendor-login', body: {
      "email": email,
      "password": password,
    });
    token = data["token"];
    print(token ?? 'nulll');
  }
}
