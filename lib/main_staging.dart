import 'package:app_plantas/app/app.dart';
import 'package:app_plantas/bootstrap.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: 'stg.env');

  await bootstrap(App.new);
}
