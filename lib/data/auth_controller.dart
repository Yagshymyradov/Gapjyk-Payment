// ignore_for_file: constant_identifier_names
// ignore: depend_on_referenced_packages
import 'package:state_notifier/state_notifier.dart';

import 'response.dart';
import 'services/preferences.dart';

class UserState {
  final int? id;
  final String? name;
  final String? username;
  final String? accessToken;

  UserState({
    required this.id,
    required this.name,
    required this.username,
    required this.accessToken,
  });

  UserState copyWith({
    int? id,
    String? name,
    String? username,
    String? accessToken,
  }) {
    return UserState(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}

class AuthController extends StateNotifier<UserState?> {
  static const _Id = 'id';
  static const _Name = 'name';
  static const _Username = 'username';
  static const _AccessToken = 'access_token';

  final AppPrefsService _service;

  String? get authToken => state?.accessToken;

  AuthController(this._service, super.state);

  static UserState? initialState(AppPrefsService service) {
    int id = 0;
    String? name;
    String? username;
    String? accessToken;

    try {
      id = service.getInt(_Id) ?? 0;
      name = service.getString(_Name);
      username = service.getString(_Username);
      accessToken = service.getString(_AccessToken);
    } catch (e) {
      //ignored
    }

    if (accessToken != null) {
      return UserState(
        id: id,
        name: name,
        username: username,
        accessToken: accessToken,
      );
    }
    return null;
  }

  Future<void> onSignedIn(AuthResponse response) async {
    final newState = UserState(
      id: response.id,
      name: response.name,
      username: response.username,
      accessToken: response.accessToken,
    );
    state = newState;

    try {
      await _service.setInt(_Id, newState.id ?? 0);
      await _service.setString(_Name, newState.name ?? '');
      await _service.setString(_Username, newState.username ?? '');
      await _service.setString(_AccessToken, newState.accessToken ?? '');
    } catch (e) {
      //ignored
    }
  }

  Future<void> signOut() async {
    state = null;

    try {
      await _service.remove(_Id);
      await _service.remove(_Name);
      await _service.remove(_Username);
      await _service.remove(_AccessToken);
    } catch (e) {
      //ignored
    }
  }
}
