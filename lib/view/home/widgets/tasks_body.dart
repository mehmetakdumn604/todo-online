part of '../home_view.dart';

class _TasksBody extends StatelessWidget {
  const _TasksBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Container(
        width: 1.sw,
        decoration: AppStyles.instance.customDecoration,
        child: ValueListenableBuilder(
            valueListenable: LocalDbManager.instance.tasksBox.listenable(),
            builder: (context, Box box, child) {
              List tasks = box.get(LocalDbManager.instance.tasksDb) ?? [];
              if (tasks.isNotEmpty) {
                return ListView.separated(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) =>
                      StatefulBuilder(builder: (context, setState) {
                    return TaskTile(
                      index: index,
                      task: tasks[index],
                      onUpdate: (value) {
                        tasks[index] = tasks[index].copyWith(isCompleted: value);
                        LocalDbManager.instance.updateTask(tasks[index]);
                        setState(() {});
                      },
                    );
                  }),
                  separatorBuilder: (BuildContext context, int index) => seperator(index, tasks),
                );
              } else if (tasks.isEmpty) {
                return const Center(
                  child: Text("No Tasks Here..."),
                );
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  // FutureProvider<List<TaskModel>> futureProvider() {
  //   return FutureProvider<List<TaskModel>>(
  //     create: (_) => TaskController.instance.getTasks(),
  //     initialData: const [],
  //     catchError: (context, error) => [],
  //     lazy: false,
  //     updateShouldNotify: (previous, current) => previous.length != current.length,
  //     child: Consumer<List<TaskModel>>(
  //       builder: (BuildContext context, List<TaskModel> tasks, Widget? child) {
  //         if (tasks.isNotEmpty) {
  //           return ListView.separated(
  //             itemCount: tasks.length,
  //             itemBuilder: (BuildContext context, int index) => TaskTile(index: index),
  //             separatorBuilder: (BuildContext context, int index) => seperator(index, tasks),
  //           );
  //         } else if (tasks.isEmpty) {
  //           return const Center(
  //             child: Text("No Tasks Here..."),
  //           );
  //         }
  //         return const Center(child: CircularProgressIndicator());
  //       },
  //     ),
  //     builder: (context, child) => child ?? const Center(child: CircularProgressIndicator()),
  //   );
  // }

  SingleChildRenderObjectWidget seperator(int index, List tasks) {
    if (index == tasks.length - 1) {
      return const SizedBox.shrink();
    }
    TaskModel task = tasks[index];
    TaskModel newTask = tasks[index + 1];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: task.createdDate.day != newTask.createdDate.day
          ? Row(
              children: [
                const Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Text(
                    task.createdDate.toString().split(' ')[0],
                    style: AppStyles.instance.mediumStyle.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
              ],
            )
          : Divider(
              color: Colors.grey
                  .shade300, // task.createdDate == oldTask.createdDate?  Colors.grey : Colors.black,
            ),
    );
  }
}
