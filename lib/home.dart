import 'package:flutter/material.dart';

// ignore: camel_case_types
class screenHome extends StatelessWidget {
  const screenHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Hoky'),
      ),
      body:  SafeArea(
        child: Column(            
          children: const [
            Center(
              child: Icon(
                Icons.note_add_rounded,
                color: Colors.red,
                size: 70,
              ),
              
            ),
           
            Text('Tasks'),
             SizedBox(
              height: 40,
            ),
            Center(
              child: Icon(
                Icons.approval_rounded,
                color: Colors.green,
                size: 70,
              ),
              
            ),
            
            Text('Approvals'),
             SizedBox(
              height: 40,
            ),
            Center(
              child: Icon(
                Icons.notifications_active_rounded,
                color: Colors.orange,
                size: 70,
              ),
              
            ),
            Text('Notifications')
            ],
        ),
      
    ));
  }
}