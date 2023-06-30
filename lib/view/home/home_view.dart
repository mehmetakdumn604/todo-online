import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_online/core/constants/app_strings.dart';
import 'package:todo_online/core/init/caching/local_db_manager.dart';
import 'package:todo_online/model/task_model.dart';
import 'package:todo_online/providers/todo_controller.dart';
import 'package:todo_online/view/home/widgets/task_tile.dart';

import '../../../core/constants/app_colors.dart';
part 'widgets/header_widget.dart';
part 'widgets/tasks_body.dart';
part 'widgets/footer_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible = KeyboardVisibilityProvider.isKeyboardVisible(context);

    return Scaffold(
      backgroundColor: AppColors.instance.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          /// HEADER
          const _Header(),

          /// BODY Tasks
          const Expanded(child: _TasksBody()),

          /// FOOTER TextField
          const _FooterField(),
          SizedBox(height: isKeyboardVisible ? 130.h : 20.h),
          if (isKeyboardVisible) const Spacer(),
        ],
      ),
    );
  }
}
