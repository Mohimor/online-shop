import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'categori.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.blue),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SignupUI(),
    );
  }

  Widget SignupUI() {
    return Padding(
      padding: EdgeInsets.only(left: 5, top: 10, right: 5),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Create Your account",style: TextStyle(fontSize: 17,color: Colors.grey[600]),),
                SizedBox(height: 20,),
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
                ),SizedBox(
                  height: 30,
                ),
                Material(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 15, 20),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.blue, fontSize: 20),
                        icon: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.email_rounded,
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
                ),SizedBox(
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
                  height: 30,
                ),
                Material(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 15, 20),
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(color: Colors.blue, fontSize: 20),
                        icon: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.password,
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
                              "Sign up",
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
                      Text("Already have an account?",style: TextStyle(fontSize: 16),),
                      SizedBox(
                        width: 5,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text("Login",style: TextStyle(fontSize: 16,),))
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
