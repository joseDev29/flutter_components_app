import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:components_app/widgets/widgets.dart';

class AlertView extends StatelessWidget {
  const AlertView({Key? key}) : super(key: key);

  void showMaterialAlert(BuildContext context) {
    showDialog(
        //Permite cerrar el dialog al hacer tap fuera
        barrierDismissible: true,
        context: context,
        builder: ((context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(16),
              ),
              title: const Text('Alert title'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('ALert content'),
                  SizedBox(height: 10),
                  FlutterLogo(size: 100),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {},
                    child: TextDangerButton(
                      text: 'Cancel',
                      onPressed: () => Navigator.pop(context),
                    )),
                TextButton(
                  onPressed: () {},
                  child: const Text('Save'),
                )
              ],
            )));
  }

  void showCupertinoAlert(BuildContext context) {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Cupertino dialog'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('ALert content'),
            SizedBox(height: 10),
            FlutterLogo(size: 100),
          ],
        ),
        actions: [
          TextDangerButton(
            text: 'Cancel',
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Save'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _CustomElevatedButton(
              onPressed: () {
                showMaterialAlert(context);
              },
              child: const Text('Show material alert'),
            ),
            _CustomElevatedButton(
              onPressed: () {
                showCupertinoAlert(context);
              },
              child: const Text('Show cupertino alert'),
            ),
            _CustomElevatedButton(
                child: const Text('Show alert by system'),
                onPressed: () {
                  if (Platform.isIOS) return showCupertinoAlert(context);
                  if (Platform.isAndroid) return showMaterialAlert(context);
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Nos retorna a la vista anterior
          Navigator.pop(context);
        },
        child: const Icon(Icons.reply_outlined),
      ),
    );
  }
}

class _CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final double width;

  const _CustomElevatedButton({
    Key? key,
    required this.child,
    this.onPressed,
    double? width,
  })  : width = width ?? 160,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
      onPressed: onPressed,
      child: SizedBox(
        width: width,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
