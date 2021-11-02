import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  final mobilenumber = TextEditingController();
  final typedText = TextEditingController();
  final defaultCode = '+91';

  void addMessage() {
    final _url =
        'https://api.whatsapp.com/send/?phone=${defaultCode + mobilenumber.text}&text=${typedText.text}';
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
          title: Text(
            "NoSaveWA",
            style: GoogleFonts.hennyPenny(
              color: Colors.lightGreenAccent,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
        // drawer: Drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              VxTextField(
                autofocus: true,
                borderType: VxTextFieldBorderType.roundLine,
                borderColor: Colors.green,
                hint: "9895XXXXXX",
                cursorColor: Colors.green,
                enableSuggestions: true,
                controller: mobilenumber,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
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
                clear: true,
                maxLine: 9,
                prefixIcon: Icon(
                  Icons.message_rounded,
                ),
              ).box.p16.make().centered(),
              ElevatedButton(
                // color: Colors.green[800],
                onPressed: () {
                  addMessage();
                },
                child: "Send".text.lg.make(),
              ).p1(),
            ],
          ).centered(),
        ),
      ),
    );
  }
}
