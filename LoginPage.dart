import 'package:flutter/material.dart';
import 'SinginPage.dart';
import 'categori.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: Colors.blue),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: LoginUI(),
    );
  }

  Widget LoginUI() {
    return Padding(
      padding: EdgeInsets.only(left: 5, top: 10, right: 5),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 15, 20),
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.blue, fontSize: 20),
                        icon: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.blue,
                          ),
                        )),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  elevation: 20,
                  borderRadius: BorderRadius.circular(30),
                  shadowColor: Colors.blue[100],
                ),
                SizedBox(
                  height: 30,
                ),
                Material(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 15, 20),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.blue, fontSize: 20),
                        icon: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                        )),
                    obscureText: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  elevation: 20,
                  borderRadius: BorderRadius.circular(30),
                  shadowColor: Colors.blue[100],
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Material(
                    elevation: 20,
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.purple[400],
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainMaterial()));
                      },
                      child: Container(
                        height: 60,
                        child: Center(
                            child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Dont have an account?",style: TextStyle(fontSize: 16),),
                      SizedBox(
                        width: 5,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()));
                          },
                          child: Text("Sing Up",style: TextStyle(fontSize: 16,),))
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
