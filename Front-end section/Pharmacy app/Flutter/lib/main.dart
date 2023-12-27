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
   String body;
  // int get currentIndex => _currentIndex;
  // String get url => _url;

  AppState({
    this.currentIndex = 0,
    this.url = '',
    this.body = '',
    this.header = ''
    });

  // AppState.initialState() : _currentIndex = 0,_url='';
}

class NavClickAction {
  final int currentIndex;

  NavClickAction(this.currentIndex);
  
  // String get url => '';
  
}
class GetDataAction{
final String url;
final String header;

  GetDataAction(this.url, this.header,);
  
  // int get currentIndex => currentIndex;
  
  // int get currentIndex => _currentIndex;
  
  // String get url => _url; 
}
class PostDataAction{
final String url;
final String header;
final String body;


  PostDataAction(this.url, this.header, this.body); 
}

AppState reducer(AppState prev, dynamic action) {
  if (action is NavClickAction) {
    return AppState(currentIndex: action.currentIndex);
  }else if (action is GetDataAction) {
     return AppState(url : action.url,header: action.header);
  }else if(action is PostDataAction) {
     return AppState(url : action.url,header: action.header,body: action.body);
  }else{
     return prev;
  }
}

class MyApp extends StatelessWidget {
  final store = Store(reducer,
      initialState: AppState(), middleware: [thunkMiddleware]);
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
