import 'package:flutter/material.dart';

enum TaskType { tNew, completed, cancelled, progress }

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskType});

  final TaskType taskType;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title will be written here',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
            ),
            Text(
              'Task details will be written here',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text('Date: 09.09.2002'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Chip(
                  label: Text(_getTaskTypeName(), style: TextStyle(color: Colors.white)),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: _getTaskChipColor(),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                  style: IconButton.styleFrom(foregroundColor: Colors.green),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                  style: IconButton.styleFrom(foregroundColor: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getTaskChipColor() {
    switch (taskType) {
      case TaskType.tNew:
        return Colors.blue;
      case TaskType.completed:
        return Colors.green;
      case TaskType.cancelled:
        return Colors.red;
      case TaskType.progress:
       return Colors.purple;
    }
  }

  String _getTaskTypeName(){
    switch(taskType){

      case TaskType.tNew:
        return 'New';
      case TaskType.completed:
        return 'Completed';
      case TaskType.cancelled:
        return 'Cancelled';
      case TaskType.progress:
       return 'Progress';
    }
  }
}
