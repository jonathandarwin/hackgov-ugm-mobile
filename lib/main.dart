import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterIcon(),
              UsernameTextField(),
              PasswordTextField(),
              LoginButton()
            ],
          ),
        ),
      ),
    ); 
  }
}

class FlutterIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network("https://cdn.iconscout.com/icon/free/png-512/flutter-2038877-1720090.png",
    width: 60.0, height: 60.0,);
  }
}

class UsernameTextField extends StatelessWidget {

  static TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24.0, right: 24.0, top: 32.0, bottom: 16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "Username",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)
          )
        ),
      )
    );
  }
}

class PasswordTextField extends StatelessWidget {

  static TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 32.0),
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)
          )
        ),
      )
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
        String username = UsernameTextField.controller.text;
        String password = PasswordTextField.controller.text;
        
        String message = '';
        if(username == 'admin' && password == 'admin') {
          message = 'Welcome!';
        }
        else {
          message = 'Invalid username  / password';
        }

        final snackbar = SnackBar(content: Text(message));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }, 
      child: Text("Login")
    );
  }

}