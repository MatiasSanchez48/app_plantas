import 'package:flutter/services.dart';

class EmailInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final regex = RegExp(r'[a-zA-Z0-9@._\-]');
    var newText = newValue.text;
    newText = newText.replaceAllMapped(RegExp('.'), (match) {
      return regex.hasMatch(match.group(0)!) ? match.group(0)! : '';
    });
    return TextEditingValue(
      text: newText,
      selection: newValue.selection,
    );
  }
}
