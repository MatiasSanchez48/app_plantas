// To parse this JSON data, do
//
//     final plants = plantsFromJson(jsonString);

import 'dart:convert';
import 'dart:typed_data';

Plants plantsFromJson(String str) {
  final dynamic jsonMap = json.decode(str);
  return Plants.fromJson(jsonMap as Map<String, dynamic>);
}

String plantsToJson(Plants data) => json.encode(data.toJson());

class Plants {
  Plants({
    required this.id,
    required this.name,
    required this.color,
    required this.imagenPath,
    required this.descripcion,
    required this.horasAluzSolar,
    required this.diasDeRegarMinimo,
    required this.diasDeRegarMaximo,
    required this.ultimoRiego,
  });

  factory Plants.fromJson(Map<String, dynamic> json) => Plants(
        id: json['id'] as String,
        name: json['name'] as String,
        color: json['color'] as String,
        imagenPath: json['imagenPath'] as Uint8List?,
        descripcion: json['descripcion'] as String?,
        horasAluzSolar: json['horasAluzSolar'] as String?,
        diasDeRegarMinimo: json['diasDeRegarMinimo'] as int,
        diasDeRegarMaximo: json['diasDeRegarMaximo'] as int,
        ultimoRiego: DateTime.parse(json['ultimoRiego'] as String),
      );
  final String id;
  final String name;
  final String color;
  final Uint8List? imagenPath;
  final String? descripcion;
  final String? horasAluzSolar;
  final int diasDeRegarMinimo;
  final int diasDeRegarMaximo;
  final DateTime ultimoRiego;

  Plants copyWith({
    String? id,
    String? name,
    String? color,
    Uint8List? imagenPath,
    String? descripcion,
    String? horasAluzSolar,
    int? diasDeRegarMinimo,
    int? diasDeRegarMaximo,
    DateTime? ultimoRiego,
  }) =>
      Plants(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        imagenPath: imagenPath ?? this.imagenPath,
        descripcion: descripcion ?? this.descripcion,
        horasAluzSolar: horasAluzSolar ?? this.horasAluzSolar,
        diasDeRegarMinimo: diasDeRegarMinimo ?? this.diasDeRegarMinimo,
        diasDeRegarMaximo: diasDeRegarMaximo ?? this.diasDeRegarMaximo,
        ultimoRiego: ultimoRiego ?? this.ultimoRiego,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'color': color,
        'imagenPath': imagenPath,
        'descripcion': descripcion,
        'horasAluzSolar': horasAluzSolar,
        'diasDeRegarMinimo': diasDeRegarMinimo,
        'diasDeRegarMaximo': diasDeRegarMaximo,
        'ultimoRiego': ultimoRiego.toIso8601String(),
      };
}
