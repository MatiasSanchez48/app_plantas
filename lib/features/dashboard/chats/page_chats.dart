import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:app_plantas/utilities/widgets/custom_scaffold.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PageChats extends StatelessWidget {
  const PageChats({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: AutoRouter(
        builder: (context, content) {
          return switch (context.router.current.name) {
            RouteUsers.name => content,
            RouteChat.name => content,
            _ => const SizedBox.shrink()
          };
        },
      ),
    );
  }
}
