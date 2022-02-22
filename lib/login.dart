import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenLogin extends StatefulWidget {
   ScreenLogin
({ Key? key }) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
final _usernameController = TextEditingController();

final _passwordController = TextEditingController();

bool _isDataMatched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Username',
                ),
                
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Password',
                ),
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
                    checkLogin(context);
                  }, 
                  icon: const Icon(Icons.check), 
                  label: const Text('Login')),
                ],
              )
            ],
          ),
        ),
      )
    );
  }

  void checkLogin(BuildContext ctx){
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if(_username == _password){
      //goto home
    }else{
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