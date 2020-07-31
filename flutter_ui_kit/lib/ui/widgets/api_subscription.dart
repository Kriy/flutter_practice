import 'package:flutter/material.dart';
import 'package:flutterapp/model/fetch_process.dart';
import 'package:flutterapp/ui/widgets/common_dialogs.dart';
import 'package:flutterapp/utils/uidata.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

apiSubscription(Stream<FetchProcess> apiResult, BuildContext context) {
  apiResult.listen((FetchProcess p) {
    if (p.loading) {
      showProgress(context);
    } else {
      hideProgress(context);
      if (p.response.success == false) {
        fetchApiResult(context, p.response);
      } else {
        switch (p.type) {
          case ApiType.performLogin:
            showSuccess(context, UIData.success, FontAwesomeIcons.check);
            break;
          case ApiType.getProductInfo:
            break;
          case ApiType.performOTP:
            break;
        }
      }
    }
  });
}
