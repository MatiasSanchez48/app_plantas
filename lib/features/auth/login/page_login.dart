import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/auth/login/bloc/bloc_login.dart';
import 'package:app_plantas/features/auth/login/widgets/dialogs/dialogs.dart';
import 'package:app_plantas/features/auth/login/widgets/widgets.dart';
import 'package:app_plantas/models/models.dart';
import 'package:app_plantas/models/users.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()

/// {@template PageLogin}
/// TODO: Add description.
/// {@endtemplate}
class PageLogin extends StatelessWidget {
  /// {@macro PageLogin}
  const PageLogin({super.key});

  void _dialogEmailOrPasswordIncorrect(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => const DialogEmailOrPasswordIncorrect(),
    );
  }

  void _dialogSuccess(BuildContext context, User usuario) {
    showDialog<void>(
      context: context,
      builder: (context) => DialogSuccessToLogin(
        usuario: usuario,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocProvider<BlocLogin>(
      create: (context) => BlocLogin(),
      child: CustomScaffold(
        backgroundColor: colors.background,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: BlocListener<BlocLogin, BlocLoginState>(
              listener: (context, state) {
                if (state is BlocLoginStateErrorUserNotFound) {
                  Navigator.of(context).pop();
                  _dialogEmailOrPasswordIncorrect(context);
                }
                if (state is BlocLoginStateSuccessToSendEmailRecoveryPassword) {
                  Navigator.of(context).pop();
                  context.pushRoute(RouteForgotPassword(token: state.token));
                }
                if (state is BlocLoginStateSuccessToLogin) {
                  _dialogSuccess(context, state.usuario);
                }
                if (state is BlocLoginStateLoading) {
                  const DialogPlantsLoading().show(context);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LogoWithCloud.upCloud(),
                  const SizedBox(height: 50),
                  Center(
                    child: Text(
                      'Sign in', // TODO(anyone): l10n
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colors.onBackground,
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: FormularioLogin(),
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
