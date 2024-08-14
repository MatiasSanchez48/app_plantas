import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/auth/forgot_password/bloc/bloc_forgot_password.dart';
import 'package:app_plantas/features/auth/forgot_password/widgets/dialogs/dialogs.dart';
import 'package:app_plantas/features/auth/forgot_password/widgets/widgets.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()

/// {@template PageForgotPassword}
/// TODO: Add description.
/// {@endtemplate}
class PageForgotPassword extends StatelessWidget {
  /// {@macro PageForgotPassword}
  const PageForgotPassword({
    @PathParam('token') required this.token,
    super.key,
  });

  final String token;

  void _navigateToLogin(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => const DialogSuccessToChangePassword(),
    );
  }

  void _dialogErrorToChangePassword(BuildContext context) => showDialog<void>(
        context: context,
        builder: (context) => const DialogErrorToChangePassword(),
      );

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocProvider<BlocForgotPassword>(
      create: (context) => BlocForgotPassword(token: token),
      child: CustomScaffold(
        backgroundColor: colors.background,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: BlocListener<BlocForgotPassword, BlocForgotPasswordState>(
            listener: (context, state) {
              if (state is BlocForgotPasswordStateSuccessToChangePassword) {
                _navigateToLogin(context);
              }
              if (state is BlocForgotPasswordStateError) {
                _dialogErrorToChangePassword(context);
              }
            },
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Forgot Password', // TODO(anyone): l10n
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colors.onBackground,
                          ),
                        ),
                      ),
                      const FormForgotPassword(),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: LogoWithCloud.downCloud(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
