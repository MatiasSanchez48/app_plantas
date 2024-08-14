import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/models/models.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// TODO: Add description.
class CardHeader extends StatefulWidget {
  const CardHeader({
    required this.plant,
    super.key,
  });

  final Plant plant;

  @override
  State<CardHeader> createState() => _CardHeaderState();
}

class _CardHeaderState extends State<CardHeader> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.network(
                    widget.plant.autor?.urlImage ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => InitialsNames(
                      nameComplete: widget.plant.autor?.username ?? '',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SelectableText(
                      widget.plant.autor?.username ?? '',
                      style: TextStyle(
                        color: colors.onBackground,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                    ),
                    SelectableText(
                      (widget.plant.fechaCreacion ?? DateTime.now())
                          .formattedDate,
                      style: TextStyle(
                        color: colors.onSecondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final text = widget.plant.descripcion ?? '';
              // Measure the text height
              final span = TextSpan(
                text: text,
              );
              final tp = TextPainter(
                text: span,
                maxLines: 1,
                textDirection: TextDirection.ltr,
              )..layout(maxWidth: constraints.maxWidth);

              if (tp.didExceedMaxLines) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      maxLines: _isExpanded ? null : 1,
                      overflow: _isExpanded
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                      style: TextStyle(
                        color: colors.onBackground,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Text(
                        _isExpanded ? 'Ver menos' : 'Ver más',
                        style: TextStyle(
                          color: colors.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Text(text);
              }
            },
          ),
        ),
      ],
    );
  }
}
