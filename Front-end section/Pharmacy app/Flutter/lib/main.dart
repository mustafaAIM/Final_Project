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
  int currentIndex;
  // int thisIndex;
  String token;
  Map warehouse;
  // Map medicines;
  AppState({
    this.currentIndex = 0,
    // this.thisIndex = 0,
    this.token = '',
    this.warehouse = const {},
    // this.medicines = const {},
  });
}

class RegisterAction {
  final String url;
  final Map body;

  RegisterAction({required this.url, required this.body});
}

class GetWarehouseAction {
  final String url;
  final String? token;
  final Map warehouse;
  GetWarehouseAction(
      {this.url = '', this.token = '', this.warehouse = const {}});
}
// class GetMedicinesAction {
//   final String url;
//   final String token;
//   final Map medicines;
//   GetMedicinesAction({this.url = '', this.token = '', this.medicines = const {}});
// }

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
// class ClickWarehouseAction {
//   final int thisIndex;
  
//   ClickWarehouseAction(this.thisIndex);
// }

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
      print("got dataaa: ${json.decode(response.body)}");
      next(GetWarehouseAction(warehouse: json.decode(response.body)));
    }else {
      // handle error
    }
  } 
  // else if (action is GetMedicinesAction) {
  //   var response = await get(
  //     Uri.parse(action.url),
  //     headers: {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer ${store.state.token}"
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     print("the response medicens is: ${response.body}");
  //     next(GetMedicinesAction(medicines: json.decode(response.body)));
  //   } else {
  //     // handle error
  //   }
  // }
    else {
    next(action);
  }
}

AppState reducer(AppState prev, dynamic action) {
  if (action is NavClickAction) {
    return AppState(currentIndex: action.currentIndex);
  } else if (action is LoginAction) {
    return AppState(token: action.token);
  } else if (action is GetWarehouseAction) {
    return AppState(warehouse: action.warehouse);
  } 
  // else if (action is ClickWarehouseAction) {
  //   print("the index is: ${action.thisIndex}");
    // return AppState(thisIndex: action.thisIndex);
  //   else if (action is GetMedicinesAction) {
  //   return AppState(medicines: action.medicines);
  // } 
  else {
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
