import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/pages/auth/register/widgets/widgets.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()

/// {@template PageRegister}
/// TODO: Add description.
/// {@endtemplate}
class PageRegister extends StatelessWidget {
  /// {@macro PageRegister}
  const PageRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return CustomScaffold(
      backgroundColor: colors.primaryOpacity80,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 35,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            colors.primaryOpacity50,
                            colors.primaryOpacity30,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: MaterialButton(
                        elevation: 5,
                        onPressed: () =>
                            context.replaceRoute(const RouteLogin()),
                        child: Text(
                          'Login', // TODO(anyone): l10n
                          style: TextStyle(
                            color: colors.background,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Center(
                  child: Text(
                    'Register', // TODO(anyone): l10n
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: colors.background,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  'Nombre', // TODO(anyone): l10n
                  style: TextStyle(
                    color: colors.background,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                const FormRegister(),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
