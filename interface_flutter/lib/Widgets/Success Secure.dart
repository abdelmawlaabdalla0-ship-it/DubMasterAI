import 'package:flutter/cupertino.dart';
import 'package:quickalert/quickalert.dart';
class SuccessSecure extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
       QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: "Secure Your Account",
      text: 'Upadate your password to keep your account',
      textAlignment: TextAlign.center,
       confirmBtnText:"OK"

    );
    throw UnimplementedError();
  }

}