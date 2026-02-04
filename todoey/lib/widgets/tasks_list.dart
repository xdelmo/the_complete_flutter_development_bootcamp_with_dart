import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import '../models/task.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Buy milk', isDone: false),
    Task(name: 'Buy eggs', isDone: false),
    Task(name: 'Buy bread', isDone: false),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
            taskTitle: tasks[index].name,
            isChecked: tasks[index].isDone,
            checkboxCallback: (bool? checkboxState) {
              setState(() {
                tasks[index].toggleDone();
              });
            },
          );
        },
        itemCount: tasks.length);
  }
}

    
    
    // ListView(
    //   padding: const EdgeInsets.only(
    //     top: 25.0,
    //     left: 25.0,
    //     right: 25.0,
    //   ),
    //   children: <Widget>[
    //     TaskTile(
    //       taskTitle: tasks[0].name,
    //       isChecked: tasks[0].isDone,
    //       checkboxCallback: (bool? checkboxState) {
    //         setState(() {
    //           tasks[0].isDone = checkboxState ?? false;
    //         });
    //       },
    //     ),
    //     TaskTile(
    //       taskTitle: tasks[1].name,
    //       isChecked: tasks[1].isDone,
    //       checkboxCallback: (bool? checkboxState) {
    //         setState(() {
    //           tasks[1].isDone = checkboxState ?? false;
    //         });
    //       },
    //     ),
    //     TaskTile(
    //       taskTitle: tasks[2].name,
    //       isChecked: tasks[2].isDone,
    //       checkboxCallback: (bool? checkboxState) {
    //         setState(() {
    //           tasks[2].isDone = checkboxState ?? false;
    //         });
    //       },
    //     ),
    //   ],
    // );
    