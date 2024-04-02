import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmedia_app/application/blocs/fecthpostbloc/fetch_post_bloc.dart';
import 'package:socialmedia_app/application/blocs/postbloc/post_bloc_bloc.dart';
import 'package:socialmedia_app/application/screens/splash/spalsh.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostBlocBloc(),
        ),
        BlocProvider(
          create: (context) => FetchPostBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
