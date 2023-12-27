import 'package:flutter/material.dart';
import 'package:flutter1/CreateProducts.dart';
import 'package:flutter1/Profile.dart';
import 'package:flutter1/Register.dart';
import 'package:flutter1/home.dart';
import 'package:flutter1/login.dart';
import 'package:flutter1/searchProduct.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';


void main() {
  runApp( MyApp());
}

class AppState {
  final int _currentIndex;

  int get currentIndex => _currentIndex;

  AppState(this._currentIndex);

  AppState.initialState() : _currentIndex = 5;
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
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
           '/': (context) => home(),
          '/createProducts': (context) => createProductPage(),
          '/login':(context) => Loginpage(),
          '/register':(context) => Registerpage(),
        },
      ),
    );
  }
}
