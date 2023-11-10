void main() {
  var player = {
    'name': 'han',
    'xp': 19.99,
    'superpower': false,
  }
}

object

위와 같이 작성하는 것이 object
어떤 타입이든 작성할 수 있다.
한가지의 타입으로 작성하고 key 값을 확인하면 변경된다.

Dart에서는 모든 게 object로부터 생겨난다.
object는 기본적으로 어떤 자료형이든지 될 수 있다.
any와 같다.


void main() {
  Map<int, bool> player = {
       //key 값은 int, value 값은 bool
    1: true,
    2: false,
    3: true
//원하는만큼 늘려줄 수 있다.

  };
}


void main() {
  Map<List<int>, bool> player = {
	//key로 integer List, value로는 bool
    1: true,
    2: false,
    3: true
//그러면 1, 2, 3에 오류 발생
//integer이 아니라 integer list로 작성하라고
  };
}


void main() {
  Map<List<int>, bool> player = {
    [1, 2, 3, 5]: true,
  };
}


void main() {
  List<Map<String>, Object>> players = {
    {
      'name': 'han',
      'xp': 1999993.9999,
    },
    {
      'name': 'han',
      'xp': 1999993.9999,
    }
  };
}

//Map List 만들기



Maps
void main() {
var player = {
1: true,
2: false,
3 : true,
};
}

var을 사용하면 컴파일러가 key와 value를 유추해서 보여줌

Type이 Map

Key는 String, Value는 Object 형태
Dart에서는 모든 자료형이 Object로부터 생김 -> object는 기본적으로 어떤 자료형이든지 될 수 있음
혹은 명시적으로 정의할 수 있음
Map player = {}

void main() {
Map player = {
1: true,
2: false,
};
}
3번째 요소로 '3' : true를 주었을 때, key가 int가 아닌 String이므로 오류가 발생함.


// Map,String> 으로 복잡한 타입의 Map도 정의할 수 있음
void main() {
Map, String> player = {
[1, 2, 3, 6, 7]: "Jisoo",
[4, 5]: "Jeju",
};
print(player.keys);
}
// ([1, 2, 3, 6, 7], [4, 5])


---

Set

void main() {
  var numbers = {1, 2, 3, 4};
}

명확하게 작성하기 위해서

void main() {
  Set<int> numbers = {1, 2, 3, 4};
  numbers.add(1);
  numbers.add(1);
  numbers.add(1);
  print(numbers);
}

//{1, 2, 3, 4}


Set과 List의 차이점
Set에 속한 모든 아이템들은 유니크하다.
그래서 여러번 1을 추가해도 출력값을 확인하면 {1, 2, 3, 4} 그대로다.

*Set은 중괄호
*List는 대괄호

void main() {
  List<int> numbers = [1, 2, 3, 4];
  numbers.add(1);
  numbers.add(1);
  numbers.add(1);
  print(numbers);
}

//[1, 2, 3, 4, 1, 1, 1]

List를 사용하면 1이 추가된 것을 확인할 수 있다.


요소가 항상 하나씩만 있어야 되면 Set을 사용
unique 할 필요가 없다면 List를 사용

Dart에서 List는 Python의 List와 같고,
Dart에서 Set은 Python의 Tuple과 같다. / JavaScript의 Set


---

funtion


void 이 함수가 아무것도 return 하지 않는다는 의미


void sayHello(String name) {
  print("Hello $name nice to meet you !");
}

String sayHello(String name) {
  return "Hello $name nice to meet you !";
}

void main() {
  
}


String sayHello(String name) {
  return "Hello $name nice to meet you !";
}

void main() {
  print(sayHello('Han'));
}

//Hello Han nice to meet you !
//$name 값에 Han이 출력


String sayHello(String name) {
  return "Hello $name nice to meet you !";
}

을 단축문법으로

String sayHello(String name) => "Hello $name nice to meet you !";

중괄호와 return을 지우고 화살표 함수로 변경


String sayHello(String name) => "Hello $name nice to meet you !";

num plus(num a, num b) => a + b;

void main() {
  print(sayHello('Han'));
}


String sayHello(String name) => "Hello $name nice to meet you !";

num plus(num a, num b) => a + b;

void main() {
  print(sayHello('Han'));
  print(plus(1, 5));
}

