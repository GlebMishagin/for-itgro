import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/app_bloc.dart';
import 'package:weather/config.dart';
import 'package:weather/pages/home/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Home()));
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(255, 183, 254, 1),
                Color.fromRGBO(255, 94, 228, 1)
              ],
            ),
          ),
          child: Center(
            child: Text(
              "Weather",
              style: Config.headline1,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
