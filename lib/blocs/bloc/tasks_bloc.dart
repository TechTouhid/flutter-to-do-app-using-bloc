import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/tasks.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    onAddTask(AddTask event, Emitter<TasksState> emit) {
      final state = this.state;
      emit(TasksState(
        allTasks: List.from(state.allTasks)..add(event.task),
      ));
    }

    onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
      final state = this.state;
      emit(TasksState(
        allTasks: List.from(state.allTasks)..add(event.task),
      ));
    }

    onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
      final state = this.state;
      emit(TasksState(
        allTasks: List.from(state.allTasks)..add(event.task),
      ));
    }

    on<AddTask>(onAddTask);
    on<UpdateTask>(onUpdateTask);
    on<DeleteTask>(onDeleteTask);
  }
}