//Hello Han nice to meet you !
//6	-> 1과 5를 더한 값


*함수 활용하기

String sayHello(String name, int age, String country){
  return "Hello $name, you are $age, and you come from $country";
}

void main() {
  print(sayHello('Han', 19, 'Canada'));
}

//Hello Han, you are 19, and you come from Canada



String sayHello({String name, int age, String country}){
  return "Hello $name, you are $age, and you come from $country";
}

void main() {
  print(sayHello(
    age: 12,
    country: 'Canada',
    name: 'Han',
  ));
}

이렇게 코드를 짜면 sayHello 함수의 name age country에 오류가 발생한다.
왜냐면 null이 되었을 때 기본값을 지정하지않아서.

따라서,

String sayHello({String name = 'anon', int age = 0, String country = 'Korea'}){
  return "Hello $name, you are $age, and you come from $country";
}

void main() {
  print(sayHello(
    age: 12,
    country: 'Canada',
    name: 'Han',
  ));
}

//Hello Han, you are 12, and you come from Canada
//main에서의 순서는 관계없다

String sayHello({String name = 'anon', int age = 0, String country = 'Korea'}){
  return "Hello $name, you are $age, and you come from $country";
}

void main() {
  print(sayHello(
    age: 12,
  ));
}

//Hello anon, you are 12, and you come from Korea
//이렇게 모든 값을 부여하지 않아도 기본값이 출력된다.


*required modifier

required를 작성하면 sayHello가 항상 호출될 때 반드시 지정된 key가 값을 할당 받아야 한다는 걸 알게 된다.



String sayHello({
  required String name,
  required int age,
  required String country,
}) {
  return "Hello $name, you are $age, and you come from $country";
}

void main() {
  print(sayHello(
    age: 12,
    country: 'Canada',
    name: 'Han',
  ));
}


String sayHello({
  required String name,
  required int age,
  required String country,
}) {
  return "Hello $name, you are $age, and you come from $country";
}

void main() {
  print(sayHello(
    age: 12,
    country: 'Canada',
  ));
}

//required 를 입력한 key에 값이 할당되지 않으면 오류를 발생시킨다.
//Required named parameter 'name' must be provided.

*default value와 required
몇몇 function들은 default value를 주는 것이 불가능할 수 있다.
사용자가 데이터를 전달하지 않으면 동작하지 않는 function들 같은 경우이다.
예를 들어, 사용자가 로그인을 할 때 이메일이나 비밀번호를 default value로 줄 수는 없다.
이런 경우에는 required modifier을 주면 된다.


---

#3.3

String sayHello(String name, int age, String country) =>
  'Hello $name, you are $age years old from $country';

void main() {
  sayHello('Han', 2, 'Canada');
}

만약 named argument를 적용하고 싶지 않은데 country는 required 하지 않게 하려면 ?



String sayHello(
  String name,
  int age,
  [String? country = 'Canada']
) =>
  'Hello $name, you are $age years old from $country';

void main() {
  var result = sayHello('Han', 2);
  print(result);
}


//Hello Han, you are 2 years old from Canada


