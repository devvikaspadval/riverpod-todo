
  import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todayriverpod/task_provider.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
    const AddTaskScreen({super.key});

  @override
  ConsumerState<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {

    TextEditingController editingController = TextEditingController();

    @override
  void dispose() {
    editingController.dispose();
    super.dispose();
  }

  addTask(){

  }

    @override
    Widget build(BuildContext context) {
      return Container(
        color: const Color(0xff757575),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Add Task", style: TextStyle(fontSize: 30.0, color: Theme.of(context).colorScheme.primary),textAlign: TextAlign.center,),
              TextField(autofocus:true, textAlign: TextAlign.center,controller: editingController,),
              const SizedBox(height: 10.0,),
              TextButton(onPressed: (){
                if(editingController.text.isNotEmpty){
                  ref.read(taskProvider.notifier).addTask(editingController.text);
                }else{
                  SnackBar snackBar = const SnackBar(content: Text("Please enter a task name"),);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                Navigator.pop(context);
              },style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.lightBlueAccent),

              ), child: const Text("Add",style: TextStyle(color: Colors.white),))
            ],
          ),
        ),
      );
    }
}
