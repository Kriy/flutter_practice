import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapp/inherited/login_provider.dart';
import 'package:flutterapp/logic/bloc/login_bloc.dart';
import 'package:flutterapp/logic/viewmodel/user_login_view_model.dart';
import 'package:flutterapp/model/fetch_process.dart';
import 'package:flutterapp/ui/page/login/login_page.dart';
import 'package:flutterapp/ui/widgets/api_subscription.dart';
import 'package:flutterapp/ui/widgets/gradient_button.dart';
import 'package:flutterapp/utils/translations.dart';

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard>
    with SingleTickerProviderStateMixin {
  var deviceSize;
  AnimationController controller;
  Animation<double> animation;
  LoginBloc loginBloc;
  String phoneNumber, otp;
  StreamSubscription<FetchProcess> apiStreamSubscription;

  Widget loginBuild() => StreamBuilder<bool>(
        stream: loginBloc.otpResult,
        initialData: false,
        builder: (context, snapshot) => Form(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    onChanged: (phone) => phoneNumber = phone,
                    enabled: !snapshot.data,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText:
                          Translations.of(context).text("enter_code_hint"),
                      labelText:
                          Translations.of(context).text("enter_code_label"),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  snapshot.data == false
                      ? Offstage()
                      : TextField(
                          onChanged: (myotp) => otp = myotp,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                          decoration: InputDecoration(
                            hintText:
                                Translations.of(context).text("enter_otp_hint"),
                            labelText: Translations.of(context)
                                .text("enter_otp_label"),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    child: snapshot.data == false
                        ? GradientButton(
                            onPressed: () => phoneNumber?.length == 10
                                ? loginBloc.otpSink.add(UserLoginViewModel(
                                    phonenumber: phoneNumber))
                                : showPhoneError(context),
                            text: Translations.of(context).text("get_otp"))
                        : GradientButton(
                            onPressed: () {
                              otp?.length == 4
                                  ? loginBloc.loginSink.add(
                                      UserLoginViewModel.withOTP(
                                          phonenumber: phoneNumber, otp: otp))
                                  : showOTPError(context);
                            },
                            text: Translations.of(context).text("login")),
                  ),
                  snapshot.data == true
                      ? FlatButton(
                          child:
                              Text(Translations.of(context).text("resend_otp")),
                          onPressed: () => loginBloc.resendOtpSink.add(true),
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
      );

  Widget loginCard() {
    return Opacity(
      opacity: animation.value,
      child: SizedBox(
        height: deviceSize.height / 2 - 20,
        width: deviceSize.width * 0.85,
        child: Card(
          color: Colors.white,
          elevation: 2.0,
          child: loginBuild(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loginBloc = LoginBloc();
    apiStreamSubscription = apiSubscription(loginBloc.apiResult, context);
    controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 1500,
        ));
    animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    animation.addListener(() => this.setState(() {}));
    controller.forward();
  }

  @override
  void dispose() {
    controller?.dispose();
    loginBloc?.dispose();
    apiStreamSubscription?.cancel();
    super.dispose();
  }

  showPhoneError(BuildContext context) {
    LoginProvider.of(context)
        .validationErrorCallback(LoginValidationType.phone);
  }

  showOTPError(BuildContext context) {
    LoginProvider.of(context).validationErrorCallback(LoginValidationType.otp);
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return loginCard();
  }
}
