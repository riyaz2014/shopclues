import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({ Key? key }) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
   var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.blue,
          ),
          elevation: 0.4,
          title:const Text(
          "SignUp to ShopClues",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),


      body: Container(
        margin:const EdgeInsets.fromLTRB(25, 40, 25, 0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/Shopclues_logo.jpg',
                scale: 1,
              ),
              //styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-Mail'),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (value) {
                  if (value == null || value.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },
              ),
              //box styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              //text input 
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {},
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a valid password!';
                  }
                  else if(value.length < 8){
                    return "atleast 8 character is required";
                  }
                  else if(value.contains("@")){
                    return "it should have @";
                  }
                  
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
                 SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20 , vertical: 10)),
                    
                  ),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                  onPressed: () => {
                    Navigator.pushNamed(context, '/home')
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






