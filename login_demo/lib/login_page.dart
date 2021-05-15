import 'package:flutter/material.dart';

enum FormType {
  login,
  register,
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  void validateAndSave() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      print('Form is valid, Email: $_email, Password: $_password');
    } else {
      print('form is invalid Email: $_email, Password: $_password');
    }
  }

  /*
                void validateAndSubmit() async{
                  if(validateAndSave()){
                    try{
                      if(_formType==FormType.login){}
                      FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email,password:_password);
                      print('signed in ${user.uid}');
                    }
                    else{
                      FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email,password:_password);
                      print('Register user ${user,uid}');
                    }
                    }
                    catch(e){
                      print('Error:$e');
                    }
                  }
                }
  */

  void moveToRegister() {
    formkey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formkey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('flutter login demo'),
        ),
        body: new Container(
            padding: EdgeInsets.all(20.0),
            child: new Form(
              key: formkey,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: buildInputs() + buildSubmitbuttons(),
              ),
            )));
  }

  List<Widget> buildInputs() {
    return [
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitbuttons() {
    if (_formType == FormType.login) {
      return [
        new RaisedButton(
          child: new Text('Login', style: new TextStyle(fontSize: 20.0)),
          onPressed: validateAndSave,
        ),
        new FlatButton(
          onPressed: moveToRegister,
          child: new Text('Create an Acount',
              style: new TextStyle(fontSize: 20.0)),
        )
      ];
    } else {
      return [
        new RaisedButton(
          child: new Text('Create an Acount',
              style: new TextStyle(fontSize: 20.0)),
          onPressed: validateAndSave,
        ),
        new FlatButton(
          onPressed: moveToLogin,
          child: new Text('Already have an Acount? Login',
              style: new TextStyle(fontSize: 20.0)),
        )
      ];
    }
  }
}
// class LoginPage extends StatefulWidget {
//   @override
//    LoginPageState createState() =>  LoginPageState();
// }



// class LoginPageSate extends State<LoginPage> {
 
// }
