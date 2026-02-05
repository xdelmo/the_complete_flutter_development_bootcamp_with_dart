import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import '../models/task.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;

  const TasksList({super.key, required this.tasks});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
            taskTitle: widget.tasks[index].name,
            isChecked: widget.tasks[index].isDone,
            checkboxCallback: (bool? checkboxState) {
              setState(() {
                widget.tasks[index].toggleDone();
              });
            },
          );
        },
        itemCount: widget.tasks.length);
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
    