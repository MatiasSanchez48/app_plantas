import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/auth/login/bloc/bloc_login.dart';
import 'package:app_plantas/models/models.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// TODO: Add description.
class DialogEmailToRequestPassword extends StatefulWidget {
  const DialogEmailToRequestPassword({super.key});

  @override
  State<DialogEmailToRequestPassword> createState() =>
      _DialogEmailToRequestPasswordState();
}

class _DialogEmailToRequestPasswordState
    extends State<DialogEmailToRequestPassword> {
  final _controllerEmail = TextEditingController();

  bool? _emailIncomplete;

  @override
  void dispose() {
    _controllerEmail.dispose();
    super.dispose();
  }

  void _onSendEmail(BuildContext context) {
    if (_controllerEmail.text.isEmpty) {
      setState(() => _emailIncomplete = true);
    } else {
      setState(() => _emailIncomplete = false);

      Navigator.of(context).pop();
      context.read<BlocLogin>().add(
            BlocLoginEventResetPassword(
              usuarioDto: UsersDto(email: _controllerEmail.text),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            'Enter your email',

            /// TODO(anyone): l10n
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colors.onBackground,
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 350,
              minWidth: 350,
            ),
            child: PlantsTextFormField(
              controller: _controllerEmail,
              preffixIcon: Icons.email,
              hintText: 'Email',
              autofillHints: const [AutofillHints.email],
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          const SizedBox(height: 5),
          if (_emailIncomplete == true)
            Text(
              'Please enter your email', // TODO(anyone): l10n
              style: TextStyle(
                color: colors.error,
                fontSize: 12,
                height: 1.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          const SizedBox(height: 15),
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: BlocBuilder<BlocLogin, BlocLoginState>(
                builder: (context, state) {
                  return PlantsBotton(
                    text: 'Send',

                    /// TODO(anyone): l10n
                    isLoading: state is BlocLoginStateSendingToken,
                    onPressed: () => _onSendEmail(context),
                  );
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: PlantsBotton(
                text: 'Cancel',

                /// TODO(anyone): l10n
                backgoundColor: colors.background,
                borderColor: colors.onSecondary,
                textColor: colors.onSecondary,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
