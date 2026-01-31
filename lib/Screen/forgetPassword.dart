import 'package:ecommerce_app/Screen/wedgets.dart';
import 'package:flutter/material.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final TextEditingController emailControler = TextEditingController();
  //  final TextEditingController PasswordControler=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        )),
        body: Padding(
          padding: EdgeInsets.only(top: 150),
          child: Column(
            children: [
              Text(
                "Forget Password",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFiled(
                  hint: "enter your email",
                  controller: emailControler,
                  icon: Icons.email),
              SizedBox(
                height: 20,
              ),
              CustomButton(onPressed: () {}, text: "SEND")
            ],
          ),
        ),
      ),
    );
  }
}
