import 'package:app_plantas/models/users.dart';
import 'package:app_plantas/utilities/method_custom.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// {@template RepositoryAuth}
/// Repository for authentication.
///
/// Contains methods to login, register, get a user by id and get a user by
/// valid token.
/// {@endtemplate}
class RepositoryAuth {
  final _dio = Dio();
  final _url =
      kIsWeb ? dotenv.env['API_URL_WEB']! : dotenv.env['API_URL_MOBILE']!;

  /// Login a user on the server.
  ///
  /// Returns a [`Usuario`] object from the server.
  /// only parameters [`email`] and [`password`] are required.
  Future<User> login({required UsersDto usuarioDto}) {
    return methodCustom(
      callback: () async {
        final response = await _dio.post<dynamic>(
          '${_url}WebServicesGenerico/api/Auth/login',
          options: Options(
            headers: {'Content-Type': 'application/json'},
          ),
          data: {
            'email': usuarioDto.email,
            'password': usuarioDto.password,
          },
        );

        final usuario = User.fromJson(response.data as Map<String, dynamic>);

        return usuario;
      },
    );
  }

  /// Register a new user on the server.
  ///
  /// Returns a [`Usuario`] object from the server.
  /// only parameters [`email`], [`username`] and [`password`] are required.
  Future<User> register({required UsersDto usuarioDto}) {
    return methodCustom(
      callback: () async {
        final response = await _dio.post<dynamic>(
          '${_url}WebServicesGenerico/api/Auth/register',
          data: {
            'username': usuarioDto.username,
            'email': usuarioDto.email,
            'password': usuarioDto.password,
          },
        );

        final usuario = User.fromJson(response.data as Map<String, dynamic>);

        return usuario;
      },
    );
  }

  /// Request a password recovery for a user on the server.
  ///
  /// Returns a [`Token`] from the server.
  /// only parameters [`email`] are required.
  Future<String> requestRecovery({required UsersDto usuarioDto}) {
    return methodCustom(
      callback: () async {
        final response = await _dio.post<dynamic>(
          '${_url}WebServicesGenerico/api/Auth/Solicitar-Recuperacion',
          data: {
            'email': usuarioDto.email,
          },
        );

        final token =
            (response.data as Map<String, dynamic>)['token'] as String;

        return token;
      },
    );
  }

  /// Reset password for a user on the server.
  ///
  /// Returns a [`Token`] from the server.
  /// only parameters [`token`] and [`NewPassword`] are required.
  Future<String> resetPassword({required UsersDto usuarioDto}) {
    return methodCustom(
      callback: () async {
        final response = await _dio.post<dynamic>(
          '${_url}WebServicesGenerico/api/Auth/resetear-password',
          data: {
            'token': usuarioDto.token,
            'newPassword': usuarioDto.newPassword,
          },
        );

        final token = response.data.toString();

        return token;
      },
    );
  }

  /// Get a user by id from the server.
  ///
  /// Returns a [User] object from the server.
  /// only parameters [`id`] are required.
  Future<User> getUsuarioById({required String id}) {
    return methodCustom(
      callback: () async {
        final response = await _dio.get<dynamic>(
          '${_url}WebServicesGenerico/api/Auth/$id',
        );

        final usuario = User.fromJson(response.data as Map<String, dynamic>);

        return usuario;
      },
    );
  }

  /// Verify if a user has a valid token.
  ///
  /// Returns a [User] object from the server.
  /// only parameters [`token`] are required.
  Future<User> getByValidToken({required String token}) {
    return methodCustom(
      callback: () async {
        final response = await _dio.get<dynamic>(
          '${_url}WebServicesGenerico/api/Auth/by-valid-token/$token',
        );

        final usuario = User.fromJson(response.data as Map<String, dynamic>);

        return usuario;
      },
    );
  }

  /// TODO cambiar esto tambien en el backend
  Future<List<User>> getusuarios() {
    return methodCustom(
      callback: () async {
        final response = await _dio.post<List<dynamic>>(
          '${_url}WebServicesGenerico/api/Auth/GetUsuarios',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );
        if (response.statusCode == 200) {
          final jsonDataList =
              List<Map<String, dynamic>>.from(response.data ?? []);

          final plantsList = jsonDataList.map(User.fromJson).toList();

          return plantsList;
        }

        return [];
      },
    );
  }
}
