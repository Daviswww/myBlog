import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myblog/application/apod/apod_bloc.dart';
import 'package:myblog/application/theme/theme_bloc.dart';
import 'package:myblog/config/config_reader.dart';
import 'package:myblog/config/environment.dart';
import 'package:myblog/infrastructure/apod/apod_repository_impl.dart';
import 'package:myblog/presentation/router/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initializeApp(Environment.prod);

  final AppRouter appRouter = AppRouter();
  final ApodRepositoryImpl apodRepositoryImpl = ApodRepositoryImpl();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => ApodBloc(
            apodRepositoryImpl: apodRepositoryImpl,
          )..add(ChangeApodEvent()),
        ),
      ],
      child: MyApp(
        appRouter: appRouter,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter;

  const MyApp({
    Key? key,
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: ConfigReader.config().DEBUG,
          title: 'Daviswww',
          theme: state.themeData,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          builder: (context, router) => router!,
        );
      },
    );
  }
}
