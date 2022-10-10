import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:necommerce/providers/bottom_bar_provider.dart';
import 'package:necommerce/providers/category_provider.dart';
import 'package:necommerce/widgets/bottom_bar_widget.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomBarProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NECOMMERCE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomBarWidget(),
    );
  }
}
