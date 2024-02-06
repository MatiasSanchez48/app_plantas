import 'dart:async';
import 'dart:developer';

import 'package:app_plantas/exceptions/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Future<T> methodCustomCRUD<T>({
  required FutureOr<T> Function() callback,
}) async {
  try {
    return await callback();
  } catch (e) {
    if (e is DioException) {
      if (kDebugMode) debugger();
      if (e.response != null) {
        final statusCode = e.response!.statusCode;

        switch (statusCode) {
          case 400:
            throw BadRequestException('Solicitud incorrecta');
          case 404:
            throw NotFoundException('Recurso no encontrado');
          case 405:
            throw CustomHttpException('Metodo no permitido');
          case 500:
            throw ServerErrorException('Error interno del servidor');
          default:
            throw CustomHttpException('Error HTTP $statusCode');
        }
      } else {
        throw Exception('Error de red al obtener las plantas');
      }
    } else {
      throw Exception('Error inesperado al obtener las plantas');
    }
  }
}
