import 'package:flutter/material.dart';
import 'package:task_manager/Data/Models/task_model.dart';
import 'package:task_manager/Data/service/network_caller.dart';
import 'package:task_manager/Ui/utils/urls.dart';
import 'package:task_manager/Ui/widgets/center_circular_progress_indicator.dart';
import 'package:task_manager/Ui/widgets/snackbar_message.dart';
import 'package:task_manager/Ui/widgets/task_card.dart';

class ProgressTaskListScreen extends StatefulWidget {
  const ProgressTaskListScreen({super.key});

  @override
  State<ProgressTaskListScreen> createState() => _ProgressTaskListScreenState();
}

class _ProgressTaskListScreenState extends State<ProgressTaskListScreen> {
  bool _getProgressTaskInProgress = false;
  List<TaskModel> _progressTaskList = [];

  @override
  void initState() {
    _getProgressTaskList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Visibility(
        visible: _getProgressTaskInProgress == false,
        replacement: CenterCircularProgressIndicator(),
        child: ListView.builder(
          itemCount: _progressTaskList.length,
          itemBuilder: (context, index) {
            return TaskCard(
              taskType: TaskType.progress,
              taskModel: _progressTaskList[index],
            );
          },
        ),
      ),
    );
  }

  Future<void> _getProgressTaskList() async {
    _getProgressTaskInProgress = true;
    setState(() {});
    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.getProgressTasksUrls,
    );

    if (response.isSuccess) {
      List<TaskModel> task = [];
      for (Map<String, dynamic> jsonData in response.body!['data']) {
        task.add(TaskModel.formJson(jsonData));
      }
      _progressTaskList = task;
    } else {
      showSnackBarMessage(context, response.errorMessage!);
    }

    _getProgressTaskInProgress = false;
    setState(() {});
  }
}
