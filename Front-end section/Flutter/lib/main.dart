import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter1/yazan/login.dart';
import 'package:flutter1/yazan/Register.dart';
import 'package:flutter1/yazan/profile.dart';

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

  AppState.initialState()
      : _location = "",
        _time = "00:00";
}

class FetchTimeAction {
  final String location = "";
  final String time = "";
}

AppState reducer(AppState prev, dynamic action) {
  if (action is FetchTimeAction) {
    return AppState(action.location, action.time);
  } else {
    return prev;
  }
}

class MyApp extends StatelessWidget {
  final store = Store(reducer,
      initialState: AppState.initialState(), middleware: [thunkMiddleware]);
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        initialRoute: '/register',
        routes: {
          '/': (context) => Loginpage(),
          '/register': (context) => ProfilePage(),
        },
      ),
    );
  }
}