그러면 파라미터에 옵셔널을 설정하려면 어떻게 해야 할까?
매우 간단하다. ?(물음표)를 타입 뒤에 붙이면 된다.
인자를 보내지 않아도 기본 값을 가지게 하려면 다음과 같이 하면 된다.
```dart
String sayHello(
  String name,
  int age,
  // default value
  [String? country = "korea"],
) => return "Hello $name, age: $age, country $country";

void main(){
  print(sayHello({
  name: "jisoung",
  age: 17,
  country: "korea",
  });
}


---

#3.4


String capitalizeName(String? name) {
  if (name != null) {
    return name.toUpperCase();
  }
  return 'ANON'
}

void main() {
  capitalizeName('Han');
  capitalizeName(null);
}



String capitalizeName(String? name) => 
  name != null ? name.toUpperCase() : 'ANON';


void main() {
  capitalizeName('Han');
  capitalizeName(null);
}


??
question 혹은 QQ operator

left ?? right

//좌항과 우항이 있고 qq가 체크하는데 만약 좌항이 null이면 우항을 return한다.


??=

QQ equals 혹은 QQ assignment opreator

void main() {
  String? name;
  name ??= 'nico';
  name ??= 'another';
  print(name);
}

//nico

구동시키면 'nico'는 정상적으로 출력되지만, 'another'은 출력되지 않는다.
왜냐면 name의 값이 null이 아니기 때문에 'nico' 이후의 코드는 실행되지 않음

만약 값을 할당하려면,

void main() {
  String? name;
  name ??= 'nico';
  print(name);
  name = null;
  name ??= 'another';
  print(name);
}

//nico
//another

---

String capitalizeName(String name) => name.toUpperCase();

void main() {
capitalizeName('nico');
}

위 코드는 사용자가 소문자를 입력하면 대문자로 바꿔주는 함수를 호출해주는 코드이다.
이 코드에서 사용자가 null 값을 보내기 위해서는, 다음과 같이 쓸 수 있다.

String capitalizeName(String? name) {
  if(name != null) {
    return name.toUpperCase();
}
return 'ANON';

이를 더 간단하게 하면,

String capitalizeName(String? name) => name != null? name.toUpperCase() : 'ANON'; // 삼항연산자

이는 qq operator를 이용하면 더 간단하게 만들 수 있다.
String capitalizeName(String? name) => name?.toUpperCase() ?? 'ANON'; // name 자체가 null인 경우에는 toUpperCase를 호출할 수 없으므로 name 뒤에 ?를 붙임

다음 챕터로 넘어가기 전에 qq equals 또는 qq assignment operator를 설명하겠다.
void main() {
  String? name;
  name ??= 'nico'; // qq equals : name이 null이라면 nico를 할당
  name ??= 'wan';
  print(name); // warning이 나오면서 nico가 출력됨
}
warning을 없애주기 위해서는 name을 다시 null로 초기화 시켜주면 된다.

void main() {
  String? name;
  name ??= 'nico'; // qq equals : name이 null이라면 nico를 할당
  name = null;
  name ??= 'wan';
  print(name); // name에 wan이 할당되었으므로 wan이 출력됨
}


---

#3.5

typedef
자료형에 사용자가 원하는 alias를 붙일 수 있게 해준다. (자료형 이름의 별명을 만들 때 사용)

자료형이 헷갈릴 때 도움이 될 alias을 만드는 방법
typedef는 자료형에 alias를 붙일 수 있게 해준다.
나중에 큰 파일이나 긴 코드를 만났을 때 유용하다는 걸 알 수 있다.


List<int> reverseListOfNumbers(List<int> list) {
  var reversed = list.reversed;
  return reversed.toList();
}

void main() {
  
}

typedef를 사용하면 아래와 같이 사용할 수 있다.

typedef ListOfInts = List<int>;

ListOfInts reverseListOfNumbers(ListOfInts list) {
  var reversed = list.reversed;
  return reversed.toList();
}

void main() {
  print(reverseListOfNumbers([1,2,3]));
}

//[3, 2, 1]



MAP의 typedef 만들기
예를 들어 사용자에게 인사하는 function을 만드는데, 사용자가 함수에게 주는 data보다 더 구체적으로 구조를 만들고싶다


String sayHi(Map<String, String> userInfo) {
  return "Hi ${userInfo ['name']}";
}
void main() {
  
}


typedef UserInfo = Map<String, String>;

String sayHi(UserInfo userInfo) {
  return "Hi ${userInfo ['name']}";
}
void main() {
  sayHi({"name": 'Han'});
}

typedef는 좀 더 간단한 데이터의 alias를 만들 때 사용하는 녀석이다.


typedef를 쓰면 뭐가 좋은가 !

[[[ typedef를 사용하지 않은 경우 ]]]

type을 명확하게 하려면 아래의 List int 처럼 일일이 int다 라는 걸 명시를 해줘야 한다.

List int reverseList1(List int list) {
...
}


[[[ typedef를 사용하는 경우 ]]]

아래와 같이 List int를 자기가 쓰고 싶은 명칭(Listofint)으로 한번 정의를 해주면,
typedef Listofint = List int;

그 다음부터는,
List int 처럼 일일이 int라고 명시해줄 필요 없이, Listofint라고 써주기만 하면 된다.

# 댓글에 코드 예를 쓸 때 angle brackets를 사용하면 escpae되버리는지 angle brackets으로 감싼 내용 전체가 표시가 안 된다.


---

#4.0

class
Flutter에서는 모든 게 class


class Player {
  String name = 'han';
  int xp = 1500;
}

void main() {
  var player = Player();
  print(player.name);
  player.name = 'lalala';
  print(player.name);
}

//han
//lalala


만약, Player의 name을 바꾸지 못하게 하고 싶으면 어떻게 해야될까 ?

class Player {
  final String name = 'han';
  int xp = 1500;
}

void main() {
  var player = Player();
  print(player.name);
  player.name = 'lalala';
  print(player.name);
}

final 입력하면 player.name = 'lalala';에서 오류 출력
final은 변수가 아닌 상수라서 값을 변경할 수 없다.


class Player {
  final String name = 'han';
  int xp = 1500;

  void sayHello() {
    var name = '121';
    print("Hi my name is $name");
  }
}

void main() {
  var player = Player();
  player.sayHello();
}

//Hi my name is 121


class 안에 property를 고정시킬 때 final 이 아니고 const면 왜 안될까 잠깐 고민했었습니다. 어차피 final로 고정시킬경우 컴파일 전에 알고 있는 값이 아닌가, 그럼 const도 되는거 아닌가란 생각이 들었거든요. 그래서 final을 const로 바꿔봤더니 const는 static field에서만 사용 가능하다고 에러가 뜨네요. static이 앞에 붙으면 const가 가능해집니다. static 선언을 하게 되면 property가 instance가 아닌 class 자체에 귀속되게 되어 instance를 만들지 않아도 property 확인이 바로 가능합니다.(아래는 예시)
class Player {
static const String species = 'human'; //변경불가
static String planet = 'earch'; //변경가능
final String name = 'JS'; //변경불가
String job = 'Housekeeper'; //변경가능
}
void main() {
print(Player.species);
print(Player.planet);
var player = Player();
print(player.name);
print(player.job);
}


그렇군요, 이해하기 어려운 부분에 대해 질문해주셔서 감사합니다. Dart 언어에서 const와 final의 차이점을 설명해보겠습니다.

const는 컴파일 타임에 이미 알려진, 즉 변경할 수 없는 값을 나타내며, 메모리에 한 번 할당되면 변경할 수 없습니다. 이러한 이유로 const는 클래스의 인스턴스 변수로 사용할 수 없습니다. 이는 각 인스턴스는 실행 중에 생성되고 값이 할당되는데, 이것이 const의 컴파일 시점에 결정되어야 하는 조건과 상충합니다.

그러나 const는 클래스 레벨에서 사용될 수 있습니다. 이런 변수는 'static'으로 선언되어야 합니다. 이는 클래스 자체에 연결되어 있으며, 이 클래스의 모든 인스턴스에서 동일하게 참조됩니다. const로 선언된 변수는 한 번 설정되면 변경할 수 없습니다.

반면에 final 변수는 한 번만 설정할 수 있지만, 그 값은 런타임에 결정될 수 있습니다. 이는 객체 인스턴스화를 통해 값이 할당될 수 있음을 의미합니다. final 변수는 각 인스턴스마다 고유한 값을 가질 수 있으므로, 클래스의 인스턴스 변수로 설정할 수 있습니다.

따라서, Dart에서 const는 static 필드에서만 사용 가능한 이유는 const 값이 컴파일 시점에 결정되어야 하고, 이는 각 인스턴스의 런타임 값과는 다르기 때문입니다. 그러나 final은 런타임에 값이 결정되기 때문에, 인스턴스 변수로 사용될 수 있습니다.

---

#4.1

class Player {
  late final String name;
  late int xp;
  
  Player(String name, int xp) {
    this.name = name;
    this.xp = xp;
  }

  void sayHello() {
    var name = '121';
    print("Hi my name is $name");
  }
}

void main() {
  var player = Player("han", 1500);
  player.sayHello();
}

name 과 xp에 오류가 발생
-> 값을 주지 않아서

late를 넣어주면 오류 해결 -> 나중에 값을 넣어줄 것이다


class Player {
  late final String name;
  late int xp;
  
  Player(String name, int xp) {
    this.name = name;
    this.xp = xp;
  }

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var player = Player("han", 1500);
  player.sayHello();
  var player2 = Player("ko", 2500);
  player2.sayHello();
}

//Hi my name is han
//Hi my name is ko


constructors


class Player {
  final String name;
  int xp;
  
  Player(this.name, this.xp);

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var player = Player("Yohan", 1500);
  player.sayHello();
  var player2 = Player("Owen", 2500);
  player2.sayHello();
}

//Hi my name is Yohan
//Hi my name is Owen


late 를 사용하지 않아도 되는 이유를 예측해본다면, 다음과 같습니다.

생성자 Player(this.name, this.xp) 를 정의하고 해당 클래스의 인스턴스를 생성한다면
1. 프로퍼티 또한 할당됨과 동시에 초기화가 이루어질 것 같습니다.
ex : Player('nico', 1500) 는 final String name = 'nico'; int xp = 1500;
과 동일할 것 같습니다.

만약 그렇지 않고, 다음과 같이 생성자를 정의하고 해당 클래스의 인스턴스를 생성한다면
Player(String name, int xp) { this.name = name; this.xp = xp; }
1. 프로퍼티가 초기화 되지 않은 상태로 할당 될 것 같습니다.
2. 이후 인자들을 받아 프로퍼티 초기화를 진행할 것 같습니다.

결론적으로 할당과 초기화가 동시에 이루어지느냐 아니냐의 차이로 late 키워드의 사용이 정해지는 것 같습니다.

근데 이 부분은 크게 중요하지 않습니다. ayaan 님이 올려주신 stackoverflow 링크를 보시면 late 는 꼭 필요할 때만 사용하기를 권장하기 때문입니다. 그래서 너무 late 의 유무에 초점을 두지 마시고, 상황에 따라 그리고 코드의 목적을 명확하게 나타내야 할 때 사용된다고 알아두면 될 것 같습니다.

---

#4.2

class Player {
  final String name;
  int xp;
  String team;
  int age;
  
  Player({this.name, this.xp, this.team, this.age});

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var player = Player(
    name: "Yohan",
    xp: 1500, 
    team: 'red', 
    age: 12);
  
  var player2 = Player("Owen", 2500, 'blue', 12);
}




class Player {
  final String name;
  int xp;
  String team;
  int age;
  
  Player({this.name, this.xp, this.team, this.age});

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var player = Player(
    name: "Yohan",
    xp: 1500, 
    team: 'red', 
    age: 12,
  );
  
  var player2 = Player(
    name: "Owen", 
    xp: 2500, 
    team: 'blue', 
    age: 12,
  );
}



class Player {
  final String name;
  int xp;
  String team;
  int age;
  
  Player({
    required this.name, 
    required this.xp, 
    required this.team, 
    required this.age
  });

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var player = Player(
    name: "Yohan",
    xp: 1500, 
    team: 'red', 
    age: 12,
  );
  
  var player2 = Player(
    name: "Owen", 
    xp: 2500, 
    team: 'blue', 
    age: 12,
  );
}



클래스가 거대해질 경우 위와 같이 생성자 함수를 만드는 것은 비효율적일 것이다.
예를 들어보면
```dart
class Team {
  final String name;
  int age;
  String description;

  Team(this.name, this.age, this.description);
}

void main(){
// 너무 많은 인자를 받아야 해서 헷갈린다.
// 거기다 각 인자의 의미를 알 수가 없다.
  var myTeam = Team("jisoung", 17, "Happy coding is end coding");
```

이 문제를 해결할려면 너무 간단하다.
첫 번째는 중괄호({})를 이용하는 것이다.

```dart
class Team {
  final String name;
  int age;
  String description;

  Team({this.name, this.age, this.description});
}

void main(){
// 한 눈에 볼 수 있다.
  var player = Player(
  name: "jisoung",
  age: 17,
  description: "Happy coding is end coding"
  }
}
```
두 번째는 name parameter를 사용하는 것이다.
```dart
// 생략
Player(name:"jisoung", age: 17, description: "Happy coding is end coding");
```
하지만 여기에는 큰 문제가 있다.
변수가 null일 수도 있기 때문에 우리는 이걸 required를 이용하거나 기본 값을 줘서 처리해 줘야한다. 우리는 required를 사용할 것이다.

```dart
// 생략
Team({
  required this.name,
  required this.age,
  required this.description,
});,
```
훨씬 좋아졌다.