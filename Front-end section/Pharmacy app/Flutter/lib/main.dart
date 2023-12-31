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
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'ar']); // get last saved language
  // remove await if you want to get app default language
  runApp(MyApp());
}

Future<void> saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  return token;
}

class AppState {
  List cart;
  int currentIndex;
  int index;
  int indexPhoto;
  String token;
  Map warehouse;
  Map medicines;
  AppState({
    this.currentIndex = 0,
    this.index = 0,
    this.indexPhoto = 0,
    this.token = '',
    this.warehouse = const {},
    this.medicines = const {},
    this.cart = const [],
  });
}

class RegisterAction {
  final String url;
  final Map body;

  RegisterAction({required this.url, required this.body});
}

class addToCartAction {
  final String name;
  final String price;
  final List cart;

  addToCartAction(
      {required this.name, required this.price, required this.cart});
}

class GetWarehouseAction {
  final String url;
  final String? token;
  final Map warehouse;
  GetWarehouseAction(
      {this.url = '', this.token = '', this.warehouse = const {}});
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
  final int index;
  final int indexPhoto;
  NavClickAction({this.indexPhoto = 0, this.currentIndex = 0, this.index = 0});
}

class cartAction {
  final Map cart;

  cartAction({this.cart = const {}});
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
      String token = json.decode(response.body)['token'];
      await saveToken(token);
      next(LoginAction(token: token));
    } else {}
  } else if (action is GetWarehouseAction) {
    var response = await get(
      Uri.parse(action.url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${action.token}"
      },
    );
    if (response.statusCode == 200) {
      next(GetWarehouseAction(warehouse: json.decode(response.body)));
    } else {
      // handle error
    }
  } else {
    next(action);
  }
}

AppState reducer(AppState prev, dynamic action) {
  if (action is NavClickAction) {
    return AppState(
        currentIndex: action.currentIndex,
        index: action.index,
        indexPhoto: action.indexPhoto);
  } else if (action is LoginAction) {
    return AppState(token: action.token);
  } else if (action is GetWarehouseAction) {
    return AppState(warehouse: action.warehouse);
  } else if (action is addToCartAction) {
    action.cart.add({'name': "${action.name}", "price": "${action.price}"});
    print(action.cart);
    return AppState(cart: action.cart);
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
