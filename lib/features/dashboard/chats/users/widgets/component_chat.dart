import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:app_plantas/extensions/extensions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// TODO: add decription
class ComponentChat extends StatelessWidget {
  const ComponentChat({
    this.urlImage,
    this.name,
    this.id,
    super.key,
  });
  final String? id;
  final String? name;
  final String? urlImage;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InkWell(
      onTap: () => context.pushRoute(RouteChat(idUser: id ?? '')),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SizedBox(
          height: 50,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  urlImage ?? '',
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset('assets/images/beer.png'),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                name ?? '',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: colors.onBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
