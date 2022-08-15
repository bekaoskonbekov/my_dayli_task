import 'package:flutter/material.dart';
import 'package:my_daily_task/app_const.dart';
import 'package:my_daily_task/features/presentation/pages/add_new_task.dart';

class OngenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case PageConst.addNewTaskPage:
        {
          return materialBuilder(widget: const AddNewTask());
        }

      default:
        // ignore: prefer_const_constructors
        return materialBuilder(widget: ErrorPage());
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error Page"),
      ),
      body: const Center(
        child: Text('Error Page'),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
