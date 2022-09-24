part of 'counter_bloc.dart';
//* Bloc에 입력으로 들어갈 이벤트들을 정의하는 곳
//* 여기서의 이벤트는 실제로 동작을 수행하는 함수가 아니고, 어떤 종류의 이벤트인지 그 이름만을 정의합니다(≈추상클래스)

@immutable
abstract class CounterEvent {
  const CounterEvent();
}

class CounterIncrement extends CounterEvent {
  const CounterIncrement();

  @override
  String toString() => "[+] CounterIncrement";
}

class CounterDecrement extends CounterEvent {
  const CounterDecrement();

  @override
  String toString() => "[-] CounterDecrement";
}
