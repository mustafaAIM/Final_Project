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
import 'package:flutter1/mootaz/welcome.dart';
import 'package:flutter1/yazan/home.dart';
import 'package:flutter1/yazan/orderDetailsPage.dart';
import 'package:flutter1/yazan/reports.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:http/http.dart';
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
  String url;
  String header;
  Map body;
  String token;

  AppState(
      {this.currentIndex = 0,
      this.url = '',
      this.body = const {},
      this.header = '',
      this.token = ''});
}

// AppState.initialState() : _currentIndex = 0,_url='';

class NavClickAction {
  final int currentIndex;

  NavClickAction(this.currentIndex);
}

class GetDataAction {
  final String url;
  final String header;

  GetDataAction({
    required this.url,
    this.header = '',
  });
}

class getTokenAction {
  final String Token;

  getTokenAction({required this.Token});
}

class PostDataAction {
  final String url;
  final String header;
  final Map body;

  PostDataAction({required this.url, this.header = '', required this.body});
}

AppState reducer(AppState prev, dynamic action) {
  if (action is NavClickAction) {
    return AppState(currentIndex: action.currentIndex);
  } else if (action is GetDataAction) {
    return AppState(url: action.url, header: action.header);
  } else if (action is PostDataAction) {
    return AppState(url: action.url, header: action.header, body: action.body);
  } else if (action is getTokenAction) {
    return AppState(token: action.Token);
  } else {
    return prev;
  }
}

// Define a middleware
void DataMiddleware(Store store, action) async {
  if (action is PostDataAction) {
    var response = await post(
      Uri.parse(action.url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(action.body),
    );
    if (action.url == "http://127.0.0.1:8000/api/login-pharmacist/") {
      print("Response token: ${response.body}");
      store.dispatch(getTokenAction(Token: jsonDecode(response.body)['token']));
    }
  } else if (action is GetDataAction) {
    print(
        "header: {  Content-Type: application/json; charset=UTF-8,Authorization: Bearer ${store.state.token}");

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
    } else {
      // If the server returns an unsuccessful response code, then throw an exception.
      // throw Exception('Failed to load data');
    }

    print("Response Body: ${response.body}");
  }
}

class MyApp extends StatelessWidget {
  final store =
      Store(reducer, initialState: AppState(), middleware: [thunkMiddleware]);
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