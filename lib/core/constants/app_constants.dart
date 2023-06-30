import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todo_online/providers/todo_controller.dart';

class AppConstants {
  static final AppConstants _instance = AppConstants._internal();
  static AppConstants get instance => _instance;
  AppConstants._internal();

  List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => TaskController.instance)
  ];
}
