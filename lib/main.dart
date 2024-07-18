import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/helpers/get_dep.dart' as dep;
import 'package:prathima_loan_app/helpers/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Prathima Loan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      initialRoute: RouteHelper.introductionScreen,
      getPages: RouteHelper.routes,
    );
  }
}
