import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
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
  final store =
      Store(reducer, initialState: AppState(), middleware: [DataMiddleware]);

  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'ar']); // get last saved language
  // remove await if you want to get app default language
  runApp(MyApp(store: store));
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

  AppState copyWith({
    List? cart,
    int? currentIndex,
    int? index,
    int? indexPhoto,
    String? token,
    Map? warehouse,
    Map? medicines,
  }) {
    return AppState(
      cart: cart ?? this.cart,
      currentIndex: currentIndex ?? this.currentIndex,
      index: index ?? this.index,
      indexPhoto: indexPhoto ?? this.indexPhoto,
      token: token ?? this.token,
      warehouse: warehouse ?? this.warehouse,
      medicines: medicines ?? this.medicines,
    );
  }
}

class RegisterAction {
  final String url;
  final Map body;

  RegisterAction({required this.url, required this.body});
}

class addToCartAction {
  final String name;
  final String price;
  final String id;
  final int quantity;

  addToCartAction(
      {required this.quantity,
      required this.id,
      required this.name,
      required this.price});
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

  NavClickAction({
    this.currentIndex = 0,
  });
}

class DiscardAction {
  final int index;
  DiscardAction({required this.index});
}

class choosewarehouseAction {
  final int index;
  choosewarehouseAction({required this.index});
}

class chooseitemAction {
  final int index;
  chooseitemAction({required this.index});
}

class UpdateAmountAction {
  final int index;
  final int amount;

  UpdateAmountAction({required this.index, required this.amount});
}

class removefromcartAction {
  final int index;

  removefromcartAction({required this.index});
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
    print(response.body);
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
  print('red');
  if (action is NavClickAction) {
    return prev.copyWith(
      currentIndex: action.currentIndex,
    );
  } else if (action is UpdateAmountAction) {
    List list = prev.cart;
    if (action.amount <= prev.cart[action.index]['quantity'])
      list[action.index]['amount'] = action.amount;
    return prev.copyWith(cart: list);
  } else if (action is choosewarehouseAction) {
    return prev.copyWith(index: action.index, currentIndex: 4);
  } else if (action is chooseitemAction) {
    return prev.copyWith(indexPhoto: action.index);
  } else if (action is LoginAction) {
    return prev.copyWith(token: action.token);
  } else if (action is GetWarehouseAction) {
    return prev.copyWith(warehouse: action.warehouse);
  } else if (action is addToCartAction) {
    Map newItem = {
      'id': action.id,
      'name': action.name,
      'price': action.price,
      "amount": 0,
      "quantity": action.quantity
    };

    // Create a new cart by adding the new item to the existing cart
    List newCart = List.from(prev.cart);

    if (!newCart.any((map) => mapEquals(map, newItem))) {
      newCart.add(newItem);
    }
    return prev.copyWith(cart: newCart);
  } else if (action is removefromcartAction) {
    List newCart = List.from(prev.cart);
    newCart.removeAt(action.index);
    return prev.copyWith(cart: newCart);
  } else if (action is DiscardAction) {
    return prev.copyWith(cart: const [], currentIndex: 4, index: action.index);
  } else {
    return prev;
  }
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({required this.store});
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
