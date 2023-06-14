import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_to_do_app_using_bloc/blocs/bloc_exports.dart';

import '../../models/tasks.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    onAddTask(AddTask event, Emitter<TasksState> emit) {
      final state = this.state;
      emit(TasksState(
        allTasks: List.from(state.allTasks)..add(event.task),
      ));
    }

    onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
      final state = this.state;
      final task = event.task;
      final int index = state.allTasks.indexOf(task);

      // removed the task form the task list
      List<Task> allTasks = List.from(state.allTasks)..remove(task);

      // add the task with new task
      task.isDone == false
          ? allTasks.insert(index, task.copyWith(isDone: true))
          : allTasks.insert(index, task.copyWith(isDone: false));
      // then emmit the new task list
      emit(TasksState(
        allTasks: allTasks,
      ));
    }

    onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
      final state = this.state;
      final task = event.task;

      // remove the task from the list
      List<Task> allTasks = List.from(state.allTasks)..remove(task);

      // emmit the changes
      emit(TasksState(
        allTasks: allTasks,
      ));
    }

    on<AddTask>(onAddTask);
    on<UpdateTask>(onUpdateTask);
    on<DeleteTask>(onDeleteTask);
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
  
}
