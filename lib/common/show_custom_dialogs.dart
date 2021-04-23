import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ShowCustomDialogs {
 static void showAlert({@required BuildContext context, @required String content, String title: '',
      String onPressedButtonTitle : 'Ok', VoidCallback onPressed }){
var dialog = AlertDialog(title: title == '' ? null : Text(title, style: TextStyle(color: Colors.black )), content: Text(content, style: TextStyle(color: Colors.black )),
actions: <Widget>[
  FlatButton(child: Text(onPressedButtonTitle, style: TextStyle(color: Colors.red )), onPressed:  (){
    if(onPressed != null) {
      onPressed();
    }
    if(Navigator.of(context).canPop()) {
      Navigator.pop(context);
    }
   }
      ,)
],);
showDialog(context:context, builder: (BuildContext context) => dialog);
  }
 static void showAlertWithMultipleActions({@required BuildContext context, @required String content,
 @required List<FlatButton> actions, String title: '',  barrierDismissible: true, }){
   var dialog = AlertDialog(title: title == '' ? null : Text(title, style: TextStyle(color: Colors.black )), content: Text(content, style: TextStyle(color: Colors.black )),
     actions: actions,);
   showDialog(context:context, barrierDismissible: barrierDismissible, builder: (BuildContext context) => dialog);
 }

static void showBottomSheet({@required BuildContext context, @required Widget child} ){
showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
              return child;
            });
}
  static void showSnackBar(
      {@required GlobalKey<ScaffoldState> scaffoldStateKey,
       @required String content,  String actionTitle : 'OK', VoidCallback onPressed, } ){
    scaffoldStateKey.currentState?.removeCurrentSnackBar();
    scaffoldStateKey.currentState?.showSnackBar(new SnackBar(
                  content: Container(
                    child: new Text(content,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: "WorkSansSemiBold"
                      ),
                    ),
                  ),
                  duration: Duration(seconds: 5),
                  action: new SnackBarAction(
                    label: actionTitle,
                    onPressed: (){
                      if(onPressed != null)
                      onPressed();
                    }
                  ),
                ));
}

static void showProgressDialog({@required BuildContext context, String content:'Loading. wait...', bool cancelable: true} ){
  showDialog(context: context, barrierDismissible: cancelable, builder: (context){
   return Dialog(
     child: Container(
       padding: EdgeInsets.all(10.0),
     child: Row(
         mainAxisSize: MainAxisSize.min,
         children: [
           Container(child: CircularProgressIndicator(), width: 20.0, height: 20.0,),
           Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              child: /*Text(content.length > 16 ? content.substring(0, 16) + '...' : content,
                style: TextStyle(color: Theme.of(context).accentColor), maxLines: 2,),*/
              Text(content,
                style: TextStyle(color: Theme.of(context).accentColor), maxLines: 2,),
            ),
           )
         ],
     ),
   ),
   );
 });
}

 Flushbar _flushBar;
  Flushbar showFlushbar({@required BuildContext context, @required String message,
   String title, IconData icon, Duration duration, String buttonTitle, VoidCallback onButtonPressed,
    Color color} )
     {
       assert(context != null);
       assert(message != null);
       dismissFlushBar();
        _flushBar = Flushbar<bool>(message: message, title: title, duration: duration,
       icon: Icon(
         icon != null ? icon : Icons.info_outline,
         color: color != null ? color : Colors.red,
       ),
   mainButton:
   FlatButton(
     onPressed: () {
       dismissFlushBar();
      if(onButtonPressed != null)
        onButtonPressed();
     },
     child: Text(
       buttonTitle != null ?  buttonTitle : 'Close',
       style: TextStyle(color: Colors.amber),
     ),
   )
   ,isDismissible: true,); // <bool> is the type of the result passed to dismiss() and collected by show().then((result){})
   _flushBar.show(context);

   return _flushBar;
}

void dismissFlushBar(){
    if(_flushBar != null)
  _flushBar.dismiss();
}

static void dismissProgressDialog(BuildContext context){
 if(Navigator.of(context).canPop())
 Navigator.of(context).pop();
}
}
