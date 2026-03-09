import 'package:flutter/material.dart';
import 'app.dart';
import 'core/di/service_locator.dart';
import 'core/local_storage/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await HiveInitializer.init();
  runApp(const MyApp());
}


