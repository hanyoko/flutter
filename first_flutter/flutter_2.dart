main 함수
모든 Dart 프로그램의 Entry point
main 함수에서 코드가 호출된다.

; 세미콜론을 무조건 작성해야 오류가 발생하지않는다. - 주의


dart의 변수
var라는 키워드를 쓰고 할당하고자 하는 값을 넣어주면 된다.

var name = '요한';

변수는 업데이트 할 수 있다
하지만, 할당하는 값의 타입이 동일해야한다.

var = name = '요한';
name = '1'; 불가능
name = 'yohan'; 가능

*변수를 선언할 때 var를 사용할 수도 있고 넣어줄 데이터의 타입을 사용할 수도 있다.
String name = '요한';
name = 'yohan';

var 키워드를 사용했을 때 데이터의 타입이 동일하다면, 변수의 값을 업데이트 할 수 있다


dynamic
여러가지 타입을 가질 수 있는 변수에 쓰는 키워드
사용하는게 추천되지는 않지만 때때로 유용하다.

var something;

dynamic something
local variable

 
var something;
  something = 'yohan';
  something = 1;
  something = true;


void main() {
  var name = '요한';
  
  print(name);
  
  name = 'yohan';
  print(name);
  
  var something;
  something = 'yohan';
  something = 1;
  something = true;
}


null은 부재 즉, 아무것도 있지 않음을 뜻한다


void main() {
  String han = 'han';
  han = null;
  
}

이상태에서는 null에 오류가 발생한다.

void main() {
  String? han = 'han';
  han = null;
  
}

타입 옆에 ?를 붙여주면 오류가 사라진다.
han 변수가 String일 수도, null일 수도 있다는 걸 dart가 알기 때문이다.

void main() {
  String? han = 'han';
  han = null;
  if (han != null) {
    han.isNotEmpty;
  }
}

변수 han이 null인지 아닌지 파악


하지만 위와 같이 작성하면 시간이 오래 걸리기 때문에

void main() {
  String? han = 'han';
  han = null;
  han?.isNotEmpty;
}

이렇게 단축문법을 사용한다.


---
1.4

void main() {
  String name = 'han';
  name = 'yohan';
  name = 12;
}

변수 name은 String 타입으로 지정되었다.
그리고 변수이기 때문에 타입이 동일하다면 값을 변경할 수 있다.
물론 타입이 다른 numbet 타입의 값을 입력하면 변경이 불가능하다.

하지만, 값을 변경할 수 없도록 만드는 상수가 있다. javascript의 const 같은 상수 final

final
한 번 정의된 변수를 수정할 수 없게 만드는 상수 

void main() {
  final name = 'han';
  name = 'yohan';
  name = 12;
}

error
line 3 • The final variable 'name' can only be set once. (view docs)
Try making 'name' non-final.
error
line 4 • The final variable 'name' can only be set once. (view docs)
Try making 'name' non-final.
error
line 4 • A value of type 'int' can't be assigned to a variable of type 'String'. (view docs)
Try changing the type of the variable, or casting the right-hand type to 'String'.
warning
line 2 • The value of the local variable 'name' isn't used. (view docs)
Try removing the variable or using it.

상수의 값을 변경하려고 하면 오류를 출력시킨다.

void main() {
  final name = 'han';
}


late
final이나 var 앞에 붙여줄 수 있는 수식어
late는 초기 데이터 없이 변수를 선언할 수 있게 해준다.

void main() {
  late final String name = 'han';
}

정확히 해주려면 타입도 함께 써주면 좋다

void main() {
  late final String name;
  // API 요청으로 데이터를 받은 다음
  // 그 데이터를 나중에 변수에 넣는다.
  name = 'han';
}

데이터 없이 변수를 만들어주고
필요한 데이터가 아직 없을 수도 있으니까
API에서 데이터를 받아 변수에 넣어주는 것이다.

void main() {
  late final String name;
  // API 요청으로 데이터를 받은 다음
  // 그 데이터를 나중에 변수에 넣는다.
  name = 'han';
  //name은 final 상수이기에 값을 변경할 수 없다.
  //late를 사용하면 변수를 먼저 만들고 데이터를 나중에 넣어줄 수 있다.
  print(name);
}



Dart의 const는 js와 ts의 const와는 다르다.
js와 ts의 const는 Dart의 final과 비슷하다.

Dart에서의 const는 compile-time constant를 만들어준다.
final과 같이 수정이 불가능하다.
가장 중요한 건, const는 compile-time에 알고 있는 값이어야 한다는 것.

void main() {
  //const API = '121212';
  const API = fetchApi();
}

이렇게 사용하면 이건 compile-time constant가 아니다.
컴파일러는 API 변수의 값을 모른다
API에서 받아와야하는 값이기 때문
그래서 API의 값은 const가 되면 안 되고, final이 맞다
const는 컴파일 할 때 알고 있는 값에 사용하는 것
앱스토어에 앱을 올리기 전에 알고 있는 값이라는 것
만약 앱스토어에 앱을 올리기 전에 알고 있는 값이라면 const를 사용가능
하지만, 어떤 값인지 모르고, 그 값이 API로부터 온다거나 
사용자가 화면에서 입력해야 하는 값이라면 그건 final이나 var가 되어야 한다,


void main() {
  const max_allowed_price = 120;
}
이렇게 앱에서 사용할 상수들이 있다면 이렇게 const를 써주면 된다.


void main() {
  String name = "han";	//String
  bool alive = true;		//true / fasle를 값으로 가지는 bool 자료형
  int age = 12;		//int 숫자 자료형
  double money = 69.99;	//소수점 작성가능한 double 자료형
}

void main() {
  String name = "han";
  bool alive = true;
  int age = 12;
  double money = 69.99;
  
  num x = 12;
  x = 1.1;
}

void main() {
  //var numbers = [1, 2, 3, 4];
  List<int> numbers = [1, 2, 3, 4];
  numbers.add(1);
  print(numbers);
}



void main() {
  var giveMeFive = true;
  var numbers = [
    1, 
    2,
    3,
    4,
    if(giveMeFive) 5
  ];
  print(numbers);
}


//[1, 2, 3, 4, 5]


String interpolation
text에 변수를 추가하는 방법

void main() {
  var name = 'Han';
  var greeting = 'Hello everyone, my name is $name, nice to meet you !';
  print(greeting);
}

//Hello everyone, my name is Han, nice to meet you !



void main() {
  var name = 'Han';
  var age = 10;
  var greeting = "Hello everyone, My name is $name and I'm $age";
  print(greeting);
}

//Hello everyone, My name is Han and I'm 10

void main() {
  var name = 'Han';
  var age = 10;
  //var greeting = "Hello everyone, My name is $name and I'm ${age + 2}";
  var greeting = "Hello everyone, My name is $name and I\'m ${age + 2}";
  print(greeting);
}

//I'm처럼 '(작은따옴표)를 사용할 때는 역슬래시\를 사용해주면 오류처리가능


void main() {
var oldFriends = ['han', 'ko'];
  var newFriends = [
    'lewis',
    'ralph',
    'darren',
    ];
  
    for (var friend in oldFriends) "❤ $friend";
  print(newFriends);
}


//[lewis, ralph, darren]


void main() {
var oldFriends = ['han', 'yohan'];
  var newFriends = [
    'lewis',
    'ralph',
    'darren',
    for (var friend in oldFriends) "❤ $friend",
    ];
  print(newFriends);
}

//[lewis, ralph, darren, ❤ han, ❤ yohan]