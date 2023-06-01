import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_errors.dart'
    // ignore: library_prefixes
    as AuthErrors;
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  // Metodo de validacao do token
  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.validateToken,
        method: HttpMethods.post,
        headers: {
          'X-Parse-Session-Token': token,
        });

    if (result['result'] != null) {
      final user = UserModel.fromMap(result['result']);

      return AuthResult.success(user);
    } else {
      return AuthResult.error(AuthErrors.authErrorsString(result['error']));
    }
  }

  // Metodo de autenticacao
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
      final user = UserModel.fromMap(result['result']);

      return AuthResult.success(user);
    } else {
      return AuthResult.error(AuthErrors.authErrorsString(result['error']));
    }
  }
}
