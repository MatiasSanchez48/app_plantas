import 'dart:async';
import 'dart:io';
import 'package:app_plantas/models/models.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RepositoryPlants {
  final _dio = Dio();
  final _url =
      kIsWeb ? dotenv.env['API_URL_WEB']! : dotenv.env['API_URL_MOBILE']!;

  Future<List<Plant>> getPlants() async {
    return methodCustom(
      callback: () async {
        final response = await _dio
            .get<List<dynamic>>('${_url}WebServicesGenerico/api/Plantas');

        final jsonDataList =
            List<Map<String, dynamic>>.from(response.data ?? []);

        final plantsList = jsonDataList.map(Plant.fromJson).toList();

        return plantsList;
      },
    );
  }

  Future<Plant> getPlant({required String id}) async {
    return methodCustom(
      callback: () async {
        final response = await _dio
            .get<dynamic>('${_url}WebServicesGenerico/api/Plantas/$id');

        final plant = Plant.fromJson(response.data as Map<String, dynamic>);

        return plant;
      },
    );
  }

  Future<Plant> createPlant(
    Plant plant,
    List<File> images,
    String idAutor,
  ) async {
    return methodCustom(
      callback: () async {
        final formData = FormData();

        formData.fields.addAll([
          MapEntry('name', plant.name ?? ''),
          MapEntry('descripcion', plant.descripcion ?? ''),
        ]);

        for (final image in images) {
          formData.files.add(
            MapEntry(
              'imagenes',
              await MultipartFile.fromFile(
                image.path,
                filename: image.path.split('/').last,
              ),
            ),
          );
        }

        final response = await _dio.post<Map<String, dynamic>>(
          '${_url}WebServicesGenerico/api/Plantas?idAutor=$idAutor',
          data: formData,
        );

        if (response.statusCode == 200) {
          final plant = Plant.fromJson(response.data!);
          return plant;
        } else {
          throw Exception('Failed to create plant');
        }
      },
    );
  }

  Future<String> putPlant(Plant plant) async {
    return methodCustom(
      callback: () async {
        final response = await _dio.put<String>(
          '${_url}WebServicesGenerico/api/Plantas',
        );

        return response.data.toString();
      },
    );
  }

  Future<String> deletePlant(String id) async {
    return methodCustom(
      callback: () async {
        final response = await _dio.delete<String>(
          '${_url}WebServicesGenerico/api/Plantas/$id',
        );

        return response.data.toString();
      },
    );
  }
}
