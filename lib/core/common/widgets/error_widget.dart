import 'package:flutter/material.dart';


///[ AppErrorWidget ] is the widget reponsable for showing errors
/// use this widget when a failure is returned in the presentation layer
class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    super.key,
    required this.widget,
    required this.message,
    required this.errorTitle,
    required this.onRetryPressed,
  });
  final Widget widget;
  final String errorTitle;
  final String message;
  final VoidCallback onRetryPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.15,
          child: widget),
        Text(
          errorTitle,
          style: TextStyle(color: Theme.of(context).errorColor),
        ),
        Text(
          message,
          style: TextStyle(color: Theme.of(context).errorColor,
          ),
          textAlign: TextAlign.center,
        ),
       TextButton(onPressed:onRetryPressed,
        child: Text('Retry'))
      ],
    );
    
  }
}
