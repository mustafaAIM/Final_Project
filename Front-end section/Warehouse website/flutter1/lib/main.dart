import 'package:flutter/material.dart';
import 'package:flutter1/CreateProducts.dart';
import 'package:flutter1/home.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class AppState {
  final int _currentIndex;

  int get currentIndex => _currentIndex;

  AppState(this._currentIndex);

  AppState.initialState() : _currentIndex = 0;
}

class NavClickAction {
  final int currentIndex;

  NavClickAction(this.currentIndex);
}

AppState reducer(AppState prev, dynamic action) {
  if (action is NavClickAction) {
    return AppState(action.currentIndex);
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
        initialRoute: '/',
        routes: {
           '/': (context) => home(),
        },
      ),
    );
  }
}
