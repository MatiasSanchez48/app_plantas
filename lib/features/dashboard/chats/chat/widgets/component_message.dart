import 'dart:convert';

import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ComponentMessage extends StatelessWidget {
  const ComponentMessage({
    required this.idAutor,
    required this.message,
    required this.creationDate,
    super.key,
  });

  final String idAutor;

  final String message;

  final DateTime creationDate;

  String _getTimeAgo(DateTime pastDate) {
    final now = DateTime.now();
    final timeSpan = now.difference(pastDate);

    if (timeSpan.inDays >= 1) {
      final days = timeSpan.inDays;
      return '$days ${days > 1 ? "days" : "day"} ago';
    } else if (timeSpan.inHours >= 1) {
      final hours = timeSpan.inHours;
      final minutes = timeSpan.inMinutes % 60;
      return '${hours.toString().padLeft(2, '0')}'
          ':${minutes.toString().padLeft(2, '0')} hs ago';
    } else {
      final minutes = timeSpan.inMinutes;
      return '$minutes min${minutes > 1 ? "s" : ""} ago';
    }
  }

  Future<bool> _isMine() async {
    final prefs = await SharedPreferences.getInstance();
    final usuarioJson = prefs.getString('usuario');

    if (usuarioJson != null) {
      // Paso 2: Decodificar el JSON a un Mapa
      final usuarioMap = jsonDecode(usuarioJson) as Map<String, dynamic>;

      // Paso 3: Convertir el Mapa a tu Modelo Usuario
      final usuario = User.fromJson(usuarioMap);
      return idAutor == usuario.id;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return FutureBuilder(
      future: _isMine(),
      builder: (context, snapshot) {
        final isMine = snapshot.data ?? false;

        return Row(
          mainAxisAlignment:
              isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: colors.onPrimary,
                      borderRadius: BorderRadius.only(
                        bottomLeft:
                            isMine ? const Radius.circular(10) : Radius.zero,
                        bottomRight:
                            isMine ? Radius.zero : const Radius.circular(10),
                        topRight: const Radius.circular(10),
                        topLeft: const Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 3,
                      ),
                      child: ConstrainedBox(
                        constraints:
                            const BoxConstraints(maxWidth: 250, minWidth: 50),
                        child: Text(
                          message,
                          style: TextStyle(
                            fontSize: 14,
                            color: colors.onBackground,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      _getTimeAgo(creationDate),
                      style: TextStyle(
                        fontSize: 9,
                        color: colors.onBackground,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
