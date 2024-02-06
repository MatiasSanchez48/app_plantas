import 'dart:async';
import 'package:app_plantas/models/models.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RepositoryPlants {
  final dio = Dio();
  final url =
      kIsWeb ? dotenv.env['API_URL_WEB']! : dotenv.env['API_URL_MOBILE']!;

  Future<List<Plants>> getPlants() async {
    return methodCustomCRUD(
      callback: () async {
        final response = await dio.get<List<dynamic>>('${url}api/Plantas');

        final jsonDataList =
            List<Map<String, dynamic>>.from(response.data ?? []);

        final plantsList = jsonDataList.map(Plants.fromJson).toList();

        return plantsList;
      },
    );
  }

  Future<Plants> getPlant({required String id}) async {
    return methodCustomCRUD(
      callback: () async {
        final response = await dio.get<dynamic>('$url/api/Plantas/$id');

        final plant = Plants.fromJson(response.data as Map<String, dynamic>);

        return plant;
      },
    );
  }

  Future<String> postPlant(Plants plant) async {
    return methodCustomCRUD(
      callback: () async {
        final response = await dio.post<String>(
          '$url/api/Plantas',
          data: plant.toJson(),
        );

        return response.data.toString();
      },
    );
  }

  Future<String> putPlant(Plants plant) async {
    return methodCustomCRUD(
      callback: () async {
        final response = await dio.put<String>(
          '$url/api/Plantas',
        );

        return response.data.toString();
      },
    );
  }

  Future<String> deletePlant(String id) async {
    return methodCustomCRUD(
      callback: () async {
        final response = await dio.delete<String>(
          '$url/api/Plantas/$id',
        );

        return response.data.toString();
      },
    );
  }
}
