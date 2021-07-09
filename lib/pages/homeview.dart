import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  final mobilenumber = TextEditingController();

  final typedText = TextEditingController();

  void addMessage() {
    final _url =
        'https://api.whatsapp.com/send/?phone=${mobilenumber.text}&text=${typedText.text}';
    print(_url);
    launch(_url);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black26,
        appBar: VxAppBar(
          centerTitle: true,
          title: "NoSaveWA".text.make(),
        ),
        drawer: Drawer(),
        body: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            VxTextField(
              autofocus: true,
              borderType: VxTextFieldBorderType.underLine,
              borderColor: Colors.green,
              hint: "Mobile Number",
              cursorColor: Colors.green,
              enableSuggestions: true,
              controller: mobilenumber,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
            ).p16(),
            SizedBox(
              height: 5,
            ),
            VxCard("Enter your message".text.make()).red600.make().centered(),
            VxTextField(
              controller: typedText,
              autofocus: true,
              borderColor: Colors.green,
              borderType: VxTextFieldBorderType.underLine,
              hint: "Type your message",
              maxLine: 9,
            ).box.p16.make().centered(),
            MaterialButton(
              color: Colors.green[800],
              onPressed: () {
                addMessage();
              },
              child: "Send".text.lg.make(),
            ).p1(),
          ],
        ).centered(),
      ),
    );
  }
}
