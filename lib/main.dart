import 'package:flutter/material.dart';
import "package:bloc_app/screens/screen_home.dart";
import "package:bloc_app/screens/screen_counter.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:bloc_app/blocs/counter/bloc/counter_bloc.dart";

void main() {
  runApp(const MyApp());
}

//* flutter_bloc: 정의한 bloc을 UI와 연결하기 위한 패키지
//* bloc을 받아 UI를 구성하는 위젯을 빌드하고 bloc객체를 사용하게 해줍니다

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //* bloc을 앱 전역에 제공합니다
    //* bloc을 받아서 사용하는 위젯은 screen위젯, 컴포넌트 위젯 등 모든 위젯이 가능합니다
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => HomeScreen(),
          "/counter": (context) => CounterScreen(),
        },
      ),
    );
  }
}
