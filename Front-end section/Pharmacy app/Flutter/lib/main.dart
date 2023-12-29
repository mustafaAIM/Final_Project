import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter1/Mootaz/HomePage.dart';
import 'package:flutter1/Mootaz/bottomNav.dart';
import 'package:flutter1/Mootaz/cartPage.dart';
import 'package:flutter1/Mootaz/categoryPage.dart';
import 'package:flutter1/Mootaz/favorite.dart';
import 'package:flutter1/Mootaz/itemInfoPage.dart';
import 'package:flutter1/mootaz/splashScreen.dart';
import 'package:flutter1/mootaz/warehousePage.dart';
import 'package:flutter1/mootaz/welcome.dart';
import 'package:flutter1/yazan/home.dart';
import 'package:flutter1/yazan/orderDetailsPage.dart';
import 'package:flutter1/yazan/reports.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter1/yazan/login.dart';
import 'package:flutter1/yazan/Register.dart';
import 'package:flutter1/yazan/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'ar']); // get last saved language
  // remove await if you want to get app default language
  runApp(MyApp());
}

class AppState {
  int currentIndex;
  String token;
  final bool isLoading;
  Map<dynamic,dynamic> Warehouses;

  AppState(
      {this.isLoading = true,this.currentIndex = 0, this.token = '', this.Warehouses = const {}});
}


class NavClickAction {
  final int currentIndex;

  NavClickAction(this.currentIndex);
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

class getWarehousesAction {
  final String url;
  final Map Warehouses;
  

  getWarehousesAction({
    this.url = '',
    this.Warehouses = const {},
  });
}

class RegisterAction {
  final String url;
  final Map body;

  RegisterAction({required this.url, required this.body});
}

void DataMiddleware(Store store, action, NextDispatcher next) async {
  if (action is RegisterAction) {
    var response = await post(
      Uri.parse(action.url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(action.body),
    );
    
  } else if (action is LoginAction) {
    var response = await post(
      Uri.parse(action.url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(action.body),
    );

    if (response.statusCode == 200) {
      next(LoginAction(token: json.decode(response.body)['token']));
    } else {}
  } else if (action is getWarehousesAction) {
    print("token: ${store.state.token}");

    var response = await get(
      Uri.parse(action.url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${store.state.token}',
      },
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, then parse the JSON.
      print('Response body: ${response.body}');
      next(getWarehousesAction(Warehouses: json.decode(response.body)));
    } else {
      print('Response body: ${response.body}');
      // If the server returns an unsuccessful response code, then throw an exception.
      // throw Exception('Failed to load data');
    }
  }
}

AppState reducer(AppState prev, dynamic action) {
  if (action is NavClickAction) {
    return AppState(currentIndex: action.currentIndex);
  } else if (action is LoginAction) {
    return AppState(token: action.token);
  } else if (action is getWarehousesAction) {
    return AppState(Warehouses: action.Warehouses);
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
        child: LocaleBuilder(
          builder: (locale) => MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: Locales.delegates,
            supportedLocales: Locales.supportedLocales,
            locale: locale,
            initialRoute: '/',
            routes: {
              '/': (context) => splashPage(),
              '/welcome': (context) => welcomePage(),
              '/home': (context) => home(),
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
        ));
  }
}