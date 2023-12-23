import 'package:flutter/material.dart';
import 'package:flutter1/Mootaz/HomePage.dart';
import 'package:flutter1/Mootaz/bottomNav.dart';
import 'package:flutter1/Mootaz/cartPage.dart';
import 'package:flutter1/Mootaz/categoryPage.dart';
import 'package:flutter1/Mootaz/favorite.dart';
import 'package:flutter1/Mootaz/itemInfoPage.dart';
import 'package:flutter1/yazan/home.dart';
import 'package:flutter1/yazan/orderDetailsPage.dart';
import 'package:flutter1/yazan/reports.dart';
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
          '/item': (context) => itemInfoPage(),
          '/categoryPage': (context) => categoryPage(),
          '/homePage': (context) => homePage(),
          '/cartPage': (context) => cartPage(),
          '/reportsPage': (context) => reportsPage(),
          '/ProfilePage': (context) => ProfilePage(),
          '/favoritePage': (context) => favoritePage(),
          '/orderDetails': (context) => orderDetailsPage(),
          '/login': (context) => Loginpage(),
          '/register': (context) => Registerpage(),
        },
      ),
    );
  }
}