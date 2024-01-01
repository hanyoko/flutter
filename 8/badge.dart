// 알림 배지 위치 수정

// 변경 전
override
  Widget build(BuildContext context) {
    // 처리해야할 fcm 이 있는지 확인 및 처리
    _checkRemainFcm();

    Widget badge = InkResponse(
        onTap: () {
            Frame.pagePush(context, const ScreenNoticeList());
            
            setState(() {
                _badgeCount = 0;
            });
        },
        child: Container(
            padding: const EdgeInsets.fromLTRB(FixedPadding.md / 2, FixedPadding.sm, FixedPadding.layoutMargin, FixedPadding.sm),
            child: Badge.Badge(
            badgeColor: COLOR_RED,
            showBadge: _badgeCount > 0,
            toAnimate: false,
            position: Badge.BadgePosition.topEnd(top: -2, end: 0),
            // badgeContent:  
            //   Text('$_badgeCount', style: Fonts.bottomNavBar(color: Colors.white),
            // ),
            child: const Icon(Icons.notifications_none, color: COLOR_OUTLINE_ICON, size: FixedSize.iconMd)
            )
        )
    );
}


// 변경 후
Widget badge = InkResponse(
      onTap: () {
        Frame.pagePush(context, const ScreenNoticeList());
        
        setState(() {
          _badgeCount = 0;
        });
      },
      child: Stack(
        children: [
            Container(
                padding: const EdgeInsets.fromLTRB(FixedPadding.md / 2, FixedPadding.sm, FixedPadding.layoutMargin, FixedPadding.sm),
                child: const Icon(Icons.notifications_none, color: COLOR_OUTLINE_ICON, size: FixedSize.iconMd),
            ),
            Positioned(
                top: FixedPadding.sm,
                right: FixedPadding.layoutMargin,
                child: SizedBox(  // 배지에 width와 height 값을 지정하기 위해서 사용
                    width: FixedSize.badgeRoundXsXs * 2,
                    height: FixedSize.badgeRoundXsXs * 2,
                    child: Badge.Badge(
                        badgeColor: COLOR_RED,
                        showBadge: _badgeCount > 0,
                        toAnimate: false,
                        // badgeContent:  
                    //   Text('$_badgeCount', style: Fonts.bottomNavBar(color: Colors.white),
                    // ),
                    ),
                ),
            ),
        ],
    )
);