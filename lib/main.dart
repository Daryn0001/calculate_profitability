import 'package:calculate_profitability/pages/Drawerhiden/hidendrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/data/thems.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemProvider(),
      builder: (context, _) {
        final themProvider = Provider.of<ThemProvider>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          themeMode: themProvider.themeMode,
          darkTheme: Mytheme.darkthem,
          theme: Mytheme.lightthem,
          home:  HidenDrawer(),
        );
      });
}
