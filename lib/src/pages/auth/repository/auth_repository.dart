import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();
  Future signIn({required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );

    if (result['result'] != null) {
      // ignore: avoid_print
      print('SignIn funcionou!');
      // ignore: avoid_print
      print(result);

      final user = UserModel.fromMap(result['result']);

      // ignore: avoid_print
      print(user);
    } else {
      // ignore: avoid_print
      print('SignIn não funcionou!');
      // ignore: avoid_print
      print(result['error']);
    }
  }
}
