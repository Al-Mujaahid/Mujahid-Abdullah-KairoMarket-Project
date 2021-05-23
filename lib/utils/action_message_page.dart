import 'package:kairomarket/utils/base_provider.dart';
import 'package:flutter/material.dart';

class ActionMessagePage extends StatelessWidget {
  ActionState actionState;
  ActionMessagePage({this.actionState});

  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    if ([ActionStatus.Info, ActionStatus.Loading, ActionStatus.InProgress]
        .contains(actionState.actionStatus))
      color = Colors.blue.withOpacity(.5);
    else if ([ActionStatus.Failed].contains(actionState.actionStatus))
      color = Colors.red.withOpacity(.5);
    else if ([ActionStatus.Success].contains(actionState.actionStatus))
      color = Colors.green.withOpacity(.5);

    return [ActionStatus.Loaded].contains(actionState.actionStatus)
        ? Container()
        : Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Text('${actionState.message}'),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: color.withOpacity(.5),
                      offset: Offset(0, 2),
                      spreadRadius: 1,
                      blurRadius: 5)
                ]),
            padding: const EdgeInsets.symmetric(vertical: 10),
            margin: const EdgeInsets.symmetric(
              vertical: 10,
            ),
          );
  }
}
