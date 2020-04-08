import 'package:flutter/material.dart';
import 'package:anglican_lagos/uilayouts/custom_button.dart';
class MessageBox extends StatelessWidget {
 final VoidCallback onPressed;
 final double height;
 final String message;
 final IconData icon;
 final String buttonText;
 final IconData buttonIcon;

  const MessageBox(this.message, {this.height = 0.0, this.icon, this.onPressed, this.buttonText, this.buttonIcon});
  @override
  Widget build(BuildContext context){
    return Center(
      child: Card(
        elevation: 0.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: this.height > 0 ?
        Container(
          width: double.infinity,
          height: this.height,
          padding: EdgeInsets.all(20.0),
          child: _MessageBoxMessage(message, onPressed, icon, buttonText, buttonIcon,),
        ) :
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          child: _MessageBoxMessage(message, onPressed, icon,  buttonText,  buttonIcon,),
        ),
      ),
    );
  }
}
class _MessageBoxMessage extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final IconData icon;
  final String buttonText;
  final IconData buttonIcon;
  const _MessageBoxMessage(this.title, this.onPressed, this.icon, this.buttonText, this.buttonIcon);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            Icon(icon != null ? icon : Icons.message, size: 200.0, color: Colors.grey[400],),

            Padding(
              padding: const EdgeInsets.only(top: 40.0,bottom: 20.0),
              child: Text(title, style: TextStyle(color: Colors.black),),
            ),
            onPressed != null ? CustomButton(text: buttonText == null ? 'Retry' : buttonText, icon: buttonIcon == null ? Icons.refresh : buttonIcon, onPressed: onPressed) : Container(),
          ] ),
    );
  }
}
