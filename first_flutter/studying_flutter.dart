/*
Dart


최상위 함수 main()

void main() {
print('Hello World !');


변수 설정
var
final
const


흐름 제어문
if / else if / else
for / for in ...
while / break / continue / swithch / case / assert
*/

//주석
//Dart의 주석 => //

//---
//<1강>

void main() {
	runApp(const MyApp());
}

//ex)
class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home:	
		)
	}
}

//1. 글자 넣을 때 Text()

return MaterialApp(
	home: Text('안녕')
);

//2. 아이콘 넣을 때는 Icon(Icons.아이콘이름)

return MaterialApp(
	home: Icon(Icons.shop)
);

//3. 이미지 넣을 때는 Image.asset('경로')

return MaterialApp(
	Image.asset('경로')
);

//ex)
return MaterialApp(
	home: Image.asset('assets/dog.png')	//폴더명은 생략가능하다.
);

//4. 네모박스 넣을 때는 Container()

return MaterialApp(
	home: Container( width: 50, height: 50, color: Colors.blue )
			//너비: 50 높이: 50 색은 파란색으로 주겠다.
			//50의 단위는 px(픽셀)이 아니라 lp => flutter의 사이즈 단위
			//50LP == 1.2cm
);

//5. 내 자식 위젯의 기준점을 중앙으로 설정해주는 Center()

return MaterialApp(
	home: Center(
		child: Container( width: 50, height: 50, color: Colors.blue ),
		//child를 사용하면 자식의 컨테이너에 설정 가능
	)
);

//---
//<2강>

//6. 상중하로 나눠주는 Scaffold()

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(					//Scaffold()를 사용해서 상중하를 나눈다.
				appBar: AppBar(),				//상단에 들어갈 위젯 ex)인스타그램의 nav
				body: Container(),				//중단에 들어갈 위젯 ex) 인스타그램의 피드
				bottomNavigationBar: BottomAppBar(),	//하단에 들어갈 위젯 ex) 인스타그램의 footer
			)
		)
	}
}


//7. 여러 위젯 가로로 배치하는 법

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(					//Scaffold()를 사용해서 상중하를 나눈다.				//상단에 들어갈 위젯 ex)인스타그램의 nav
				body: Container(
					child: Icon(Icons.start),	
				)
			)
		)
	}
}


*
class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(					//Scaffold()를 사용해서 상중하를 나눈다.				//상단에 들어갈 위젯 ex)인스타그램의 nav
				body: Container(
					child: Icon(Icons.start),	
						child: Icon(Icons.start),	//여러 개의 child 사용은 불가능
				)
			)
		)
	}
}


//8. 여러 위젯 가로로 배치하는 법 Row( children: [] )

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(					//Scaffold()를 사용해서 상중하를 나눈다.				
				body: Row(
						children: [
							Icon(Icons.start),
							Icon(Icons.start),
							Icon(Icons.start),
						],
					)
				)
			)
		)
	}
}


//9. 여러 위젯 세로로 배치하는 법 Column( children: [] )

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(					//Scaffold()를 사용해서 상중하를 나눈다.				
				body: Column(
                    children: [
                        Icon(Icons.start),
                        Icon(Icons.start),
                        Icon(Icons.start),
                    ],
                )
            )
        )
		
	}
}



//9. Row, Column 정렬하기

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(								
				body: Row(
                    mainAxisAlignment: MainAxisAlignment.center,	//가로 정렬 spaceEvenly ... *display: flex와 유사
                    crossAxisAlignment: CrossAxisAlignment.center,	//세로 정렬
                    children: [
                        Icon(Icons.start),
                        Icon(Icons.start),
                        Icon(Icons.start),
                    ],
                )
            )
        )
	}
}

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(								
				body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,	//파라미터 우측에 뭐 넣을지 까먹으면 파라미터 위에 마우스 올리면 뜬다
                    children: [
                        Icon(Icons.start),
                        Icon(Icons.start),
                        Icon(Icons.start),
                    ],
                )
            )
        )
	}
}



