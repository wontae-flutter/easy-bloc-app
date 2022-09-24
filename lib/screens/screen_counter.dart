import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:bloc_app/blocs/counter/bloc/counter_bloc.dart";

//* 카운터스크린은 이벤트(Counter의 증감)을 일으키는 위젯입니다.
//* 이벤트는 Bloc객체를 통해 발생시킵니다 => 블록빌더 필요
//* main.dart에서 앱 전역에 제공했던 프로바이더를 BlocProvider.of(context)로 조회합니다.
class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Screen"),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Count : ' + state.count.toString()),
                TextButton(
                  onPressed: () {
                    //* BlocProvider.of(타겟블록)메소드로 블록을 찾고
                    //* 블록은 add로 UI에서의 이벤트를 전달합니다
                    BlocProvider.of<CounterBloc>(context)
                        .add(CounterIncrement());
                  },
                  child: Text('[+] Increment'),
                ),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context)
                        .add(CounterDecrement());
                  },
                  child: Text('[-] Increment'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
