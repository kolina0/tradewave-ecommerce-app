import 'package:dio/dio.dart';
import 'package:estore/business_logic/app_cubit/app_cubit.dart';
import 'package:estore/business_logic/authentication_cubit/authentication_cubit.dart';
import 'package:estore/business_logic/user_cubit/user_cubit.dart';
import 'package:estore/core/api/dio_consumer.dart';
import 'package:estore/presentation/router/app_router.dart';
import 'package:estore/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'presentation/styles/themes.dart';

class EstoreApp extends StatefulWidget {
  const EstoreApp({super.key});

  @override
  State<EstoreApp> createState() => _EstoreAppState();
}

class _EstoreAppState extends State<EstoreApp> {
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppCubit(),
          ),
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
          BlocProvider(
            create: (context) => UserCubit(
              UserRepository(api: DioConsumer(dio: Dio()))
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.onGenerateRoute,
          theme: Themes.darkTheme,
        ),
      );
    });
  }
}
