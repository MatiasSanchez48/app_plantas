import 'package:app_plantas/app/app.dart';
import 'package:app_plantas/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await dotenv.load(fileName: 'prod.env');
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();

  await bootstrap(App.new);
}
