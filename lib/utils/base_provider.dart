import 'package:flutter/cupertino.dart';
import 'package:kairomarket/AllOurProductsPage/models/UserProfileModel.dart';

class BaseProvider extends ChangeNotifier {
  BuildContext context;
  ActionState _actionState;

  set setActionState(ActionState actionState) {
    _actionState = actionState;
    notifyListeners();
  }

  ActionState get getActionState => _actionState;
  ActionStatus get getActionStatus => getActionState.actionStatus;
  String get getActionMessage => getActionState.message;

  void backToLoading({message}) {
    setActionState =
        ActionState(actionStatus: ActionStatus.Loading, message: message);
  }

  void backToLoaded() {
    setActionState =
        ActionState(actionStatus: ActionStatus.Loaded, message: '');
  }

  void backToInProgress({message}) {
    setActionState =
        ActionState(actionStatus: ActionStatus.InProgress, message: message);
  }

  void backToFailed({message}) {
    setActionState =
        ActionState(actionStatus: ActionStatus.Failed, message: message);
  }

  void backToSuccess({message}) {
    setActionState =
        ActionState(actionStatus: ActionStatus.Success, message: message);
  }

  void backToInfo({message}) {
    setActionState =
        ActionState(actionStatus: ActionStatus.Info, message: message);
  }

  bool isLoading() {
    return [ActionStatus.Loading, ActionStatus.InProgress]
        .contains(_actionState.actionStatus);
  }

  BaseProvider() {
    backToLoading(message: 'Loading...');
  }
}

class ActionState {
  ActionStatus actionStatus;
  String message;

  ActionState({this.actionStatus, this.message});
}

enum ActionStatus { Loading, Loaded, InProgress, Failed, Success, Info }
