import 'package:app_plantas/features/dashboard/chats/users/bloc/bloc_users.dart';
import 'package:app_plantas/features/dashboard/chats/users/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// TODO: add decription
@RoutePage()
class PageUsers extends StatelessWidget {
  const PageUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocUsers>(
      create: (context) => BlocUsers()..add(const BlocUsersEventInitial()),
      child: const ListUsers(),
    );
  }
}
