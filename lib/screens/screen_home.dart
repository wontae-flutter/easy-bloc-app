import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:bloc_app/blocs/counter/bloc/counter_bloc.dart";

//* 이벤트는 UI에서 Bloc 객체를 통해 접근합니다.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      //* 블록빌더는 스트림을 계속 주시하고 있어서 상태변화를 감지하고, 상태가 변화되면
      //* 그에 맞춰 UI를 다시 빌드합니다
      //* StatefulWidget이 아니라 Stateless임에도 변화를 감지해서 build 메소드를 실행시킬 수 있는 이유
      body: BlocBuilder<CounterBloc, CounterState>(
        buildWhen: (previous, current) => previous.count != current.count,
        builder: (context, state) {
          return Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Count : ' + state.count.toString()),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/counter");
                },
                child: Text("Go to CounterScreen"),
              ),
            ]),
          );
        },
      ),
    );
  }
}
