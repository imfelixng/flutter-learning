import 'package:get_it/get_it.dart';

import 'core/viewmodels/login_model.dart';

GetIt locator = GetIt();

void setupLocator() {

  locator.registerLazySingleton(() => LoginModel());

}