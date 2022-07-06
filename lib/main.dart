import 'package:flutter/material.dart';
import 'package:socialworkapp/screens/information/bloc/information_bloc.dart';
import 'package:socialworkapp/screens/login/bloc/login_bloc.dart';
import 'package:socialworkapp/screens/slash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InformationBloc>(
          create: (BuildContext context) => InformationBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(),
        ),
      ],
      child: const MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
