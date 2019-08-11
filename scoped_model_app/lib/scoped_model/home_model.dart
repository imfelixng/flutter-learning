import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_app/service_locator.dart';
import 'package:scoped_model_app/services/storage_service.dart';

class HomeModel extends Model {
  StorageService storageService = locator<StorageService>();

  String title = "HomeModel";

  Future saveData() async {
    setTitle("Saving Data");
    await storageService.saveData();
    setTitle("Data Saved");
  }

  void setTitle(String value) {
    title = value;
    notifyListeners();
  }
}