import 'package:intl/intl.dart';

/// Extension for DateTime
extension DateTimeX on DateTime {
  String get formattedDate {
    final now = DateTime.now();
    final difference = now.difference(this);

    /// todo: add more conditions traductions
    if (difference.inDays > 10) {
      // more than 10 days
      return DateFormat('d MMMM yyyy').format(this);
    } else if (difference.inDays >= 1) {
      // Diference in days
      return '${difference.inDays} ${difference.inDays == 1 ? 'día' : 'días'}';
    } else if (difference.inHours >= 1) {
      // Diference in hours
      return '${difference.inHours}'
          ' ${difference.inHours == 1 ? 'hora' : 'horas'}';
    } else if (difference.inMinutes >= 1) {
      // Diference in minutes
      return '${difference.inMinutes}'
          ' ${difference.inMinutes == 1 ? 'minuto' : 'minutos'}';
    } else {
      // Diference in seconds
      return 'Hace unos segundos';
    }
  }
}
