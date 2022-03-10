import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();  

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
      
    }
    _formKey.currentState!.save();
    Navigator.pushNamed(context, '/');  
  }


  @override
  Widget build(BuildContext context) {
  final Size screenSize = MediaQuery.of(context).size;
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
          "Login to ShopClues",
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
                height: MediaQuery.of(context).size.width * 0.07,
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
                height: MediaQuery.of(context).size.width * 0.07,
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
                  else if(!value.contains("@")){
                    return "it should have @";
                  }
                  
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.07,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20 , vertical: 10)),
                  
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                onPressed: () => _submit(),
              ),
              ),
        
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.07,
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
                  Navigator.pushNamed(context, '/signin')
                },
              ),
              ),
              
            ],
          ),
        ),
      )
      
    );
  }
}

Widget inputFile({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      TextFormField(
        obscureText: obscureText,
         validator: (value) {  
              if (value == null) {  
                return 'Please enter some text';  
              }  
              return null;  
            },  
        decoration:InputDecoration(
          hintText: label,
          contentPadding: const EdgeInsets.symmetric(vertical: 0,
          horizontal: 10),
          enabledBorder:const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey
            ),

          ),
          
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
          )
        ),
      ),
      const SizedBox(height: 20,)
    ],
  );
}