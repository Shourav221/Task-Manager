import 'package:flutter/material.dart';
import 'package:task_manager/Ui/widgets/task_card.dart';

class ProgressTaskListScreen extends StatelessWidget {
  const ProgressTaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      return TaskCard(taskType: TaskType.progress,);
    });
  }
}
