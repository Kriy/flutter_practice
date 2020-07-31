import 'package:flutterapp/services/restclient.dart';

abstract class NetworkService {
  RestClient rest;

  NetworkService(this.rest);
}
