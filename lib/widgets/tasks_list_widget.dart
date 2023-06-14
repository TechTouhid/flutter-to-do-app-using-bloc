import 'package:flutter/material.dart';
import '../blocs/bloc_exports.dart';
import '../models/tasks.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            var task = taskList[index];
            return ListTile(
              title: Text(task.title),
              trailing: SizedBox(
                width: 80,
                child: Row(
                  children: [
                    Checkbox(
                      onChanged: (value) {
                        context.read<TasksBloc>().add(
                              UpdateTask(task: task),
                            );
                      },
                      value: task.isDone,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<TasksBloc>().add(
                              DeleteTask(task: task),
                            );
                      },
                      child: const Icon(Icons.delete),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
