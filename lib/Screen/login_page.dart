import 'package:ecommerce_app/Screen/forgetPassword.dart';
import 'package:ecommerce_app/Screen/main_nav.dart';
import 'package:ecommerce_app/Screen/signUP_page.dart';
import 'package:ecommerce_app/services/auth_firebase_services.dart';
import 'package:flutter/material.dart';
import 'wedgets.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login Page",
                style: TextStyle(fontSize: 23),
              ),
              SizedBox(height: 15),

              CustomTextFiled(
                hint: "Email",
                controller: emailController,
                icon: Icons.email,
              ),

              CustomTextFiled(
                hint: "Password",
                obscureText: true,
                controller: passwordController,
                icon: Icons.lock,
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgetPass(),
                    ),
                  );
                },
                child: Text(
                  "Forget Password ?",
                  style: TextStyle(fontSize: 17),
                ),
              ),

              CustomButton(
                onPressed: ()  {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => MainNav()),
                  );
                },
                text: "Login",
              ),

              SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.only(left: 50),
                child: Row(
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                        );
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