class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home:	Scaffold(
				appBar: AppBar( title: Text('앱임') ),
				body: Text('안녕'),
				bottomNavigationBar: BottomAppBar(
					child: Container(	//BottomAppBar 높이 조절
						height: 70,
						child: Row(

							mainAxisAlignment: MainAxisAlignment.center.spaceEvenly,
							children: [
								Icon(Icons.phone),
								Icon(Icons.message),
								Icon(Icons.contact_page),
							]
						)
					),
				),
			)
		)
	}
}


//SizedBox - width, height, child만 필요한 박스는 SizedBox()

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home:	Scaffold(
				appBar: AppBar( title: Text('앱임') ),
				body: Text('안녕'),
				bottomNavigationBar: BottomAppBar(
					child: SizedBox(	//BottomAppBar 높이 조절
						height: 70,
						child: Row(

							mainAxisAlignment: MainAxisAlignment.center.spaceEvenly,
							children: [
								Icon(Icons.phone),
								Icon(Icons.message),
								Icon(Icons.contact_page),
							]
						)
					),
				),
			)
		)
	}
}



class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(
				body: Container(
					width: 50, height: 50, color: Colors.blue,
					margin: EdgeInsets.all(20),
					padding: EdgeInsets.all(20),
					child: Text('ddddd'),
			    )
		    )
        )
	}
}


//박스에 일부 여백 주는 법

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(
				body: Container(
					width: 150, height: 50, color: Colors.blue,
					//margin: EdgeInsets.fromLTRB(left, top, right, bottom)
					margin: EdgeInsets.fromLTRB(0, 30, 0, 0)
			    )
		    )
        )
	}
}


//박스에 테두리 주는 법 decoration

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(
				body: Container(
					width: 150, height: 50, color: Colors.blue,
					//margin: EdgeInsets.fromLTRB(left, top, right, bottom)
					margin: EdgeInsets.fromLTRB(0, 30, 0, 0)
					decoration: BoxDecoration(
						border: Border.all(color: Colors.black)
					)
                )
			)
		)
	}
}


//박스 위치 정렬

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(
				body: Align(
					alignment: Alignment.topCenter,
					child: Container(
						width: double.infinity, height: 50, color: Colors.blue,
					),
				),
			)
		)
	}
}


/*
글자 디자인 하는 법 - style: TextStyle()
색 주는 법
1. Colors.칼라명
2. Color(0xffaaaaaa)
3. Color.fromRGBO()
*/

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(
                appBar: AppBar( title: Text('앱임') ),
                body: SizedBox(
                    child: Text('안녕하세요',
                        style: TextStyle( color: Color(0xffaaaaaa). ),
                        style: TextStyle( color: Color.fromRGBO(r, g, b, opacity) ),
                    ),
                )
            ),
        )
	}
}

//*font

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(
                appBar: AppBar( title: Text('앱임') ),
                body: SizedBox(
                    child: Text('안녕하세요',
                        style: TextStyle( fontSize: 30 ),
                    ),
                )
            ),
        )
	}
}



class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(
                appBar: AppBar( title: Text('앱임') ),
                body: SizedBox(
                    child: Text('안녕하세요',
                        style: TextStyle( background: ),
                        style: TextStyle( fontWeight: FontWeight.w700 ),
                    ),
                )
            ),
        )
	}
}


*Icon

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(
                appBar: AppBar( title: Text('앱임') ),
                body: SizedBox(
                    child: Icon(Icons.star, color: ~),
                ),
            )
        ),
	}
}

//버튼 디자인 하는 법

/*button
TextButton()
IconButton()
ElevatedButton()
*/

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(
                appBar: AppBar( title: Text('앱임') ),
                body: SizedBox(
                    child: TextButton(	//ElevatedButton
                        child: Text('글자'),
                        onPressed: (){},
                        style: ButtonStyle(
                        ),
                    ),
                ),
            )
        ),
    }
}


class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(
                appBar: AppBar( title: Text('앱임') ),
                body: SizedBox(
                    child: TextButton(	//ElevatedButton
                        icon: Icon(Icons.star)
                        onPressed: (){},
                    ),
                ),
            )
        ),
	}
}

/*
AppBar 디자인 하는 법
AppBar() 안에 넣을 수 있는 것들
title: 왼쪽 제목
leading: 왼쪽에 넣을 아이콘
*/

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(
                appBar: AppBar( title: Text('ddd'), ),
                body: SizedBox(),
                
            ),
        )
	}
}

