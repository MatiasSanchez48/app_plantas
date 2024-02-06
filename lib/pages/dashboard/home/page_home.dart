import 'dart:async';

import 'package:app_plantas/pages/dashboard/home/bloc/bloc_home.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()

/// {@template PageHome}
/// TODO: Add description.
/// {@endtemplate}
class PageHome extends StatelessWidget {
  /// {@macro PageHome}
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocHome, BlocHomeState>(
      builder: (context, state) => const Column(
        children: [
          PopUpMenuOpcionesMarca(idMarca: 1),
        ],
      ),
    );
  }
}

/// {@template PopUpMenuOpcionesMarca}
/// Popup menu para la marca para la funcionalidad de los tres puntitos
/// {@endtemplate}
class PopUpMenuOpcionesMarca extends StatefulWidget {
  /// {@macro PopUpMenuOpcionesMarca}
  const PopUpMenuOpcionesMarca({
    required this.idMarca,
    super.key,
  });

  /// ID de la marca a la que se le asigna el usuario
  final int idMarca;

  @override
  State<PopUpMenuOpcionesMarca> createState() => _PopUpMenuOpcionesMarcaState();
}

class _PopUpMenuOpcionesMarcaState extends State<PopUpMenuOpcionesMarca> {
  /// indica si el popupmenu esta desplegado
  bool _estaDesplegado = false;

  ///
  bool _snackBarCompleter = true;

  void _showDialogAsignarUsuarioAMarca() {
    // context.read<BlocOrganizacion>().add(
    //       BlocOrganizacionEventoInicializarListaDeSeleccionados(
    //         idMarca: widget.idMarca,
    //       ),
    //     );
    // return showDialog<void>(
    //   context: context,
    //   builder: (_) => BlocProvider.value(
    //     value: context.read<BlocOrganizacion>(),
    //     child: DialogAsignarUsuarioAMarca(
    //       organizacion: organizacion,
    //       idMarca: widget.idMarca,
    //     ),
    //   ),
    // );
  }

  /// Muestra el dialog que permite al usuario eliminar la marca clickeada o
  /// cancelar esta accion.
  void _showDialogEliminarMarca() {
    // return showDialog<void>(
    //   context: context,
    //   builder: (_) => BlocProvider.value(
    //     value: context.read<BlocOrganizacion>(),
    //     child: PrDialogRemover(
    //       esRemoverUsuarioDeMarca: false,
    //       remover: () => context.read<BlocOrganizacion>().add(
    //             BlocOrganizacionEventoEliminarMarcaDeUnaOrganizacion(
    //               idMarca: widget.idMarca,
    //             ),
    //           ),
    //     ),
    //   ),
    // );
  }

  /// Mutea las notificaciones de esa marca.
  Future<void> _mutearMarca() async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 300,
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: 'cancelar', onPressed: () {}, textColor: Colors.black),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: _ContenidoSnackBar(
          onTap: () {
            setState(() => _snackBarCompleter = false);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );

    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(seconds: 3));

    print(_snackBarCompleter);
    // if (value && /*revisar que no tenga ya la marca muteada*/) {
    //   context.read<BlocOrganizacion>().add(
    //         BlocOrganizacionEventoMutearMarca(
    //           idMarca: widget.idMarca,
    //         ),
    //       );
    // }
  }

  @override
  Widget build(BuildContext context) {
    // final colores = context.colores;

    // final l10n = context.l10n;

    return PopupMenuButton<int>(
      tooltip: '',
      onOpened: () => setState(() => _estaDesplegado = true),
      onCanceled: () => setState(() => _estaDesplegado = false),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          height: 40,
          onTap: _showDialogAsignarUsuarioAMarca,
          child: Text(
            'asignar usuario a marca',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        PopupMenuItem(
          height: 40,
          onTap: _mutearMarca,
          child: Text(
            /// TODO(mati) : en vez de mute brand notifications
            //l10n.pageOrganizationPopUpSnackBarBrandUnMuted
            'mute brand notifications',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        PopupMenuItem(
          height: 40,
          onTap: _showDialogEliminarMarca,
          child: Row(
            children: [
              Text(
                'delete brand',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              Icon(
                Icons.error_outline_rounded,
                color: Colors.red,
                size: 15,
              ),
            ],
          ),
        ),
      ],
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _estaDesplegado ? Colors.grey : Colors.transparent,
        ),
        child: Center(
          child: Icon(
            Icons.more_vert_rounded,
            color: Colors.grey,
            size: 24,
          ),
        ),
      ),
    );
  }
}

/// {@template _ContenidoSnackBar}
/// Contenido del SnackBar al mutear una marca.
/// {@endtemplate}
class _ContenidoSnackBar extends StatelessWidget {
  /// {@macro _ContenidoSnackBar}
  const _ContenidoSnackBar({
    required this.onTap,
  });

  /// Ontap del SnackBar al cancelar la acccion
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            'mutear',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          const Spacer(),
          VerticalDivider(color: Colors.black),
        ],
      ),
    );
  }
}
