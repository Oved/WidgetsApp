import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: Text('Hello world'),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {
          ScaffoldMessenger.of(context).clearSnackBars();
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text(
            'Porque si sales no podrás volver a restaurar los cambios que acabas de realizar.'),
        actions: [
          TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Cancelar')),
          FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y diálogos'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                    context: context, children: [Text('Prueba de diálogo')]);
              },
              child: Text('Licencias usadas')),
          FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: Text('Mostrar diálogo'))
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_rounded),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
