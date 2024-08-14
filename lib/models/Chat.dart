import 'dart:convert';

/// TODO: add description
class Participante {
  Participante({
    this.id,
    this.username,
    this.email,
    this.passwordHash,
    this.passwordSalt,
    this.isEmailConfirmed,
    this.passwordResetToken,
    this.passwordResetTokenExpiry,
    this.urlImage,
  });

  factory Participante.fromJson(Map<String, dynamic> json) => Participante(
        id: json['id'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        passwordHash: json['passwordHash'] as String?,
        passwordSalt: json['passwordSalt'] as String?,
        isEmailConfirmed: json['isEmailConfirmed'] as bool?,
        passwordResetToken: json['passwordResetToken'] as String?,
        passwordResetTokenExpiry: json['passwordResetTokenExpiry'] == null
            ? null
            : DateTime.parse(json['passwordResetTokenExpiry'] as String),
        urlImage: json['urlImage'] as String?,
      );

  factory Participante.fromRawJson(String str) =>
      Participante.fromJson(json.decode(str) as Map<String, dynamic>);
  final String? id;
  final String? username;
  final String? email;
  final String? passwordHash;
  final String? passwordSalt;
  final bool? isEmailConfirmed;
  final String? passwordResetToken;
  final DateTime? passwordResetTokenExpiry;
  final String? urlImage;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'passwordHash': passwordHash,
        'passwordSalt': passwordSalt,
        'isEmailConfirmed': isEmailConfirmed,
        'passwordResetToken': passwordResetToken,
        'passwordResetTokenExpiry': passwordResetTokenExpiry?.toIso8601String(),
        'urlImage': urlImage,
      };
}

class LeidoPor {
  LeidoPor({
    this.userId,
    this.messageId,
    this.isRead,
    this.readTime,
  });

  factory LeidoPor.fromJson(Map<String, dynamic> json) => LeidoPor(
        userId: json['userId'] as String?,
        messageId: json['messageId'] as String?,
        isRead: json['isRead'] as bool?,
        readTime: json['readTime'] == null
            ? null
            : DateTime.parse(json['readTime'] as String),
      );

  factory LeidoPor.fromRawJson(String str) =>
      LeidoPor.fromJson(json.decode(str) as Map<String, dynamic>);
  final String? userId;
  final String? messageId;
  final bool? isRead;
  final DateTime? readTime;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'messageId': messageId,
        'isRead': isRead,
        'readTime': readTime?.toIso8601String(),
      };
}

class Mensaje {
  Mensaje({
    this.id,
    this.autorId,
    this.mensaje,
    this.urlImagen,
    this.fechaCreacion,
    this.fechaModificacion,
    this.fechaEliminacion,
    this.leidoPor,
  });

  factory Mensaje.fromObjetJson(List<Object?>? obj) =>
      Mensaje.fromJson((obj ?? []) as Map<String, dynamic>);

  factory Mensaje.fromRawJson(String str) =>
      Mensaje.fromJson(json.decode(str) as Map<String, dynamic>);

  factory Mensaje.fromJson(Map<String, dynamic> json) => Mensaje(
        id: json['id'] as String?,
        autorId: json['autorId'] as String?,
        mensaje: json['mensaje'] as String?,
        urlImagen: json['urlImagen'] as String?,
        fechaCreacion: json['fechaCreacion'] == null
            ? null
            : DateTime.parse(json['fechaCreacion'] as String),
        fechaModificacion: json['fechaModificacion'] == null
            ? null
            : DateTime.parse(json['fechaModificacion'] as String),
        fechaEliminacion: json['fechaEliminacion'] as DateTime?,
        leidoPor: json['leidoPor'] == null
            ? []
            : List<LeidoPor>.from(
                (json['leidoPor'] as List<dynamic>).map(
                  (x) => LeidoPor.fromJson(x as Map<String, dynamic>),
                ),
              ),
      );

  final String? id;
  final String? autorId;
  final String? mensaje;
  final String? urlImagen;
  final DateTime? fechaCreacion;
  final DateTime? fechaModificacion;
  final DateTime? fechaEliminacion;
  final List<LeidoPor>? leidoPor;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'id': id,
        'autorId': autorId,
        'mensaje': mensaje,
        'urlImagen': urlImagen,
        'fechaCreacion': fechaCreacion?.toIso8601String(),
        'fechaModificacion': fechaModificacion?.toIso8601String(),
        'fechaEliminacion': fechaEliminacion,
        'leidoPor': leidoPor == null
            ? <LeidoPor>[]
            : List<dynamic>.from(leidoPor!.map((x) => x.toJson())),
      };
  static List<Mensaje> fromObjetListJson(Object obj) =>
      List<Map<String, dynamic>>.from(obj as Iterable)
          .map(Mensaje.fromJson)
          .toList();
}

class Chat {
  Chat({
    this.id,
    this.nombre,
    this.participantes,
    this.mensajes,
    this.fechaCreacion,
    this.fechaEliminacion,
  });

  factory Chat.fromRawJson(String str) =>
      Chat.fromJson(json.decode(str) as Map<String, dynamic>);

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json['id'] as String?,
        nombre: json['nombre'] as String?,
        participantes: json['participantes'] == null
            ? []
            : List<Participante>.from(
                (json['participantes'] as List<dynamic>).map(
                  (x) => Participante.fromJson(x as Map<String, dynamic>),
                ),
              ),
        mensajes: json['mensajes'] == null
            ? []
            : List<Mensaje>.from(
                (json['mensajes'] as List<dynamic>).map(
                  (x) => Mensaje.fromJson(x as Map<String, dynamic>),
                ),
              ),
        fechaCreacion: json['fechaCreacion'] == null
            ? null
            : DateTime.parse(json['fechaCreacion'] as String),
        fechaEliminacion: json['fechaEliminacion'] as DateTime?,
      );
  final String? id;
  final String? nombre;
  final List<Participante>? participantes;
  final List<Mensaje>? mensajes;
  final DateTime? fechaCreacion;
  final DateTime? fechaEliminacion;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': nombre,
        'participantes': participantes == null
            ? <Participante>[]
            : List<dynamic>.from(participantes!.map((x) => x.toJson())),
        'mensajes': mensajes == null
            ? <Mensaje>[]
            : List<dynamic>.from(mensajes!.map((x) => x.toJson())),
        'fechaCreacion': fechaCreacion?.toIso8601String(),
        'fechaEliminacion': fechaEliminacion,
      };
}
