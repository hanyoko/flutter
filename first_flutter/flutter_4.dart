/*
11/10 복습

final 변수는 실행시점에 값을 결정하는 반면, const 변수는 컴파일 타임에 값을 결정합니다.
이러한 차이로 인해 const 변수는 런타임 성능이 더 좋습니다.
Dart에서는 final 변수를 사용하여 값을 한 번만 할당할 수 있도록 하여 프로그램의 안정성을 높일 수 있으며, const 변수는 컴파일 타임에 값을 계산하여 런타임 성능을 향상시킬 수 있습니다.


---

//#4.3

//Named Constructor

class Player {
  final String name;
  int xp, age;
  String team;
  
  Player({
    required this.name, 
    required this.xp, 
    required this.team, 
    required this.age,
  });

  Player.createBluePlayer({
    required String name, 
    required int age,
  }) : this.age = age,
       this.name = name,
       this.team = 'blue',
       this.xp = 0;
  
   Player.createRedPlayer(String name, int age)
     : this.age = age,
       this.name = name,
       this.team = 'red',
       this.xp = 0;
  
  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var player = Player.createBluePlayer(
    name: "Yohan",
    age: 12,
  );
  
  var redPlayer = Player.createRedPlayer("han", 10,);
}


---

#4.4 Recap

class Player {
  final String name;
  int xp;
  String team;

  Player.fromJson(Map<String, dynamic> playerJson)
      : name = playerJson['name'],
        xp = playerJson['xp'],
        team = playerJson['team'];

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var apiData = [
    {
      "name": "ko",
      "team": "red",
      "xp": 0,
    },
    {
      "name": "yo",
      "team": "blue",
      "xp": 0,
    },
    {
      "name": "han",
      "team": "green",
      "xp": 0,
    },
  ];

  apiData.forEach((playerJson) {
    var player = Player.fromJson(playerJson);
    player.sayHello();
  });
}



apiData 의 각각 Object 아이템을 playerJson 이라 칭하고, fromJson 생성자의 파라미터로 3번 반복하여 전달한다. fromJson 생성자에서 playerJson[’name’] 문법은 Object에서 해당 key값에 대응하는 value를 가져오는 것이다.


---


#4.5

class Player {
  String name;
  int xp;
  String team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
  });

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var han = Player(name: 'han', xp: 1200, team: 'red');
  han.name = 'yohan';
  han.xp = 1200000;
  han.team = 'blue';
}

간단하게 수정

void main() {
  var han = Player(name: 'han', xp: 1200, team: 'red')
  ..name = 'yohan'
  ..xp = 1200000
  ..team = 'blue';
}

변수 han을 적는 것 대신 ".." operater을 사용하면 코드를 단축시킬 수 있다.


class Player {
  String name;
  int xp;
  String team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
  });

  void sayHello() {
    print("Hi my name is $name");
  }
}


*Cascade operator

void main() {
  var han = Player(name: 'han', xp: 1200, team: 'red');
  var potato = han
    ..name = 'yohan'
    ..xp = 1200000
    ..team = 'blue'
    ..sayHello();
}

//Hi my name is yohan


---

Enums

실수를 만들지 않도록 도와준다
dart에서 enum type을 만드는 법은 다음과 같다

enum Team { red, blue }
enum XPLevel { beginer, medium, pro }

class Player {
  String name;
  XPLevel xp;
  Team team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
  });

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var han = Player(
    name: 'han',
    xp: XPLevel.beginer,
    team: Team.red,
  );
  var potato = han
    ..name = 'yohan'
    ..xp = XPLevel.pro
    ..team = Team.blue
    ..sayHello();
}


---

Abstract Classes

추상화 클래스는 다른 클래스들이 직접 구현 해야하는 메소드들을 모아놓은 일종의 `청사진`이라 보면 된다.
추상 클래스에서는 기능을 구현하지 않는다.

abstract class Human {
  void walk();
  
}

enum Team { red, blue }
enum XPLevel { beginer, medium, pro }

class Player extends Human {
  String name;
  XPLevel xp;
  Team team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
  });

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var han = Player(
    name: 'han',
    xp: XPLevel.beginer,
    team: Team.red,
  );
  var potato = han
    ..name = 'yohan'
    ..xp = XPLevel.pro
    ..team = Team.blue
    ..sayHello();
}


abstract 를 생성하고 class에 extends 해주면 
Error: The non-abstract class 'Player' is missing implementations for these members:
 - Human.walk
이러한 오류가 발생 
why? Player는 walk란 메소드를 가지고 있지 않기 때문

*extends (상속, 확장)


추상 클래스는 다른 클래스들이 직접 구현해야 하는 필드와 메소드들을 모아놓은 클래스이다.
추상 클래스는 아직 메소드와 내용이 추상적이므로 객체를 생성할 수 없다.
추상 클래스를 상속받는 클래스들은 추상 클래스의 메소드들을 구현해야 한다.
예제를 통해 추상 클래스에 대해 알아보자.
abstract class Person { // 추상 클래스
void walk(); // 메소드의 반환값만 설정
}
class Player extends Person { // 추상 클래스를 상속받음. walk라는 메소드를 구현해야 함
String name;
int xp;
String team;

Player({required this.name, required this.xp, required this.team});

void walk() { // 추상 메소드 재정의
print("Player is walking");
}

void sayHello() {
print("Hi my name is $name");
}
}

class Coach extends Person { // 추상 클래스를 상속받음
void walk() { // 추상 메소드 재정의
print("Coach is walking");
}
}

void main() {
var player = Player(name: 'coma', xp: 1700, team: 'blue');
var coach = Coach();
player.walk();
coach.walk();
}

그럼 추상 메소드가 필요한 이유는 무엇일까?
공통된 필드와 메소드를 통일하기 때문이다.
클래스가 여러 개일 경우에는 전에 사용했던 필드 및 메소드와 이름과 규격이 달라질 수 있다. 추상클래스는 필드와 메소드를 같은 이름과 규격으로 만들게 함으로써 통일성을 유지해준다.

*/