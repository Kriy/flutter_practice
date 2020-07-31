import 'dart:async';

import 'package:flutterapp/di/dependency_injection.dart';
import 'package:flutterapp/model/login.dart';
import 'package:flutterapp/model/otp.dart';
import 'package:flutterapp/services/abstract/i_otp_service.dart';
import 'package:flutterapp/services/network_service_response.dart';
import 'package:meta/meta.dart';

class UserLoginViewModel {
  String phonenumber;
  String otp;
  bool otpResult = false;
  NetworkServiceResponse apiResult;
  IOTPService otpRepo = new Injector().otpService;

  //for otp
  UserLoginViewModel({@required this.phonenumber});

  //for login
  UserLoginViewModel.withOTP({@required this.phonenumber, @required this.otp});

  Future<Null> getOtp(String phoneNumber) async {
    NetworkServiceResponse<CreateOTPResponse> result =
    await otpRepo.createOTP(phoneNumber);
    this.otpResult = result.success;
    this.apiResult = result;
  }

  Future<Null> performLogin(UserLoginViewModel userLogin) async {
    NetworkServiceResponse<OTPResponse> result =
    await otpRepo.fetchOTPLoginResponse(
        Login(phonenumber: userLogin.phonenumber, otp: userLogin.otp));
    this.apiResult = result;
  }
}
