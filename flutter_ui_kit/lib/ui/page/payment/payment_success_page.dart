import 'package:flutter/material.dart';
import 'package:flutterapp/ui/widgets/common_scaffold.dart';
import 'package:flutterapp/ui/widgets/profile_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentSuccessPage extends StatefulWidget {
  @override
  PaymentSuccessPageState createState() => PaymentSuccessPageState();
}

class PaymentSuccessPageState extends State<PaymentSuccessPage> {
  bool isDataAvailable = true;

  Widget bodyData() => Center(
        child: isDataAvailable
            ? RaisedButton(
                shape: StadiumBorder(),
                onPressed: () => showSuccessDialog(),
                color: Colors.amber,
                child: Text("Process Payment"),
              )
            : CircularProgressIndicator(),
      );

  void showSuccessDialog() {
    setState(() {
      isDataAvailable = false;
      Future.delayed(Duration(seconds: 3)).then((_) => goToDialog());
    });
  }

  goToDialog() {
    setState(() {
      isDataAvailable = true;
    });
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[],
                ),
              ),
            ));
  }

  successTicket() => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16.0),
    child: Material(
      clipBehavior: Clip.antiAlias,
      elevation: 2.0,
      borderRadius: BorderRadius.circular(4.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ProfileTile(
              title: "Thank You!",
              textColor: Colors.purple,
              subtitle: "Your transaction was successful",
            ),
            ListTile(
              title: Text("Date"),
              subtitle: Text("26 June 2018"),
              trailing: Text("11:00 AM"),
            ),
            ListTile(
              title: Text("Pawan Kumar"),
              subtitle: Text("mtechviral@gmail.com"),
              trailing: CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(
                    "https://avatars0.githubusercontent.com/u/12619420?s=460&v=4"),
              ),
            ),
            ListTile(
              title: Text("Amount"),
              subtitle: Text("\$299"),
              trailing: Text("Completed"),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0.0,
              color: Colors.grey.shade300,
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.ccAmex,
                  color: Colors.blue,
                ),
                title: Text("Credit/Debit Card"),
                subtitle: Text("Amex Card ending ***6"),
              ),
            )
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appTitle: "Payment Success",
      actionFirstIcon: null,
      bodyData: bodyData(),
    );
  }
}
