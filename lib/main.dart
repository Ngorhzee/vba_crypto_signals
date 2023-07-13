import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vbacrypto_signal/bloc/login_bloc/login_bloc.dart';
import 'package:vbacrypto_signal/core/router/router.dart';
import 'package:vbacrypto_signal/core/utils/colors.dart';
import 'package:vbacrypto_signal/views/authentication/login.dart';

import 'core/services/navigation_service.dart';
import 'core/utils/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>LoginBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        
          colorScheme:
              ColorScheme.fromSeed(seedColor: AppColors.scaffoldBackgroundColor),
          useMaterial3: true,
        ),
        navigatorKey: NavigationService.instance.navigatorKey,
        onGenerateRoute: NavigationRouter.generateRoute,
        home: const LoginView(),
      ),
    );
  }
}
