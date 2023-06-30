import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../model/task_model.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.index, required this.task, this.onUpdate});
  final int index;
  final TaskModel task;
  final Function(bool?)? onUpdate;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: onUpdate,
      value: task.isCompleted,
      fillColor: MaterialStateProperty.all(AppColors.instance.doneColor),
      title: Text(
        task.title,
        style: AppStyles.instance.boldStyle.copyWith(
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          decorationThickness: 3,
        ),
      ),
      subtitle: Text(
        task.createdDate.toString().substring(0, 16),
      ),
    );
  }
}
