// To parse this JSON data, do
//
//     final plants = plantsFromJson(jsonString);
import 'dart:convert';
import 'dart:typed_data';

import 'package:app_plantas/models/users.dart';

/// TODO: add description
Plant plantsFromJson(String str) {
  final dynamic jsonMap = json.decode(str);
  return Plant.fromJson(jsonMap as Map<String, dynamic>);
}

String plantsToJson(Plant data) => json.encode(data.toJson());

class Plant {
  Plant({
    required this.descripcion,
    required this.color,
    required this.name,
    this.diasDeRegarMinimo,
    this.diasDeRegarMaximo,
    this.id,
    this.imagenesUint8List,
    this.horasAluzSolar,
    this.ultimoRiego,
    this.fechaCreacion,
    this.fechaDeEliminacion,
    this.autor,
  });

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
        id: json['id'] as String,
        name: json['name'] as String?,
        color: json['color'] as String?,
        imagenesUint8List: json['imagenesUint8List'] == null
            ? null
            : (json['imagenesUint8List'] as List<dynamic>)
                .map((e) => base64Decode(e as String))
                .toList(),
        descripcion: json['descripcion'] as String?,
        horasAluzSolar: json['horasAluzSolar'] as String?,
        diasDeRegarMinimo: json['diasDeRegarMinimo'] as int?,
        diasDeRegarMaximo: json['diasDeRegarMaximo'] as int?,
        ultimoRiego: json['ultimoRiego'] == null
            ? null
            : DateTime.parse(json['ultimoRiego'] as String),
        fechaCreacion: json['fechaCreacion'] == null
            ? null
            : DateTime.parse(json['fechaCreacion'] as String),
        fechaDeEliminacion: json['fechaDeEliminacion'] == null
            ? null
            : DateTime.parse(json['fechaDeEliminacion'] as String),
        autor: json['autor'] == null
            ? null
            : User.fromJson(json['autor'] as Map<String, dynamic>),
      );

  final String? id;
  final String? name;
  final String? color;
  final List<Uint8List>? imagenesUint8List;
  final String? descripcion;
  final String? horasAluzSolar;
  final int? diasDeRegarMinimo;
  final int? diasDeRegarMaximo;
  final DateTime? ultimoRiego;
  final DateTime? fechaCreacion;
  final DateTime? fechaDeEliminacion;
  final User? autor;

  Plant copyWith({
    String? id,
    String? name,
    String? color,
    List<Uint8List>? imagenesUint8List,
    String? descripcion,
    String? horasAluzSolar,
    int? diasDeRegarMinimo,
    int? diasDeRegarMaximo,
    DateTime? ultimoRiego,
    DateTime? fechaCreacion,
    DateTime? fechaDeEliminacion,
    User? autor,
  }) =>
      Plant(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        imagenesUint8List: imagenesUint8List ?? this.imagenesUint8List,
        descripcion: descripcion ?? this.descripcion,
        horasAluzSolar: horasAluzSolar ?? this.horasAluzSolar,
        diasDeRegarMinimo: diasDeRegarMinimo ?? this.diasDeRegarMinimo,
        diasDeRegarMaximo: diasDeRegarMaximo ?? this.diasDeRegarMaximo,
        ultimoRiego: ultimoRiego ?? this.ultimoRiego,
        fechaCreacion: fechaCreacion ?? this.fechaCreacion,
        fechaDeEliminacion: fechaDeEliminacion ?? this.fechaDeEliminacion,
        autor: autor ?? this.autor,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'color': color,
        'imagenesUint8List': imagenesUint8List
            ?.map((img) => base64Encode(img as List<int>))
            .toList(),
        'descripcion': descripcion,
        'horasAluzSolar': horasAluzSolar,
        'diasDeRegarMinimo': diasDeRegarMinimo,
        'diasDeRegarMaximo': diasDeRegarMaximo,
        'ultimoRiego': ultimoRiego?.toIso8601String(),
        'fechaCreacion': fechaCreacion?.toIso8601String(),
        'fechaDeEliminacion': fechaDeEliminacion?.toIso8601String(),
        'autor': autor?.toJson(),
      };
}
