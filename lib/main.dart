import 'package:flutter/material.dart';
import 'package:test_app/home.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool isButtonDisabled = true;

  void checkForm() {
    String username = UsernameTextField.controller.text;
    String password = PasswordTextField.controller.text;

    setState(() {
      isButtonDisabled = username == '' || password == '';  
    });
  }

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
        onChanged: (value) {
           _LoginPageState state = context.findAncestorStateOfType<_LoginPageState>();
           state.checkForm();
        },
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
        onChanged: (value) {
           _LoginPageState state = context.findAncestorStateOfType<_LoginPageState>();
           state.checkForm();
        },
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

    _LoginPageState state = context.findAncestorStateOfType<_LoginPageState>();

    return ElevatedButton(onPressed: state.isButtonDisabled ? null : () {
        String username = UsernameTextField.controller.text;
        String password = PasswordTextField.controller.text;
        
        
        if(username == 'admin' && password == 'admin') {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        }
        else {
          
          final snackbar = SnackBar(content: Text('Invalid username  / password'));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      }, 
      child: Text("Login"),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(state.isButtonDisabled ? Colors.grey : Colors.blue)
      ),
    );
  }

}