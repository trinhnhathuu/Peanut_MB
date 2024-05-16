import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'constants/preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // General Methods: ----------------------------------------------------------

  // Login: ----------------------------------------------------------
  Future<bool?> get isLogin async {
    return _sharedPreference.getBool(Preferences.isLogin);
  }

  Future<bool> saveIsLogin({required bool id}) async {
    return _sharedPreference.setBool(Preferences.isLogin, id);
  }

  Future<bool> removeIsLogin() async {
    return _sharedPreference.remove(Preferences.isLogin);
  }

  Future<String?> get userId async {
    return _sharedPreference.getString(Preferences.userId);
  }

  Future<bool> saveUserId(String id) async {
    return _sharedPreference.setString(Preferences.userId, id);
  }

  // isAllowSwitchRole: ----------------------------------------------------------
  Future<bool?> get isAllowSwitchRole async {
    return _sharedPreference.getBool(Preferences.isAllowSwitchRole);
  }

  Future<bool> saveIsAllowSwitchRole({required bool isAllowSwitchRole}) async {
    return _sharedPreference.setBool(Preferences.isAllowSwitchRole, isAllowSwitchRole);
  }

  Future<bool> removeIsAllowSwitchRole() async {
    return _sharedPreference.remove(Preferences.isAllowSwitchRole);
  }

  // First: ----------------------------------------------------------
  Future<bool?> get isFirst async {
    return _sharedPreference.getBool(Preferences.isFirst);
  }

  Future<bool> saveIsFirst({required bool id}) async {
    return _sharedPreference.setBool(Preferences.isFirst, id);
  }

  Future<bool> removeIsFirst() async {
    return _sharedPreference.remove(Preferences.isFirst);
  }

  // General Methods: Access token
  Future<String?> get jwtToken async {
    return _sharedPreference.getString(Preferences.jwt_token);
  }

  Future<bool> saveAccessToken(String authToken) async {
    return _sharedPreference.setString(Preferences.accessToken, authToken);
  }

  Future<bool> removeAccessToken() async {
    return _sharedPreference.remove(Preferences.accessToken);
  }

  bool containsKey() {
    return _sharedPreference.containsKey(Preferences.accessToken);
  }

  // General Methods: refresh token
  Future<String?> get refreshToken async {
    return _sharedPreference.getString(Preferences.refresh);
  }

  Future<bool> saveRefreshToken(String refresh) async {
    return _sharedPreference.setString(Preferences.refresh, refresh);
  }

  Future<bool> removeRefreshToken() async {
    return _sharedPreference.remove(Preferences.refresh);
  }

  // General Methods: username
  Future<String?> get username async {
    return _sharedPreference.getString(Preferences.username);
  }

  Future<bool> saveUsername(String username) async {
    return _sharedPreference.setString(Preferences.username, username);
  }

  Future<bool> removeUsername() async {
    return _sharedPreference.remove(Preferences.username);
  }

  // General Methods: Password
  Future<String?> get password async {
    return _sharedPreference.getString(Preferences.password);
  }

  Future<bool> savePassword(String password) async {
    return _sharedPreference.setString(Preferences.password, password);
  }

  Future<bool> removePassword() async {
    return _sharedPreference.remove(Preferences.password);
  }
   Future<String?> get typeAccount async {
    return _sharedPreference.getString(Preferences.typeAccount);
  }

  Future<bool> saveTypeAccount(String typeAccount) async {
    return _sharedPreference.setString(Preferences.typeAccount, typeAccount);
  }

  Future<bool> removeTypeAccount() async {
    return _sharedPreference.remove(Preferences.typeAccount);
  }
}