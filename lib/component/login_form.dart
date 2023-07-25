


import 'package:event_scanner_app/provider/auth_provider.dart';
import 'package:event_scanner_app/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String _username = '';
  String _password = '';

  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(31.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration:const InputDecoration(
                hintText: 'Enter username',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please enter your username';
                }
                return null;
              },
              onSaved: (value){
                _username = value!;
              },
            ),

            const SizedBox(height: 32,),
      
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Enter the password',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none
                ),
                filled: true,
                fillColor: Colors.white,

              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please enter your password';
                }
                return null;
              },
              onSaved: (value){
                _password = value!;
              },
            ),
      
            TextButton(onPressed: (){}, child: Text("Forgot Password ?", style: TextStyle(color: Colors.red),)),
            
            const SizedBox(height: 40,),


            SizedBox(
              width: double.infinity,
              child: Consumer<AuthProvider>(
                builder: (context, auth, child) {
                  // WidgetsBinding.instance.addPostFrameCallback((_) {
                  //   if (auth.resMessage != '') {
                  //     // showSuccessMessage(context, message: auth.resMessage);
                  //   }
                  // });

                  return ElevatedButton(
                    
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Perform login or sign-up logic with _username and _password

                        // showMessage(context, message: "Logging in");

                        print("UserName: $_username:: Password: $_password");

                        debugPrint("UserName: $_username :: Password: $_password");

                        // setState(() {
                        //   status = true;
                        // });
                        


                        setState(() {
                          status = !status;
                        });

                        

                        auth.loginUser(username: _username.trim(), password: _password.trim(), context: context );


                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => ActivityPage()),
                        // );

                        // handleLogin();
                      }else{
                        showErrorMessage(context, message:"Login Failed");
                      }
                    },
                    style: TextButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Colors.white),
                      ),
                    ),

                    child: Text(
                      status == false ?
                      "Sign In" : "Please wait..."
                    ),
                  );
                },
              ),
            ),


          ],
        ),
      )
    );
  }

  void handleLogin() async{
    final isSuccess = await AuthProvider.userLogin(body);

    print("IS SUCCESSFUL:: $isSuccess");

    // showMessage(context, message: "Logging In");

    // if(isSuccess){
    //   showMessage(context, message: "Login Successful");

    //   Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => ActivityPage())
    //   );

    // }else{
    //   showErrorMessage(context, message: "Invalid Credentials");
    // }
  }



  Map get body{
    return {
      "username":_username,
      "password":_password
    };
  }
}