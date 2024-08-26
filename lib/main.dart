import 'package:clot/src/core/constants/routes/app_routes.dart';
import 'package:clot/src/core/constants/theme/app_theme.dart';
import 'package:clot/src/core/service/hive_service.dart';
import 'package:clot/src/features/home/data/data_source/home_data_source.dart';
import 'package:clot/src/features/home/data/repository/home_repository_impl.dart';
import 'package:clot/src/features/home/domain/usecase/get_all_categories.dart';
import 'package:clot/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:clot/src/features/home/presentation/provider/home_provider.dart';
import 'package:clot/src/features/auth/provider/about_yourself.dart';
import 'package:clot/src/features/auth/provider/sign_in_provider.dart';
import 'package:clot/src/features/navigation/provider/main_provider.dart';
import 'package:clot/src/features/notification/provider/notification_provider.dart';
import 'package:clot/src/features/order/provider/order_provider.dart';
import 'package:clot/src/features/product/provider/product_provider.dart';
import 'package:clot/src/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:clot/src/features/splash/presentation/page/splash_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  await HiveService.instance.createBox();
  runApp(
    MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignInProvider()),
        ChangeNotifierProvider(create: (context) => AboutYourselfProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider(title: '', price: 0)),
        ChangeNotifierProvider(create: (context) => MainProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        BlocProvider(create: (_) => HomeBloc(categoriesUseCase: CategoriesUseCase(repository: HomeRepositoryImpl(homeDataSource: HomeDataSourceImpl(dio: Dio()))))),
        BlocProvider(create: (_) => SplashBloc()),
      ],
      child: const Clot(),
    ),
  );
}

class Clot extends StatelessWidget {
  const Clot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoutes.instance.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Clot',
      theme: light,
      darkTheme: dark,
      home: const SplashScreen(),
    );
  }
}
