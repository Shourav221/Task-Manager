import 'package:flutter/material.dart';
import 'package:task_manager/Ui/widgets/task_card.dart';

class CompletedTaskListScreen extends StatelessWidget {
  const CompletedTaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
      return TaskCard(taskType: TaskType.completed,);
    });
  }
}
