# bloc_provider

Bloc(Business Logic Component) 디자인 패턴: MVC패턴과 유사

Model: A data model
Repository: A set of actions taken with respect to the corresponding model
View: Flutter Widgets used to draw the UI

Bloc ≈ Controller 
State와 Event로 구성되어 있음

State는 본질적으로 변화하는 데이터를 말하고, 따라서 데이터 영역(Model, Repository)에서 다루게 됩니다
변화된 State는 View에 전달되어 Widget이 새로운 State로 build가 되어야하는데, 이 전달하는 영역이 Bloc이 됩니다.
즉 Bloc은 Model로부터 State를 받아와 화면에 전달하거나, UI가 직접 변화시킨 State를 모델에 전달하는 등 상태 관리를 맡게 됩니다.

Event는 UI가 State를 직접 변화시킬 때 사용됩니다. 다시 말해 본질적으로 상태의 변화는 UI에서의 이벤트가 발생시킵니다.
이런 이벤트는 앱 전역에서 발생할 수 있고(= 전역상태관리), 이 이벤트들은 Stream이라고 하는 "앱을 가로지르는" 강을 떠다닙니다.

구현해야 할 3요소:
1. State: 어떤 데이터를 상태로 볼 것인지 정의해야 함
2. Event: UI가 어떤 종류의 이벤트를 가질 수 있는지 정의해야 함
3. Bloc: UI의 이벤트와 모델의 상태를 처리할 수 있는 객체를 만들어야 함

UI에서 이벤트를 생성하는 장치(버튼 등)이 있고 변화된 상태하는 위젯이 있으면
BlocBuilder와 BlockProvider.of<Bloc>(context).add(이벤트) 가 당연히 같이 존재할 수 있습니다.