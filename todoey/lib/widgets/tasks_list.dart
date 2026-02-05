import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
          // list of tasks
          itemBuilder: (context, index) {
            // task
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (bool? checkboxState) {
                taskData.toggleTask(task);
              },
              removeTask: () {
                taskData.removeTask(task);
              },
            );
          },
          itemCount: taskData.taskCount);
    });
  }
}
