import 'package:flutter/material.dart';
import 'package:anglican_lagos/common/color_utility.dart';

class LinearProgressBar extends StatefulWidget {
  @override
  _LinearProgressBarState createState() => _LinearProgressBarState();
}

class _LinearProgressBarState extends State<LinearProgressBar>  with SingleTickerProviderStateMixin{
  AnimationController _loadMoreAnimationController;

  @override
  void initState() {
    _loadMoreAnimationController =
        AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    _loadMoreAnimationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2.0,
      child: Center(
        child: LinearProgressIndicator(
          backgroundColor: ColorUtility.COLOR_PRIMARY,
          valueColor: ColorTween(
              begin: ColorUtility.WARNING,
              end: ColorUtility.COLOR_PRIMARY_DARK
          ).animate(
              CurvedAnimation(
                  parent: _loadMoreAnimationController,
                  curve: Interval(0.0, 1.0,
                      curve: Curves.fastOutSlowIn)
              )
          ),),
      ),
    );
  }
}
