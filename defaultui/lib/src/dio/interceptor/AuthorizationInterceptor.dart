import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthorizationInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // if (_needAuthorization(options)) {
    String? value = prefs.getString("API_KEY");
    options.headers['Authorization'] = value;
    //  }
    super.onRequest(options, handler);
  }

  bool _needAuthorization(RequestOptions options) {
    bool isSecured = options.extra['secured'];
    return isSecured;
  }
}
