//data를 가져올 때 웹의 줄바꿈이 앱에 적용 되지 않는 오류 해결

MyHtml.build(
	data: _item.contents ?? '',
	bLinkTap: true
),

//Text로 변경 ...
Expanded(
	child: Text(_item.contents ?? ''),
)

//간단한 건데 한참을 찾았다 .. 다음엔 바로 활용 .. !