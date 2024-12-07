import 'package:veho_app/utils/core_service/serviced.dart';

class LoginService extends VehoServices {
  loginMethod(String email, String password) async {
    var data = await login('vendor-login', body: {
      "email": email,
      "password": password,
    });
    token = data["token"];
    print(token ?? 'nulll');
  }
}
