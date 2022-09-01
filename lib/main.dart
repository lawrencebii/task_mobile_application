import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_mobile_application/blocs/bloc_exports.dart';
import 'package:task_mobile_application/presentation/task_screen.dart';
import 'package:task_mobile_application/services/app_routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory:
          await getApplicationDocumentsDirectory());
  HydratedBlocOverrides.runZoned(
      storage: storage,
      () => runApp(MyApp(
            appRouter: AppRouter(),
          )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter})
      : super(key: key);
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskBloc>(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: TasksScreen(),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
