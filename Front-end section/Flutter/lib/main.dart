import 'package:flutter/material.dart';
import 'package:flutter1/Mootaz/HomePage.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class AppState {
  final String _location;
  final String _time;

  String get location => _location;
  String get time => _time;

  AppState(this._location, this._time);

  AppState.initialState() : _location = "", _time = "00:00";

}

AppState reducer(AppState prev, dynamic action) {
  if (true) {
    return AppState(action.location, action.time);
  } else {
    return prev;
  }
}
class MyApp extends StatelessWidget {
  final store = Store(reducer,
      initialState: AppState.initialState(),
      middleware: [thunkMiddleware]);
      Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: Material(child: homePage(),));
  }
}
  

