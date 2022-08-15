import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:my_daily_task/features/domain/entities/task_entity.dart';
import 'package:my_daily_task/features/presentation/cubit/task_cubit.dart';
import 'package:my_daily_task/features/presentation/widgets/common.dart';
import 'package:my_daily_task/features/presentation/widgets/theme/style.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  int _selectedTaskTypeIndex = 0;
  DateTime _selectedTime = DateTime.now();
  TextEditingController _taskTextController = TextEditingController();
  @override
  void dispose() {
    _taskTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Task'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _addNewTaskWidget(),
            _divider(),
            _taskTypeWidget(),
            _divider(),
            _chooseTimeWidget(),
            _addTaskButtonWidget(),
          ],
        ),
      ),
    );
  }

  _addNewTaskWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.blueGrey.withOpacity(.2),
      ),
      child: Scrollbar(
        thickness: 6,
        child: TextField(
          controller: _taskTextController,
          maxLines: 4,
          decoration: InputDecoration(
              hintText: "e.g morning walk", border: InputBorder.none),
        ),
      ),
    );
  }

  _divider() {
    return Column(
      children: const [
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 1.5,
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  _taskTypeWidget() {
    return Container(
      height: 20,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: taskTypeList.map((name) {
          var index = taskTypeList.indexOf(name);

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTaskTypeIndex = index;
              });
            },
            child: _selectedTaskTypeIndex == index
                ? Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: taskTypeListColor[index],
                      ),
                      child: Text(
                        name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: taskTypeListColor[index],
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
          );
        }).toList(),
      ),
    );
  }

  Future<Null> _selectTime() async {
    final time = showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 10, minute: 47),
      builder: (BuildContext context, Widget? child) {
        Locale locale = Localizations.localeOf(context);
        final force24HourFormat = locale.countryCode == 'RO';
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: force24HourFormat,
          ),
          child: child!,
        );
      },
    );
  }

  _chooseTimeWidget() {
    return GestureDetector(
      onTap: () {
        _selectTime();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose Time",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
              "${DateFormat("hh:mm a").format(DateTime.now())} - ${DateFormat("hh:mm a").format(_selectedTime)}"),
        ],
      ),
    );
  }

  _addTaskButtonWidget() {
    return Expanded(
      child: GestureDetector(
        onTap: submitNewTask,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(colors: [
                Colors.indigo,
                color6FADE4,
              ], end: Alignment.topLeft, begin: Alignment.topRight),
            ),
            child: Text(
              "Add task",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }

  void submitNewTask() {
    if (_taskTextController.text.isEmpty) {
      return;
    }
    BlocProvider.of<TaskCubit>(context).addNewTask(
        task: TaskEntity(
      title: _taskTextController.text,
      taskType: taskTypeList[_selectedTaskTypeIndex],
      isNotification: false,
      isComplateTask: false,
      colorIndex: _selectedTaskTypeIndex,
      time: _selectedTime.toString(), id: '',
    ));
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "New Task Added Successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }
}
