import 'package:hive/hive.dart';

import '../constants/app_strings.dart';
import '../stateManagement/provider.dart';

class ThemeProvider extends BaseProvider{

  ///constructor
  ThemeProvider(){
   init();
  }

  /// variables
  late Box settingsBox;
  bool isDarkMode = false;

  ///functions
  Future<void> init() async{
    setBusy(true);
    settingsBox = await Hive.openBox(AppStrings.settingsBoxKey);
    isDarkMode = settingsBox.get(AppStrings.darkModeKey, defaultValue: false);
    setBusy(false);

  }

  void toggleTheme(bool isDark){
    setBusy(true);
    isDarkMode = isDark;
    settingsBox.put(AppStrings.darkModeKey, isDarkMode);
    setBusy(false);
  }

}