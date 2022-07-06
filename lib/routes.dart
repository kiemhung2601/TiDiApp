import 'package:flutter/material.dart';
import 'package:socialworkapp/screens/information/update/update_screen.dart';
import 'package:socialworkapp/screens/login/login_screen.dart';
import 'package:socialworkapp/screens/news/news_screen.dart';


class RoutesPath {
  static Widget loginRoute = const LoginScreen();
  static Widget newsRoute = const NewsScreen();
  static Widget updateRoute = const UpdateScreen();
}