import 'package:flutter/material.dart';

class Notedelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('warning'),
      content: Text('Are you sure you want to delete this note?'),
      actions: [
        FlatButton(onPressed: (){
          Navigator.of(context).pop(true);
        }, 
        child: Text('Yes')),
        FlatButton(onPressed: (){
          Navigator.of(context).pop(false);
        }, 
        child: Text('No'))
      ],
    );
  }
}