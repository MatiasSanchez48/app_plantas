import 'package:app_plantas/features/dashboard/chats/users/bloc/bloc_users.dart';
import 'package:app_plantas/features/dashboard/chats/users/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// TODO: add decription
class ListUsers extends StatelessWidget {
  const ListUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: BlocBuilder<BlocUsers, BlocUsersState>(
          builder: (context, state) {
            final users = state.users;

            if (users.isEmpty) {
              return const Center(
                child: Text(
                  'No hay usuarios',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }
            return Column(
              children: [
                ...users.map(
                  (e) => ComponentChat(
                    id: e.id,
                    name: e.username,
                    urlImage: e.urlImage,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
