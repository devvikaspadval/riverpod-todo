

import 'package:flutter_riverpod/legacy.dart';
import 'package:todayriverpod/item.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, List<Item>>((ref){
    return TaskNotifier();
});


class TaskNotifier extends StateNotifier<List<Item>> {

    TaskNotifier() : super([]);

    void addTask(String pTaskName){
        final task = Item(name: pTaskName, isCompleted: false);
        state.add(task);
        state = state.toList();
    }

    void toggleTaskStatus(int index){
        final task = state[index];
        final updatedTask = Item(name: task.name, isCompleted: !task.isCompleted);
        state[index] = updatedTask;
        state = state.toList();
    }

}