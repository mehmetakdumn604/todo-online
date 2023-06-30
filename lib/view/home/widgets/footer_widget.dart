part of '../home_view.dart';

class _FooterField extends StatelessWidget {
  const _FooterField();

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = context.read<TaskController>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextFormField(
        controller: taskController.taskEditingController,
        maxLines: 1,
        onEditingComplete: () => _addTask(taskController, context),
        onFieldSubmitted: (value) => _addTask(taskController, context),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.instance.whiteColor,
          hintText: AppStrings.addTaskHint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: taskController.addTask,
              child: const CircleAvatar(
                child: Icon(
                  Icons.send,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _addTask(TaskController taskController, BuildContext context) {
    FocusScope.of(context).unfocus();
    taskController.addTask();
  }
}
