import 'package:scoped_model_app/enums/view_states.dart';
import 'package:scoped_model_app/service_locator.dart';
import 'package:scoped_model_app/services/storage_service.dart';

import 'base_model.dart';

class ErrorModel extends BaseModel {
  StorageService storageService = locator<StorageService>();

  String title = "HomeModel";

  Future saveData() async {
    setState(ViewState.Busy);
    title = "Saving Data";
    await storageService.saveData();
    title = "Data Saved";
    setState(ViewState.Retrieved);
  }
}