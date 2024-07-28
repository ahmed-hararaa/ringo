import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';
import 'package:flutter_dev_test/cells/oauth_cell.dart';
import 'package:flutter_dev_test/components/ringo_button.dart';
import 'package:flutter_dev_test/components/ringo_text_field.dart';
import 'package:flutter_dev_test/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  var _valid = false;

  void _allowLogin(){
    setState(() {
      _valid = _email.text.isNotEmpty && _password.text.isNotEmpty;
    });
  }

  void _login() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (c) => MainPage()
    ));
  }

  @override
  void initState() {
    super.initState();
    _email.addListener((){
      _allowLogin();
    });
    _password.addListener((){
      _allowLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Login", style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text("Sign in with your account", style: textTheme.labelMedium?.copyWith(color: theme.neutral[600]),),
              SizedBox(height: 40,),
              RingoTextField(
                controller: _email,
                label: "Username / Email",
              ),
              SizedBox(height: 30,),
              RingoTextField(
                label: "Password",
                obscureText: true,
                controller: _password,
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: (){}, child: Text("Forget password?", style: TextStyle(fontWeight: FontWeight.bold))),
              ),
              RingoButton.large(child: Text("Login"), onPressed: _valid ? _login : null, expand: true,),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.center,
                child: Text("Or login with account", style: textTheme.labelMedium?.copyWith(color: theme.neutral[600]),),
              ),
              SizedBox(height: 20,),
              OauthCell(text: "Google", image: "images/google.png",),
              SizedBox(height: 10,),
              OauthCell(text: "Facebook", image: "images/facebook.webp",),
              SizedBox(height: 10,),
              OauthCell(text: "Apple", image: "images/apple.webp",),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: textTheme.labelLarge?.copyWith(color: theme.neutral[600]),),
                  TextButton(onPressed: (){}, child: const Text("Register here", style: TextStyle(fontWeight: FontWeight.bold),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
