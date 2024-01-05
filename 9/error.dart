// 파라미터 오류

════════ Exception caught by widgets ═══════════════════════════════════════════
Closure call with mismatched arguments: function '_ScreenChatRoomState._buildChatInput.<anonymous closure>'
Receiver: Closure: (dynamic, dynamic) => dynamic
Tried calling: _ScreenChatRoomState._buildChatInput.<anonymous closure>(Instance of 'StatefulElement')
Found: _ScreenChatRoomState._buildChatInput.<anonymous closure>(dynamic, dynamic) => dynamic
═══════════════

// 변경 전
onSubmit : (context, _)

// 변경 후
onSubmit : (context)

// 엄청 간단한 오류였는데 이상한 곳에서 헤맸다 ....