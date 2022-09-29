import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  final mobilenumber = TextEditingController();
  final typedText = TextEditingController();
  // final defaultCode = '+91';

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
                Divider(),
                TextField(
                  controller: mobilenumber,
                  cursorColor: Colors.greenAccent,
                  decoration: InputDecoration(
                    enabled: true,
                    border: OutlineInputBorder(),
                    filled: false,
                    fillColor: Colors.green,
                    hintText: '+91871432xxxx',
                    labelText: 'Enter your mobile number',
                  ),
                  // maxLength: 10,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 5,
                ),
                VxCard("Enter your message".text.make())
                    .red600
                    .make()
                    .centered(),
                Divider(),
                TextFormField(
                  controller: typedText,
                  autofocus: false,
                  maxLength: 20,
                  decoration: InputDecoration(
                    hintText: 'Type your measseage',
                    alignLabelWithHint: true,
                    labelText: 'Enter you meassage',
                    hintMaxLines: 10,
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 10,
                  minLines: 10,
                ),
                ElevatedButton(
                  // color: Colors.green[800],
                  onPressed: () {
                    addMessage();
                  },
                  child: "Send".text.lg.make(),
                ).p1(),
              ],
            ),
          ),
          bottomSheet: Align(
            heightFactor: 0.5,
            alignment: Alignment.bottomCenter,
            child: Text(
              'Developed by Hanshir Lukku',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
              ),
            ),
          )),
    );
  }
}
