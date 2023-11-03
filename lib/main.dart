import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_task/core/style/app_theme.dart';
import 'package:real_estate_task/features/home/controller/home/home_cubit.dart';
import 'package:real_estate_task/features/home/controller/user/user_cubit.dart';
import 'package:real_estate_task/features/home/view/home_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  /// DISABLE AUTO ROTATE
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => HomeCubit()),
        BlocProvider(create: (BuildContext context) => UserDataCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Real Estate APP',
        theme: AppTheme.appLightTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
