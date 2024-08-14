import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/auth/register/bloc/bloc_register.dart';
import 'package:app_plantas/features/auth/register/widgets/dialogs/dialogs.dart';
import 'package:app_plantas/features/auth/register/widgets/widgets.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()

/// {@template PageRegister}
/// TODO: Add description.
/// {@endtemplate}
class PageRegister extends StatelessWidget {
  /// {@macro PageRegister}
  const PageRegister({super.key});
  void _dialogSuccess(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => const DialogSuccessToRegister(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocProvider<BlocRegister>(
      create: (context) => BlocRegister(),
      child: CustomScaffold(
        backgroundColor: colors.background,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: BlocListener<BlocRegister, BlocRegisterState>(
              listener: (context, state) {
                if (state is BlocRegisterStateSuccessToRegister) {
                  _dialogSuccess(context);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LogoWithCloud.upCloud(),
                  const SizedBox(height: 25),
                  Center(
                    child: Text(
                      'Create your account', // TODO(anyone): l10n
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colors.onBackground,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: FormRegister(),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
