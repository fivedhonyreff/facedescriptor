import 'package:get_storage/get_storage.dart';
import 'package:mpia/src/core/data/model/auth/user_model.dart';

abstract class LocalAuthData {
  factory LocalAuthData() = _LocalAuthData;
  UserModel? getAuth();
  void setAuth(UserModel auth);
  void removeAuth();
  Map<String, String> getHeader();
}

class _LocalAuthData implements LocalAuthData {
  final _key = 'auth-key';
  final _storage = GetStorage();

  @override
  UserModel? getAuth() {
    final raw = _storage.read(_key);
    print("raw $raw");
    if (raw != null) {
      return UserModel.fromJson(raw);
    }
    return null;
  }

  @override
  void removeAuth() {
    _storage.remove(_key);
  }

  @override
  void setAuth(UserModel auth) {
    print(auth.toJson());
    try {
      _storage.write(
        _key,
        auth.toJson(),
      );
    } catch (e) {
      print(e.toString());
    }
    getAuth();
  }

  @override
  Map<String, String> getHeader() {
    final raw = _storage.read(_key);
    if (raw != null) {
      final auth = UserModel.fromJson(raw);
      return {
        'Authorization': 'Bearer ${auth.token}',
      };
    }
    return {};
  }
}
