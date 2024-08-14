import 'dart:async';
import 'dart:developer';

import 'package:app_plantas/exceptions/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

///TODO: add description.
Future<T> methodCustom<T>({
  required FutureOr<T> Function() callback,
  void Function(Object e)? onError,
}) async {
  try {
    return await callback();
  } on DioException catch (dioError) {
    if (dioError.response != null) {
      debugPrint('Dio error!');
      debugPrint('STATUS: ${dioError.response?.statusCode}');
      debugPrint('DATA: ${dioError.response?.data}');
      debugPrint('HEADERS: ${dioError.response?.headers}');
    } else {
      // Error que no es de respuesta (e.g., conexión fallida, timeout, etc.)
      debugPrint('Error no de respuesta: ${dioError.message}');
    }
    rethrow;
  } catch (e) {
    onError?.call(e);
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
        throw Exception('Error de red ');
      }
    } else {
      throw Exception('Error inesperado al obtener las plantas');
    }
  }
}
