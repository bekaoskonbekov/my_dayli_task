import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_daily_task/app_const.dart';
import 'package:my_daily_task/features/presentation/cubit/task_cubit.dart';
import 'package:my_daily_task/features/presentation/pages/add_new_task.dart';
import 'package:my_daily_task/features/presentation/pages/complate_task_page.dart';
import 'package:my_daily_task/features/presentation/pages/home_page.dart';
import 'package:my_daily_task/features/presentation/widgets/theme/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final iconList = <IconData>[Icons.home, Icons.menu];

  List<Widget> get _pages => [
        HomePage(),
        ComplateTaskPage(),
        AddNewTask(),
      ];

  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: colorC80863,
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, PageConst.addNewTaskPage).then((value) {
            BlocProvider.of<TaskCubit>(context).getAllTask();
          });
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: _bottomNavBar(),
      body: _pages[_pageIndex],
    );
  }

  Widget _bottomNavBar() {
    return AnimatedBottomNavigationBar(
        activeColor: color6FADE4,
        gapLocation: GapLocation.center,
        icons: iconList,
        activeIndex: _pageIndex,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        });
  }
}
