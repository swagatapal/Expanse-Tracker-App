import 'package:bloc/bloc.dart';
import 'package:expanse_tracker/app.dart';
import 'package:expanse_tracker/screens/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDXJmTV4yfyK8ZycG90cl80CFBrA_cZn0k',
      appId: '1:816783182490:android:bb40bbd269fa451693ad23',
      messagingSenderId:'816783182490' ,
      projectId: 'expense-tracker-7b345',
    )
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}



