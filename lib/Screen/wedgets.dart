import 'package:flutter/material.dart';

//--------------------------------------------//
//----------------------TEXT FILED----------------//
//--------------------------------------------//

class CustomTextFiled extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final IconData icon;
  const CustomTextFiled({
    super.key,
    required this.hint,
    required this.controller,
    this.obscureText = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: Icon(icon),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

//--------------------------------------------//
//----------------------BUTTON----------------//
//--------------------------------------------//
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 250,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17))),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: 23, color: Colors.white),
          )),
    );
  }
}

//--------------------------------------------//
//----------------------ICON SIGN UP----------------//
//--------------------------------------------//
class CustomButtonIcon extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onTap;
  const CustomButtonIcon({
    super.key,
    required this.iconPath,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            height: 60,
            width: 350,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
               ),
            child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(iconPath,width: 40,height: 40,),
                    Text(
                      text,
                      style: TextStyle(
                          fontSize: 19,
                          color: const Color.fromARGB(255, 53, 50, 50)),
                    )
                  ],
                ))),
      ),
    );
  }
}
