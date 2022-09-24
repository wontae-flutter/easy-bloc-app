import 'dart:async';
//* 모델의 state와 UI의 이벤트를 기반으로 실제 로직을 처리하는 곳
//* state, event 파일의 존재이유는 bloc에서 로직을 편하게 작성하도록 이름만 정의한 것 뿐
//* 블록은 이벤트로 인한 상태 변화를 Stream으로 제공하므로, Stream 문법이 적용됩니다

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

//* Bloc의 기본 메소드
//* 이벤트를 인자로 받아서 해당 이벤트에 따라 상태를 변화시키는 로직을 가지고 있습니다.
//* 변화된 상태는 Stream객체로 앱 전역에 전달됩니다(main.dart에서 BlocProvider에 CounterBloc을 등록했기 때문)
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0));
  @override
  //* async*: 앞으로 yield를 이용헤 지속적으로 데어터를 전달하겠다는 의미

  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is CounterIncrement) {
      yield CounterState(state.count + 1);
    } else if (event is CounterDecrement) {
      yield CounterState(state.count - 1);
    }
  }
}
