import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ssdinterview/core/models/categories_list_model.dart';
import 'package:ssdinterview/core/remote/service.dart';
import 'package:ssdinterview/core/utils/app_colors.dart';
import 'package:ssdinterview/features/screen1/cubit/screen1_cubit.dart';
import 'package:ssdinterview/features/screen1/screens/screen1.dart';

import 'features/screen2/cubit/screen2_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(
          create: (_) => Screen1Cubit(),
        ),
        BlocProvider(
          create: (_) => Screen2Cubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              color: AppColors.primaryColor
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
            )
          ),
          home: const Screen1()
      ),
    );
  }
}

