
import 'package:anglican_lagos/modules/home_page.dart';
import 'package:flutter/material.dart';


class AppEntryPage extends StatefulWidget {
  @override
  _AppEntryPageState createState() => _AppEntryPageState();
}

class _AppEntryPageState extends State<AppEntryPage> with SingleTickerProviderStateMixin{
   @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    /// Make the entire ListView have the ability to get rect.
    return Material(
      child: new HomePage(),
    );
  }


}

