// ignore_for_file: non_constant_identifier_names
import 'package:delivery_web/screens/home.dart';
import 'package:flutter/material.dart';

enum TypeAlert { error, confirmation, warning, generic }

void showSnackBar({
  required String msgAlert,
  required TypeAlert typeAlert,
  required BuildContext context,
}) {
  if (typeAlert == TypeAlert.error) {
    SnackBar sb = SnackBar(
      dismissDirection: DismissDirection.endToStart,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      behavior: SnackBarBehavior.floating,
      elevation: 4,
      content: Row(
        children: [
          const Icon(
            Icons.cancel_sharp,
            color: Colors.white,
            size: 30,
          ),
          const Padding(padding: EdgeInsets.only(right: 5)),
          Text(
            msgAlert,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.red[800],
    );
    ScaffoldMessenger.of(context).showSnackBar(sb);
  } else if (typeAlert == TypeAlert.confirmation) {
    SnackBar sb = SnackBar(
      dismissDirection: DismissDirection.endToStart,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      behavior: SnackBarBehavior.floating,
      elevation: 4,
      content: Row(
        children: [
          const Icon(
            Icons.check_sharp,
            color: Colors.white,
            size: 30,
          ),
          const Padding(padding: EdgeInsets.only(right: 5)),
          Text(
            msgAlert,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(sb);
  } else if (typeAlert == TypeAlert.warning) {
    SnackBar sb = SnackBar(
      dismissDirection: DismissDirection.endToStart,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      behavior: SnackBarBehavior.floating,
      elevation: 4,
      content: Row(
        children: [
          const Icon(
            Icons.warning_sharp,
            color: Colors.white,
            size: 30,
          ),
          const Padding(padding: EdgeInsets.only(right: 5)),
          Text(
            msgAlert,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.orange[800],
    );
    ScaffoldMessenger.of(context).showSnackBar(sb);
  } else {
    SnackBar sb = SnackBar(
      dismissDirection: DismissDirection.endToStart,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      behavior: SnackBarBehavior.floating,
      elevation: 4,
      content: Text(
        msgAlert,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.blue,
    );
    ScaffoldMessenger.of(context).showSnackBar(sb);
  }
}

Future<void> ShowSimpleAlertDialog(
    {required String textDialog,
    required String contentDialog,
    required BuildContext context}) async {
  return showDialog<void>(
    useSafeArea: true,
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          textDialog,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text(
                contentDialog,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Fechar'),
          ),
        ],
      );
    },
  );
}

Future<void> ShowSimpleAlertDialogSuccess(
    {required String textDialog,
    required String contentDialog,
    required BuildContext context}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        title: Text(
          textDialog,
          style: const TextStyle(color: Colors.white),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text(
                contentDialog,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
            child: const Text('Recarregar App'),
          ),
        ],
      );
    },
  );
}

Future<void> ShowSimpleAlertDialogProduct(
    {required String textDialog,
    required String contentDialog,
    required BuildContext context}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        title: Text(
          textDialog,
          style: const TextStyle(color: Colors.white),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text(
                contentDialog,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const HomeContagem()));
            },
            child: const Text('Fechar'),
          ),
        ],
      );
    },
  );
}
