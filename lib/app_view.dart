import 'package:delivery/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:delivery/screens/auth/views/welcome_screen.dart';
import 'package:delivery/screens/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'delivery_app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.light(
                background: Colors.grey.shade200,
                onBackground: Colors.black,
                primary: Color.fromRGBO(158, 9, 15, 1.0),
                onPrimary: Colors.white)),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: ((context, state) {
            if (state.status == AuthenticationStatus.authenticated) {
              return HomeScreen();
            } else {
              return WelcomeScreen();
            }
          }),
        ));
  }
}
