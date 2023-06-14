import '../blocs/bloc_exports.dart';
import 'package:flutter/material.dart';

import '../models/tasks.dart';

class AddTaskScreen extends StatefulWidget {

   const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Add Task'),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: titleController,
            autofocus: true,
            style: const TextStyle(
              fontSize: 24,
            ),
            decoration: const InputDecoration(
                label: Text('Title'), border: OutlineInputBorder()),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                var task = Task(title: titleController.text);
                context.read<TasksBloc>().add(
                  AddTask(task: task),
                );
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        )
      ],
    );
  }
}