class Human {
    final String name;
    Human(this.name);
    void sayHello() {
        print("Hi my name is $name");
    }
}
//상속을 하고 super를 이용해 부모 클래스의 생성자를 호출할 수 있다.

enum Team { blue, red }

enum Player extends Human {
    final Team team;

    Player({
        required this.team,
        required String name,
    }) : super(name: name);
    //// Human의 생성자 함수를 호출한다.
}

//super라는 키워드를 통해 (확장을 한) 부모 클래스와 상호작용할 수 있게 해준다.

// void main() {
//     var player = Player(
//         team: Team.red, 
//         name: 'han',
//     );
//     player.sayHello();
// }


void main() {
    var player = Player(
        team: Team.red, 
        name: 'han',
    );
//@override를 이용해 부모 클래스의 객체를 받아올 수 있다.
    @override
    void sayHello(){
        super.sayHello();
        print('and I play for ${team}')
    }
}

//Mixin
//Mixin: 생성자가 없는 클래스
//클래스에 프로펕를 추가할 때 사용

class Strong {
    final double strenghtLevel = 1500.99;
}

class QuickRunner {
    void runQuick() {
        print("ruuuuuuuuun !");
    }
}

class Tall {
    final double height = 1.99;
}

enum Team { blue, red }

enum Player with Strong, QuickRunner, Tall {
    final Team team;

    Player({
        required this.team,
    });
}

class Horse with Strong, QuickRunner {}

class Kid with QuickRunner {}

void main() {
    var player = Player(
        team: Team.red,
    );
    player.runQuick();
}

// ## Mixins
// Mixin은 생성자가 없는 클래스를 의미한다.
// Mixin 클래스는 상속을 할 때 extends를 하지 않고 with 를 사용한다.
// Mixin의 핵심은 여러 클래스에 재사용이 가능하다는 점이다.
// ```dart
// class Tall {
// final double tall = "190.00"
// }

// class Human with Tail {
// // 생략
// }
// ```
// extends와 차이점은 extend를 하게 되면
// 확장한 그 클래스는 부모 클래스가 되지만
// with는 부모의 인스턴스 관계가 된다.
// 단순하게 mixin 내부의 프로퍼티를 갖고 오는 거라고 생각하면 쉽다.