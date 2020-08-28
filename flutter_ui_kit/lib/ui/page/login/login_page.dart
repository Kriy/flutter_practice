import 'package:flutter/material.dart';
import 'package:flutterapp/inherited/login_provider.dart';
import 'package:flutterapp/ui/page/login/login_one/login_widget.dart';
import 'package:flutterapp/ui/widgets/login_background.dart';
import 'package:flutterapp/utils/uidata.dart';

enum LoginValidationType { phone, otp }

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class LoginPageState extends State<LoginPage> {
  final scaffoldState = GlobalKey<ScaffoldState>();

  Widget loginScaffold() => LoginProvider(
        validationErrorCallback: showValidationError,
        child: Scaffold(
          key: scaffoldState,
          backgroundColor: Color(0xffeeeeee),
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[LoginBackground(), LoginWidgets()],
          ),
        ),
      );

  showValidationError(LoginValidationType type) {
    scaffoldState.currentState.showSnackBar(SnackBar(
      content: Text(type == LoginValidationType.phone
          ? UIData.enter_valid_number
          : UIData.enter_valid_otp),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return loginScaffold();
  }
}
