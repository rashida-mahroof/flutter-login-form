import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/home.dart';

class ScreenLogin extends StatefulWidget {
   ScreenLogin
({ Key? key }) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
final _usernameController = TextEditingController();

final _passwordController = TextEditingController();

final _formKey  = GlobalKey<FormState>();

bool _isDataMatched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Username',
                  ),
                  validator: (value){
                    // if (_isDataMatched)
                    // {
                    //   return null;
                    // }
                    // else{
                    //   return 'error';
                    // }
                    if(value == null || value.isEmpty){
                      return 'Value is Empty';
                    }else{
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Password',
                  ),
                  validator: (value){
                    // if (_isDataMatched)
                    // {
                    //   return null;
                    // }
                    // else{
                    //   return 'error';
                    // }
                     if(value == null || value.isEmpty){
                      return 'Value is Empty';
                    }else{
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [            
                    Visibility
                    (
                      visible:!_isDataMatched,
                      child: const Text('username or password does not match',style: TextStyle(color: Colors.red),)),
                    ElevatedButton.icon(onPressed: (){
                     if(_formKey.currentState!.validate())
                     {
                       checkLogin(context);
                     }else{
                       print('Data is empty');
                     }
                
                      //checkLogin(context);
                    }, 
                    icon: const Icon(Icons.check), 
                    label: const Text('Login')),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  void checkLogin(BuildContext ctx){
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if(_username == _password){
      print('username  and password matched');
      //goto home
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx1)=>screenHome()));
    }else{
      print('Username and password does not match');

      //snackbar
      final _errormsg = 'Username and pasword does not match';
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
          content: Text(_errormsg)));
      //alert dialogue
      showDialog(
        context: ctx, 
        builder: (ctx1){
        return AlertDialog(
          title: Text('error'),
          content: Text(_errormsg),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(ctx1).pop();
            }, child: Text('Close'))
          ],
        );
      });
      //show text
      setState(() {
        _isDataMatched = false;
      });
    }
    
  }
}