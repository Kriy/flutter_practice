import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutterapp/logic/bloc/credit_card_bloc.dart';
import 'package:flutterapp/ui/widgets/profile_tile.dart';
import 'package:flutterapp/utils/uidata.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreditCardPage extends StatelessWidget {
  BuildContext _context;
  CreditCardBloc cardBloc;
  MaskedTextController ccMask =
      MaskedTextController(mask: "0000 0000 0000 0000");
  MaskedTextController expMask = MaskedTextController(mask: "00/00");

  Widget bodyData() => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[creditCardWidget(), fillEntries()],
        ),
      );

  Widget creditCardWidget() {
    var devicesSize = MediaQuery.of(_context).size;
    return Container(
      height: devicesSize.height * 0.3,
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 3.0,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: UIData.kitGradients),
                ),
              ),
              Opacity(
                opacity: 0.1,
                child: Image.asset(
                  "assets/images/map.png",
                  fit: BoxFit.cover,
                ),
              ),
              MediaQuery.of(_context).orientation == Orientation.portrait
                  ? cardEntries()
                  : FittedBox(
                      child: cardEntries(),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardEntries() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StreamBuilder<String>(
              stream: cardBloc.ccOutputStream,
              initialData: "**** **** **** ****",
              builder: (context, snapshot) {
                snapshot.data.length > 0
                    ? ccMask.updateText(snapshot.data)
                    : null;
                return Text(
                  snapshot.data.length > 0
                      ? snapshot.data
                      : "**** **** **** ****",
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                StreamBuilder<String>(
                  stream: cardBloc.expOutputStream,
                  initialData: "MM/YY",
                  builder: (context, snapshot) {
                    snapshot.data.length > 0
                        ? expMask.updateText(snapshot.data)
                        : null;
                    return ProfileTile(
                      textColor: Colors.white,
                      title: "Expiry",
                      subtitle:
                          snapshot.data.length > 0 ? snapshot.data : "MM/YY",
                    );
                  },
                ),
                SizedBox(
                  width: 30.0,
                ),
                StreamBuilder<String>(
                  stream: cardBloc.cvvOutputStream,
                  initialData: "***",
                  builder: (context, snapshot) => ProfileTile(
                    textColor: Colors.white,
                    title: "CVV",
                    subtitle: snapshot.data.length > 0 ? snapshot.data : "***",
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget floatingBar() => Ink(
        decoration: ShapeDecoration(
            shape: StadiumBorder(),
            gradient: LinearGradient(colors: UIData.kitGradients)),
        child: FloatingActionButton.extended(
            onPressed: () {},
            backgroundColor: Colors.transparent,
            icon: Icon(
              FontAwesomeIcons.amazonPay,
              color: Colors.white,
            ),
            label: Text(
              "Continue",
              style: TextStyle(color: Colors.white),
            )),
      );

  @override
  Widget build(BuildContext context) {}
}
