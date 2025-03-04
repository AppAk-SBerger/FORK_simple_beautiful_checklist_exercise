import 'package:simple_beautiful_checklist_exercise/shared/shared_preferences_repository.dart';
import 'main_app.dart';
import 'package:flutter/material.dart';
import 'package:simple_beautiful_checklist_exercise/shared/database_repository.dart';

void main() async {
  // Wird benötigt, um auf SharedPreferences zuzugreifen
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Hier statt MockDatabase() ein SharedPreferencesRepository() verwenden.
  final DatabaseRepository repository = SharedPreferencesRepository();

  runApp(MainApp(repository: repository));
}
