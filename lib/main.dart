import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/home.dart';

import 'main_provider.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: ChangeNotifierProvider(
            create: (context) => MainProvider(),
            child: Column(
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

  // static TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    MainProvider provider = Provider.of<MainProvider>(context, listen: false);

    return Container(
      margin: EdgeInsets.only(left: 24.0, right: 24.0, top: 32.0, bottom: 16.0),
      child: TextField(
        // controller: controller,
        onChanged: (value) {
          provider.username = value;
          provider.determineButtonState();
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

  // static TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    MainProvider provider = Provider.of<MainProvider>(context, listen: false);

    return Container(
      margin: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 32.0),
      child: TextField(
        // controller: controller,
        onChanged: (value) {
          provider.password = value;
          provider.determineButtonState();
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
    return Consumer<MainProvider>(
        builder: (context, provider, child) {
              return ElevatedButton(onPressed: () {
                if(!provider.isButtonDisabled) {
                  String username = provider.username;
                  String password = provider.password;
                    
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
                }
            }, 
            child: Text("Login"),
            style: ButtonStyle(
              // Decide the button background color by looking at the isButtonDisabled value.
              // isButtonDisabled value will be determined by the value inside username and password text field.

              backgroundColor: MaterialStateProperty.all(provider.isButtonDisabled ? Colors.grey : Colors.blue)
            ),
          );
        },
    );
  }

}