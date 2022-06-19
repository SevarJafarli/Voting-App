import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainConfigurations {
  MainConfigurations._();

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
