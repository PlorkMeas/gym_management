import 'package:fluent_ui/fluent_ui.dart';
import 'package:gym/app_state.dart';
import 'package:gym/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: FluentApp(
          theme: FluentThemeData(),
          title: 'Gym management',
          debugShowCheckedModeBanner: false,
          // theme: FluentThemeData(
          // primarySwatch: Colors.blue,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          // useMaterial3: true,
          // ),
          home: const HomePage()),
    );
  }
}
