import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_client_peymantahkim/provider/user_provider.dart';
import 'package:flutter_client_peymantahkim/theme/theme.dart';
import 'package:flutter_client_peymantahkim/views/screens/authentication_screens/login_screen.dart';
import 'package:flutter_client_peymantahkim/views/screens/main_screen.dart';
import 'package:flutter_client_peymantahkim/views/widgets/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  // run the flutter app wrapped in a provider scope for managing state.
  runApp(ProviderScope(child: const MyApp()));
}

// root widget of application, a consumer widget to consume state change

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // method to check the token and set the user data if available

  Future<void> _checkTokenAndSetUser(WidgetRef ref) async {
    // obtain an instance of shred preference for local data storage
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // retrieve the authentication token and user data stored locally

    String? token = preferences.getString('auth_token');
    String? userJson = preferences.getString('user');

    // if both token and user data are available, update the user state
    if (token != null && userJson != null) {
      ref.read(userProvider.notifier).setUser(userJson);
    } else {
      ref.read(userProvider.notifier).signOut();
    }
  }

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      title: 'Flutter PeymanTahkim Company',
      home: FutureBuilder(
          future: _checkTokenAndSetUser(ref),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final user = ref.watch(userProvider);

            return user != null ? MainScreen() : SplashScreen();
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
