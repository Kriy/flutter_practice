import 'package:flutter/material.dart';
import 'package:flutter_app/public.dart';

class MeHeader extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var user = UserManager.currentUser;

    return GestureDetector(
      onTap: (){
        if(UserManager.instance.isLogin){
          AppNavigator.pu
        }
      },
    );
  }

}