/*
레이아웃 혼자서 잘 짜는 법
1. 예시 디자인 준비
2. 네모로 보이는 건 네모 그리기
3. 바깥 네모부터 하나하나 위젯으로
4. 마무리 디자인


*박스 폭을 50%로 설정하려면 ?
-> Flexible()로 감싸야 한다.
*/

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(
                appBar: AppBar(),
                body: Row(
                    children: [
                        //Flexible( child: child),
                        //Container(),
                        Flexible( child: Container(color: Colors.blue), flex: 3),
                        Flexible( child: Container(color: Colors.green), flex: 7),
                        Flexible( child: Container(color: Colors.red), flex: 5),	//만약 3분의 1로 하려면 전부 flex: 5
                    ],
                ),
                
            ),
        )
	}
}



//*Row() 안에서 박스 하나만 꽉 채우고 싶으면 Expanded()

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(
                appBar: AppBar(),
                body: Row(
                    children: [
                        Expanded( child: Container(color: Colors.blue), flex: 3),	//flex: 1 가진 Flexible 박스와 똑같다
                        Container(width: 100, color: Colors.green),
                    ],
                ),
                
            ),
        )
	}
}


/*
박스 디자인 했는데 의도와 다르다면 ?
1. 사이즈가 이상해서 그렇다.
2. 박스 위치가 이상해서 그렇다.
*/


class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(
                appBar: AppBar(),
                body: Container(
                    height: 150,
                    padding: EdgeInsets.all(20),
                    child: Row(
                        childred: [
                            Image.asset('camera.jpg', width: 150, ),
                            Container(
                                width: 300,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAligment.start,
                                    children: [
                                        Text('카메라팝니다.', style: TextStyle(), ),
                                        Text('금호동 3가'),
                                        Text('7000원'),
                                        Text('아이콘이랑 글자')
                                        Row(
                                            maxAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                                Icon(Icons.favorite),
                                                Text('4'),
                                            ],
                                        )
                                    ]
                                )
                            )
                        ]
                    )
                    
                ),
                
            ),
        )
	}
}


/*
레이아웃용 위젯들이 너무 길다면 ?
-> 한 단어로 깔끔하게 축약가능
*/

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(
				appBar: AppBar(),
				body: SizedBox(
					child: Text('안녕'),
				),
			)
		)
	}
}



class ShopItem extends StatelessWidget {
	const ShopItem( {Key? key} ) : super(key: key);

	@override
	//build 가 있어야 함수로 인정
	Widget build(BuildContext context) {
		return SizedBox(
			child: Text('안녕'),
		);
	}
}



class ShopItem extends StatelessWidget {
	const ShopItem( {Key? key} ) : super(key: key);

	@override
	//build 가 있어야 함수로 인정
	build(context) {
		return SizedBox(
			child: Text('안녕'),
		);
	}
}



var a = SizedBox(
	child: Text('안녕');
)

class ShopItem extends StatelessWidget {
	const ShopItem({Key? key}) : super(key : key);
	@override
	Widget build(BuildContext context) {
	
		return MaterialApp(
			home: Scaffold(
				appBar: AppBar(),
				body: a,		//변수에 값을 담아서 작성 -> 변하지 않는 UI들은 변수, 함수로 축약가능하다 (축약해도 상관없음)
			)
		)
	}
}

/*
아무거나 다 커스텀 위젯화 X
재사용 많은 UI들 O
큰 페이지들 O
*/


//앱이 보여줄 항목이 100개면 ?

class ShopItem extends StatelessWidget {
	const ShopItem( {Key? key} ) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				appBar: AppBar(),
				body: ListView(
					children: [
						Text('안녕'),
						Text('안녕'),
						Text('안녕'),
						Text('안녕'),
						Text('안녕'),
						Text('안녕'),
					]
				)
			)
		);
	}
}

/*
*
ListView() 안에 넣으면 스크롤바 생김
스크롤 위치 감시도 가능하고
메모리 절약기능도 있다.

11번가, 쿠팡 등과 같은 긴 목록들이 나열되어 있는 어플리케이션은 전부 ListView()로 구현
*/