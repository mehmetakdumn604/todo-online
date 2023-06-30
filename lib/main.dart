//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:todo_online/core/constants/app_colors.dart';
import 'package:todo_online/core/constants/app_constants.dart';
import 'package:todo_online/core/init/caching/local_db_manager.dart';
import 'package:todo_online/providers/todo_controller.dart';
import 'package:todo_online/view/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocalDbManager.instance.initializeHive();
  runApp(
    MultiProvider(
      providers: AppConstants.instance.providers,
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = context.watch<TaskController>();
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      builder: (context, child) => child!,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, child) => KeyboardVisibilityProvider(
                child: LoadingOverlay(
                  isLoading: taskController.isLoading,
                  child: KeyboardDismissOnTap(
                    dismissOnCapturedTaps: true,
                    child: MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0.sp),
                      child: child!,
                    ),
                  ),
                ),
              ),
          home: const HomeView(),
          theme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: AppColors.instance.scaffoldBackgroundColor,
            checkboxTheme: const CheckboxThemeData(
              shape: CircleBorder(),
            ),
          )),
    );
  }
}
