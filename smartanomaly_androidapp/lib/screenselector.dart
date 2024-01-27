import 'package:flutter/material.dart';
import 'package:smartanomaly_androidapp/UI/homepage/home_page.dart';
import 'package:smartanomaly_androidapp/UI/login_page/login_page.dart';
import 'package:smartanomaly_androidapp/loadingscreen.dart';
import 'package:smartanomaly_androidapp/logic/navigationservice.dart';
import 'package:smartanomaly_androidapp/logic/usermanagement_service.dart';
import 'package:watch_it/watch_it.dart';

class ScreenSelector extends StatelessWidget with WatchItMixin {
  ScreenSelector({Key? key}) : super(key: key);
  void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text("Please Check Email or Password"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var authenticatedUser = watchValue((UserManagementService x) => x.userData);
    bool isLoading = watchValue((NavigationService x) => x.isLoadingNotifier);
    registerHandler(
        select: (UserManagementService x) => x.invalidUser,
        handler: (context, value, cancel) =>
            showErrorDialog(context, value.toString()));
    if (isLoading == true) {
      return const LoadingScreen();
    } else {
      if (authenticatedUser != null) {
        return HomePage();
      } else {
        return const LoginPage();
      }
    }
  }
}
