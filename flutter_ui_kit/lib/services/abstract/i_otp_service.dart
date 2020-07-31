import 'package:flutterapp/model/login.dart';
import 'package:flutterapp/model/otp.dart';
import 'package:flutterapp/services/network_service_response.dart';

abstract class IOTPService {
  Future<NetworkServiceResponse<CreateOTPResponse>> createOTP(
      String phoneNumber);

  Future<NetworkServiceResponse<OTPResponse>> fetchOTPLoginResponse(
      Login userLogin);
}
