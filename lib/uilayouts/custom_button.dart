import 'package:flutter/material.dart';
import 'package:anglican_lagos/common/color_utility.dart';

enum ButtonType{
  Primary,
  Success,
  Danger,
  Warning,
  Info,
  White
}

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final List<BoxShadow> boxShadow;
  final ButtonType buttonType;
  CustomButton({@required this.text, @required this.onPressed, this.boxShadow,
  this.icon, this.buttonType}) : assert(text != null), assert(onPressed != null);
  @override
  Widget build(BuildContext context){
    LinearGradient gradient = ColorUtility.PRIMARY_GRADIENT;
    if(buttonType != null && buttonType == ButtonType.Primary){
      gradient = ColorUtility.PRIMARY_GRADIENT;
    }
     if(buttonType != null && buttonType == ButtonType.Success){
      gradient = ColorUtility.SUCCESS_GRADIENT;
    }
    if(buttonType != null && buttonType == ButtonType.Warning){
      gradient = ColorUtility.WARNING_GRADIENT;
    }
    if(buttonType != null && buttonType == ButtonType.Danger){
      gradient = ColorUtility.DANGER_GRADIENT;
    }
    if(buttonType != null && buttonType == ButtonType.Info){
      gradient = ColorUtility.INFO_GRADIENT;
    }
    if(buttonType != null && buttonType == ButtonType.White){
      gradient = ColorUtility.WHITE_GRADIENT;
    }
    return Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        gradient: gradient,
        boxShadow: boxShadow
      ),
      child: MaterialButton(
          highlightColor: Colors.transparent,
          splashColor: ColorUtility.COLOR_PRIMARY_DARK,
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children:
              <Widget>[
                icon != null ?
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(icon, color: buttonType != null && buttonType == ButtonType.White? Colors.black : Colors.white,),
                ) : Container(),
                Text(
                  text.toUpperCase(),
                  style: TextStyle(
                      color: buttonType != null && buttonType == ButtonType.White? Colors.black : Colors.white,
                      fontFamily: "WorkSansBold",  ),
                )
              ],
            ),
          ),
          onPressed: onPressed
      ),
    );
  }
}