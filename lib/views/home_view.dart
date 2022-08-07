import 'package:components_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:components_app/router/app_routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRouter.getMenuRoutes();

    return Scaffold(
      appBar: AppBar(title: const Text('Components App')),
      body: ListView.separated(
        itemCount: menuOptions.length,
        itemBuilder: ((context, index) {
          final menuItem = menuOptions[index];

          return ListTile(
            title: Text(menuItem.name),
            leading: Icon(menuItem.icon, color: AppTheme.primaryColor),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, menuItem.route);

              // final route = MaterialPageRoute(
              //     builder: ((context) => ListViewBasicView()));

              // Navigator.push(context, route);

              /* Resetea las rutas anteriores */
              //Navigator.pushReplacement(context, route);

              /* Resetea las rutas anteriores */
              // Navigator.pushReplacementNamed(
              //     context, 'list-view-separated');
            },
          );
        }),
        separatorBuilder: ((context, index) => const Divider()),
      ),
    );
  }
}
