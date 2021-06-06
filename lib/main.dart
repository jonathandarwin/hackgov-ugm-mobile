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

    /**
     * When setState() is called, 
     * it will render all the children widget below this state. 
     * Means that the entire page will be re-rendered.
     * 
     * Best Practice : put the statefull widget as deep as possible
     * To prevent re-render unnecessary widget, 
     * for example FlutterIcon (FlutterIcon doesn't need to be rendered over and over again)
     */ 

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

        // The purpose of using onChanged is to trigger the checkForm in LoginState()
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

        // The purpose of using onChanged is to trigger the checkForm in LoginState()
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
          // Navigate to Home Page with 'Replace Strategy'
          // Means that the Login Page will be disappear and
          // Home Page will be shown up.

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        }
        else {
          final snackbar = SnackBar(content: Text('Invalid username  / password'));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      }, 
      child: Text("Login"),
      style: ButtonStyle(
        // Decide the button background color by looking at the isButtonDisabled value.
        // isButtonDisabled value will be determined by the value inside username and password text field.

        backgroundColor: MaterialStateProperty.all(state.isButtonDisabled ? Colors.grey : Colors.blue)
      ),
    );
  }

}