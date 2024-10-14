import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:notes/routes/route_names.dart';
import 'package:notes/routes/route_pages.dart';
import 'package:notes/utils/colors.dart';

void main() {
  runApp(const Notes());
}

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.backgroundColor,
      ),
      getPages: RoutePages.routes,
      initialRoute: RouteNames.home,
    );
  }
}
