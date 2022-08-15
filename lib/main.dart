import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_daily_task/features/presentation/cubit/task_cubit.dart';
import 'package:my_daily_task/features/presentation/screens/home_screen.dart';
import 'package:my_daily_task/injection_container.dart' as di;
import 'package:my_daily_task/on_generate_route.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskCubit>(
      create: (_)=>di.sl<TaskCubit>()..openDatabase()..initNotification(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My daily Task',
        theme: ThemeData(primaryColor: Colors.indigoAccent),
        onGenerateRoute: OngenerateRoute.route,
        routes: {
          
          '/': (contex) {
            return HomeScreen();
          }
        },
      ),
    );
  }
}
