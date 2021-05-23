import 'package:flutter/material.dart';

enum ButtonSize { Small, Large }

class AjoOnlineButton extends StatelessWidget {
  Widget child;
  Color color;
  Function onPressed;
  AjoOnlineButton(
      {@required this.child,
      this.color = Colors.grey,
      @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: color.withOpacity(.5),
      onTap: () => onPressed(),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: child,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                  color: color == Colors.white
                      ? Colors.black
                      : color.withOpacity(.5),
                  offset: Offset(0, 2),
                  spreadRadius: 1,
                  blurRadius: 5)
            ]),
      ),
    );
  }
}
