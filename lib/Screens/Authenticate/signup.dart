import 'package:deezer/Screens/Authenticate/login.dart';
import 'package:deezer/Services/auth.dart';
import 'package:deezer/Shared/loading.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();

  var _gender = ['Gender', 'Male', 'Female'];

  var _currentSelectedGender = 'Gender';
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String username = "";
  String message = "";
  
  bool loading = false;
  bool _isHidden = true;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        body: Form(
          key: _formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Hello! Sign up:",
                style: TextStyle(fontSize: 22.0),
              ),
              SizedBox(
                height: 45.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 2.0, bottom: 2.0),
                    color: Colors.blue.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "f",
                          style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 18.0,
                        ),
                        Text(
                          "Facebook",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  OutlineButton(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 17.0, top: 3.0, bottom: 3.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    highlightedBorderColor: Colors.white70,
                    highlightColor: Colors.black12,
                    highlightElevation: 2.0,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage("lib/images/google.png"),
                          width: 36.0,
                          height: 36.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Google",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black54,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "or",
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                  validator: (val) => val.isEmpty ? "Enter an email" : null,
                  cursorColor: Colors.black45,
                  style: TextStyle(fontSize: 18.0),
                  decoration: InputDecoration(
                    labelText: "Email",
                    contentPadding: EdgeInsets.only(bottom: 0.0, top: 0.0),
                    labelStyle: TextStyle(color: Colors.black45),
                  ),
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
              SizedBox(height: 10.0),
              TextFormField(
                  validator: (val) => val.length < 6
                      ? "Password must be at least 6 characters"
                      : null,
                  obscureText: _obscureText,
                  cursorColor: Colors.black45,
                  style: TextStyle(fontSize: 18.0),
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    labelText: "Password",
                    contentPadding: EdgeInsets.only(bottom: 0.0, top: 0.0),
                    labelStyle: TextStyle(color: Colors.black45),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isHidden = !_isHidden;
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _isHidden ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
              SizedBox(height: 10.0),
              TextFormField(
                  // validator: (val) => val.isEmpty ? "Enter username" : null,
                  cursorColor: Colors.black45,
                  style: TextStyle(fontSize: 18.0),
                  decoration: InputDecoration(
                    labelText: "Username",
                    contentPadding: EdgeInsets.only(bottom: 0.0, top: 0.0),
                    labelStyle: TextStyle(color: Colors.black45),
                  ),
                  onChanged: (val) {
                    setState(() => username = val);
                  },
                ),
              SizedBox(height: 10.0),
              // Row(
              //   children: <Widget>[
              //     Expanded(
              //         child: TextFormField(
              //           // validator: (val) => val.isEmpty ? "Enter Age" : null,
              //       cursorColor: Colors.black45,
              //       keyboardType: TextInputType.numberWithOptions(),
              //       decoration: InputDecoration(
              //           border: InputBorder.none,
              //           labelText: "Age",
              //           labelStyle:
              //               TextStyle(color: Colors.black45, fontSize: 18.0)),
              //     )),
              //     Divider(
              //       height: 16.0,
              //       color: Colors.pinkAccent,
              //     ),
              //     Expanded(
              //         child: DropdownButton<String>(
              //       elevation: 8,
              //       isExpanded: true,
              //       items: _gender.map((String userGender) {
              //         return DropdownMenuItem<String>(
              //           value: userGender,
              //           child: Text(userGender),
              //         );
              //       }).toList(),
              //       onChanged: (String newGenderSelected) {
              //         setState(() {
              //           this._currentSelectedGender = newGenderSelected;
              //         });
              //       },
              //       value: _currentSelectedGender,
              //     ))
              //   ],
              // ),
              SizedBox(
                height: 40.0,
              ),
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 57.0, vertical: 16.0),
                color: Colors.pinkAccent.shade100,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() => loading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null){
                      setState((){
                        message = "Invalid Email/Password";
                        print("Could not register");
                        loading = false;
                      });
                    }else{
                      setState(() {
                        Navigator.of(context).pop();
                        message = "Invalid Email/Password";
                      });
                    }
                  }
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                message,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "By clicking 'Sign Up', you accept the General Conditions of use.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black45),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
