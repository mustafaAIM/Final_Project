import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter1/CreateProducts.dart';
import 'package:flutter1/Profile.dart';
import 'package:flutter1/Register.dart';
import 'package:flutter1/home.dart';
import 'package:flutter1/login.dart';
import 'package:flutter1/searchProduct.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
  runApp(MyApp());
}

class AppState {
  int currentIndex;
  String token;
  Map data;
  AppState({
    this.currentIndex = 0,
    this.token = '',
    this.data = const {},
  });
}

class RegisterAction {
  final String url;
  final Map body;

  RegisterAction({required this.url, required this.body});
}

class FetchDataAction {
  final String url;
  final String token;
  final Map data;
  FetchDataAction({this.url = '', this.token = '', this.data = const {}});
}

class LoginAction {
  final String url;
  final Map body;
  final String token;
  LoginAction({
    this.url = '',
    this.body = const {},
    this.token = "",
  });
}

class NavClickAction {
  final int currentIndex;

  NavClickAction(this.currentIndex);
}



void DataMiddleware(Store store, action, NextDispatcher next) async {
  if (action is RegisterAction) {
    var response = await post(
      Uri.parse(action.url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(action.body),
    );

    print(response.body);
  } else if (action is LoginAction) {
    var response = await post(
      Uri.parse(action.url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(action.body),
    );

    if (response.statusCode == 200) {
      next(LoginAction(token: json.decode(response.body)['token']));
    } else {}
  } else if (action is FetchDataAction) {
    var response = await get(
      Uri.parse(action.url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${store.state.token}"
      },
    );
    if (response.statusCode == 200) {
      print("got dataaa: ${response.body}");
      next(FetchDataAction(data: json.decode(response.body)));
    } else {
      // handle error
    }
  }
}
AppState reducer(AppState prev, dynamic action) {
  if (action is NavClickAction) {
    return AppState(currentIndex: action.currentIndex);
  } else if (action is LoginAction) {
    return AppState(token: action.token);
  } else if (action is FetchDataAction) {
    return AppState(data: action.data);
  } else {
    return prev;
  }
}
class MyApp extends StatelessWidget {
  final store =
      Store(reducer, initialState: AppState(), middleware: [DataMiddleware]);
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/register',
        routes: {
          '/': (context) => home(),
          '/createProducts': (context) => createProductPage(),
          '/login': (context) => Loginpage(),
          '/register': (context) => Registerpage(),
        },
      ),
    );
  }
}
