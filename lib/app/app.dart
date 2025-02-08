import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_piano/app/app_router.dart';
import 'package:learning_piano/provider/service_locator.dart';

class App extends ConsumerWidget {
  App({super.key});

  final _appRouter = DI<AppRouter>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      builder: (_, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: MediaQuery.textScalerOf(context).clamp(
            minScaleFactor: 1,
            maxScaleFactor: 1,
          ),
        ),
        child: child!,
      ),
    );
  }
}
