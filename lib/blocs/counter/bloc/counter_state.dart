part of 'counter_bloc.dart';
//* Counter Bloc이 다룰 상태를 정의합니다

@immutable
class CounterState {
  final int count;

  const CounterState(
    this.count,
  );
}
