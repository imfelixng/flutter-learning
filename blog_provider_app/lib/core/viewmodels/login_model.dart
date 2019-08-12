import 'package:provider_architecutre/core/enums/view_state.dart';
import 'package:provider_architecutre/core/services/authentication_service.dart';

import '../../locator.dart';
import 'base_model.dart';

class LoginModel extends BaseModel {

  String errorMessage;

  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);

    if(userId == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }

    var success =  await _authenticationService.login(userId);



    setState(ViewState.Idle);
    return success;
  }
}