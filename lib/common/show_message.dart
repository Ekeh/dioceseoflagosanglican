import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:anglican_lagos/common/color_utility.dart';
import 'package:anglican_lagos/uilayouts/custom_button.dart';
class PositiveButton{
  final String title;
  final IconData icon;
  final VoidCallback onClick;
  PositiveButton({@required this.title, @required this.onClick, this.icon});
}
class NegativeButton{
  final String title;
  final IconData icon;
  final VoidCallback onClick;
  NegativeButton({@required this.title, @required this.onClick, this.icon});
}
class NeutralButton{
  final String title;
  final IconData icon;
  final VoidCallback onClick;
  NeutralButton({@required this.title, @required this.onClick, this.icon});
}
class ShowMessage {
  static Widget success(
      {@required BuildContext context, @required String message, VoidCallback onClose}) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      //margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: ColorUtility.SUCCESS,
        border: Border.all(
            width: 1.0,
          color: ColorUtility.SUCCESS_DARK
        ),
        /*borderRadius: BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
        ),*/
      ),
      child: Row(
        children: <Widget>[
          Expanded(child: Text(message, style: TextStyle(color: Colors.white),)),
          InkWell(child: Icon(FontAwesomeIcons.times, color: Colors.white), onTap: onClose,)
        ],
      ),
    );
  }
  static Widget error({@required BuildContext context, @required String message, VoidCallback onClose}) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: ColorUtility.DANGER,
        border: Border.all(
            width: 1.0,
            color: ColorUtility.DANGER_DARK
        ),
        /*borderRadius: BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
        ),*/
      ),
      child: Row(
        children: <Widget>[
          Expanded(child: Text(message, style: TextStyle(color: Colors.white),)),
          InkWell(child: Icon(FontAwesomeIcons.times, color: Colors.white), onTap: onClose,)
        ],
      ),
    );
  }
  static Widget fullPageAlert({
    @required BuildContext context,
    @required String message,
     String title,
    IconData icon,
    PositiveButton positiveButton,
    NegativeButton negativeButton,
    NeutralButton neutralButton}) {
    return SingleChildScrollView(
      child: Center(
        child: Card(
          elevation: 0.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                (icon != null) ?
                Padding(
                    padding: EdgeInsets.only(bottom: 30.0, top: 30.0),
                    child: Icon(icon != null ? icon : FontAwesomeIcons.cloud, size: 100.0, color: Colors.grey[600],)
                ) : Container(),

            (title != null) ?
            Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child:Text(title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.grey[600]),)
            ) : Container(),
                Text(message, style: TextStyle(color: Colors.grey[600])),
                (positiveButton?.title != null && positiveButton?.onClick != null) ?
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: CustomButton(text: positiveButton.title, buttonType: ButtonType.Success, icon: positiveButton.icon, onPressed: positiveButton.onClick),
                ) : Container(),

                (negativeButton?.title != null && negativeButton?.onClick != null) ?
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CustomButton(text: negativeButton.title,  buttonType: ButtonType.Danger, icon: negativeButton.icon, onPressed: negativeButton.onClick),
                ) : Container(),
                Padding(padding: EdgeInsets.only(top: 20.0)),

                (neutralButton?.title != null && neutralButton?.onClick != null) ?
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CustomButton(text: neutralButton.title,  buttonType: ButtonType.Info, icon: neutralButton.icon, onPressed: neutralButton.onClick),
                ) : Container(),
                Padding(padding: EdgeInsets.only(top: 0.0)),
              ] ,
            ),
          ),
        ),
      ),
    );


  }
}