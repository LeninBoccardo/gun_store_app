import 'package:flutter/material.dart';
import 'package:gun_store_app/image/imagePicker.dart';
import 'screens/about.dart';
import 'screens/accessoryP.dart';
import 'screens/developer.dart';
import 'screens/info.dart';
import 'screens/product.dart';
import 'screens/login.dart';
import 'screens/main.dart';
import 'screens/register.dart';
import 'screens/signUp.dart';
import 'screens/numbers.dart';
import 'screens/vehicleP.dart';
import 'screens/weaponP.dart';
import 'screens/aRegister.dart';
import 'screens/vRegister.dart';
import 'screens/wRegister.dart';


void main() => runApp(GunStoreApp());

class GunStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/main': (context) => MainScreen(),
        '/info': (context) => InfoScreen(),
        '/product': (context) => ProductScreen(),
        '/developer': (context) => Developer(),
        '/about': (context) => About(),
        '/image': (context) => ImageTest(),
        '/register': (context) => RegisterScreen(),
        '/singUp': (context) => SingUpScreen(),
        '/numbers': (context) => NumbersScreen(),
        '/weapon': (context) => WeaponScreen(),
        '/vehicle': (context) => VehicleScreen(),
        '/accessory': (context) => AccessoryScreen(),
        '/vRegister': (context) => VehicleRegisterScreen(),
        '/aRegister': (context) => AccessoryRegisterScreen(),
        '/wRegister': (context) => WeaponRegisterScreen(),
      },
    );
  }
}
