import 'package:doctor_manager/feachers/doctor/interactor/shared_pref.dart';

class SharedPrefPresenter extends SharedPrefIntracter {
  SharedPrefPresenter();

  Future<void> saveValueFromSharedPref(String value) async {
    saveValue(value);
  }

  Future<String> loadingValueFromSharedPref() async {
    return await loadSavedValue();
  }

  Future<void> clearValueFromSharedPref() async {
    await clearValue();
  }
}
