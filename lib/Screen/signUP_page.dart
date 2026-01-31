import 'package:ecommerce_app/Screen/login_page.dart';
import 'package:ecommerce_app/services/auth_firebase_services.dart';
import 'package:flutter/material.dart';
import 'wedgets.dart';

class SignUp extends StatelessWidget {
  final TextEditingController usernameControler = TextEditingController();
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController PasswordControler = TextEditingController();
  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 70),
        child: Center(
          child: Column(
            children: [
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 27),
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextFiled(
                  hint: "User name",
                  controller: usernameControler,
                  icon: Icons.person),
              CustomTextFiled(
                  hint: "Email", controller: emailControler, icon: Icons.email),
              CustomTextFiled(
                  hint: "Password",
                  obscureText: true,
                  controller: PasswordControler,
                  icon: Icons.lock),
              CustomButton(
                  onPressed: () async {
                    final user = await AuthFirebaseServices().signUp(
                        emailControler.text.trim(),
                        PasswordControler.text.trim());
                    if (user != null) {
                      print("Signup Success: ${user.email}");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => LoginPage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Signup Failed")),
                      );
                    }
                  },
                  text: "Sign Up"),
              SizedBox(
                height: 10,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //         child: Divider(
              //       thickness: 1,
              //       color: Colors.black,
              //     )),
              //     Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 10),
              //       child: Text(
              //         "OR CONTINUE WITH",
              //         style: TextStyle(fontSize: 13),
              //       ),
              //     ),
              //     Expanded(
              //         child: Divider(
              //       thickness: 1,
              //       color: Colors.black,
              //     )),
              //   ],
              // ),
              // CustomButtonIcon(
              //   iconPath: "assets/images/google.png",
              //   text: "Continue With Google",
              //   onTap: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
